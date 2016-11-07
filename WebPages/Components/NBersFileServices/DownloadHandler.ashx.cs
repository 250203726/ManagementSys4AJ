using N_Bers.Business.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace WebPages.Components.NBersFileServices
{
    /// <summary>
    /// DownloadHandler 的摘要说明
    /// </summary>
    public class DownloadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string[] fileGuidList = context.Request.QueryString["fileids"].Split(',');
            string[] downloadUrl =(new AttachmentsBLL()).GetDownLoadFiles(fileGuidList);

            DownloadFile(downloadUrl);

        }



        public void DownloadFile(string[] fileInfo)
        {
            //string downloadUrl = ProcessAttachMentProxy.DownloadFile(fileGuidList);
            //如果是多文件，则使用批量下载
            if (fileInfo.Length > 1)
            {
               // BatchDownload(fileInfo);
            }
            else
                SingleDownload(fileInfo[0]);
        }

        #region 单个文件下载
        private void SingleDownload(string fileInfo)
        {
            string strFilePath = string.Empty;
            string strDocName;
            try
            {
                strFilePath = fileInfo.Split('|')[0];
                strDocName = fileInfo.Split('|')[1];

                strFilePath = HttpContext.Current.Server.MapPath(strFilePath);
                if (!File.Exists(strFilePath))
                {
                    HttpContext.Current.Response.Status = "404 Not Found";
                    HttpContext.Current.Response.Write("物理文件不存在");
                    return;
                }
                //取实际文档扩展名
                string strExtension = Path.GetExtension(strFilePath).ToLower();
                if (strExtension.StartsWith("."))
                {
                    strExtension = strExtension.Substring(1);
                }


                //网页文件类型时，设置text/html为响应头内容类型
                if (strExtension == "htm" || strExtension == "html" || strExtension == "mht")
                    HttpContext.Current.Response.ContentType = "text/html";
                else
                    HttpContext.Current.Response.ContentType = "application/octet-stream";

                //指定作为附件下载，不在 IE 中直接打开
                HttpContext.Current.Response.AddHeader("Content-Disposition", "filename = \"" + this.GetEscapeDocName(strDocName, 113) + "\";");

                //获取web.config中配置的分段下载下限
                string splitDownloadSizeConfig = System.Configuration.ConfigurationManager.AppSettings["SplitDownloadSize"];
                long splitDownloadSize = string.IsNullOrEmpty(splitDownloadSizeConfig) ? 40960 * 1024 : Convert.ToInt32(splitDownloadSizeConfig) * 1024;
                //获取文件实际大小
                long fileSize = 0;
                FileWebResponse response = null;
                try
                {
                    response = (FileWebResponse)HttpWebRequest.Create(strFilePath).GetResponse();
                    fileSize = response.ContentLength;
                }
                catch (System.Exception ex)
                {
                    HttpContext.Current.Response.Write("下载过程中发生异常:" + ex.Message);
                }
                finally
                {
                    if (response != null)
                    {
                        response.Close();
                    }
                }
                //文件实际大小小于分段下载下限直接下载
                if (fileSize < splitDownloadSize)
                {
                    HttpContext.Current.Response.WriteFile(strFilePath);
                    //HttpContext.Current.Response.End();
                    //文件实际大小大于等于分段下载下限分段下载
                }
                else
                {
                    Stream stream = null;
                    byte[] buffer = new Byte[10000];
                    int length;
                    long dataToRead;
                    //Dim fileName As String = Path.GetFileName(strFilePath)
                    try
                    {
                        stream = new FileStream(strFilePath, FileMode.Open, FileAccess.Read, FileShare.Read);
                        dataToRead = stream.Length;
                        while (dataToRead > 0)
                        {
                            if (HttpContext.Current.Response.IsClientConnected)
                            {
                                //分段下载
                                length = stream.Read(buffer, 0, 10000);
                                HttpContext.Current.Response.OutputStream.Write(buffer, 0, length);
                                HttpContext.Current.Response.Flush();
                                buffer = new Byte[10000];
                                dataToRead = dataToRead - length;
                            }
                            else
                            {
                                //客户端在没有下载完前，关闭连接，直接设置为-1,避免死循环
                                dataToRead = -1;
                            }
                        }
                    }
                    catch (System.Exception ex)
                    {
                        HttpContext.Current.Response.Write("下载过程中发生异常:" + ex.Message);
                    }
                    finally
                    {
                        if (stream != null)
                        {
                            stream.Close();
                        }
                    }
                }
            }
            catch (System.Exception ex)
            {
                HttpContext.Current.Response.Write("下载过程中发生异常:" + ex.Message);
                HttpContext.Current.Response.End();
            }
        }
        #endregion


        //获取附件名称。同时截断附件名称，使它使用utf-8编码后不超过指定字符数
        public string GetEscapeDocName(string docName, int maxLength)
        {
            if (string.IsNullOrEmpty(docName))
            {
                return string.Empty;
            }
            //当IE版本高于7.0时,不做截断操作,返回原始名称
            if (!CheckIsLowIEVersion())
            {
                return Uri.EscapeUriString(docName);
            }
            return EscapeDocName(docName, maxLength);
        }

        /// <summary>
        /// 检查是否低版本IE
        /// </summary>
        /// <returns></returns>
        /// <remarks>IE7及以下版本生成临时文件时会进行URL编码,导致文件名超长,需要进行截断处理</remarks>
        private static bool CheckIsLowIEVersion()
        {
            string ieVersion = GetRequestIEVersion();
            double fIeVersion = Convert.ToDouble(ieVersion);
            if (fIeVersion <= 7.0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #region 私有方法
        /// <summary>
        /// 获取IE版本号
        /// </summary>
        /// <returns></returns>
        /// <remarks></remarks>
        public static string GetRequestIEVersion()
        {
            HttpBrowserCapabilities browserInfo = HttpContext.Current.Request.Browser;
            return browserInfo.Version;
        }
        #endregion
        //获取附件名称。同时截断附件名称，使它使用utf-8编码后不超过指定字符数
        public string EscapeDocName(string docName, int maxLength)
        {
            string strTmp;
            //使用Uri.EscapeUriString函数不会出现把空格转为"+"的问题
            strTmp = Uri.EscapeUriString(docName);
            if (strTmp.Length <= maxLength)
                return strTmp;
            string ext = System.IO.Path.GetExtension(docName);
            //含.的拓展名
            string fileName = System.IO.Path.GetFileNameWithoutExtension(docName);
            maxLength = maxLength - Uri.EscapeUriString(ext).Length;
            //总长度减扩展名的长度
            StringBuilder sb = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            Int32 len;
            string s;
            foreach (char c in fileName)
            {
                len = sb.Length;
                s = Uri.EscapeUriString(c.ToString());
                if (len + s.Length <= maxLength)
                {
                    sb.Append(s);
                    sb2.Append(c);
                    if (sb.Length == maxLength)
                        break;
                }
                else
                {
                    break;
                }
            }
            return sb.ToString() + ext;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}