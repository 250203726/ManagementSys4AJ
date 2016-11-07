using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Wonder4.Map.Extensions;

namespace WebPages.Components.NBersFileServices
{
    /// <summary>
    /// N_Bers 的摘要说明
    /// </summary>
    public class FileHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        private const string rootPath = "/UpFiles/";
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string docName = context.Request.Files[0].FileName;

            string fileName = DateTime.Now.ToFileTime() + Path.GetExtension(docName);
            string fkGuid = context.Request.Form["fkGuid"];//文档所属的业务主键标识
            string relativePath=string.Empty;

            string sFileName = GenerateFileName(fileName);

            string sFilePath = CreateDirectory("", ref relativePath);

            HttpPostedFile hpf = context.Request.Files[0];

            AttachmentsModel attModel = new AttachmentsModel();

            UserModel userModel = (UserModel)N_Bers.Business.Core.Public.User_Info;

            attModel.CreateBy = userModel.id;
            attModel.CreateUser = userModel.nickname;
            attModel.CreateOn = DateTime.Now;
            attModel.DocName = docName;
            attModel.FileName = sFileName;
            attModel.FkGUID =Convert.ToInt32( fkGuid);

            attModel.Location = relativePath;
            attModel.Filesize = hpf.ContentLength.ToString();

            try
            {
                hpf.SaveAs(Path.Combine(sFilePath, sFileName));
                attModel.Insert();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            string fileRelativePath = Path.Combine(relativePath, sFileName);
            var fileResponse = new {
                DocName=attModel.DocName,
                FielSize=attModel.Filesize,
                Path= Path.Combine(relativePath, sFileName),
                CreateBy=attModel.CreateUser,
                Ext= Path.GetExtension(docName),
            };
            context.Response.Clear();
            context.Response.Write(JsonExtensions.ToJson(fileResponse));
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        private string GetUpfilesPath()
        {
            string targetFolder = HttpContext.Current.Server.MapPath("~" + rootPath);
            return targetFolder;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sSubDir"></param>
        /// <returns></returns>
        public string CreateDirectory(string sSubDir,ref string relativePath)
        {
            if (sSubDir.IndexOf("../")==0 )
            {
                return string.Empty;
            }

            string sDir = DateTime.Now.ToString("yyyyMM")+"/";
            relativePath = Path.Combine(rootPath, sDir);
            if (!string.IsNullOrEmpty(sSubDir))
            {
                sDir += sSubDir;
            }
            string sFullPath = GetUpfilesPath() + sDir;

            if (!Directory.Exists(sFullPath))
            {
                try
                {
                    Directory.CreateDirectory(sFullPath);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return sFullPath;
        }


        public string GenerateFileName(string sFileName) {
            string sName = Path.GetFileNameWithoutExtension(sFileName);
            string sExpName = Path.GetExtension(sFileName);
           return string.Concat(sName ,"(", (new Random()).Next(1000, 10000).ToString() ,")", sExpName);
        }
    }


}