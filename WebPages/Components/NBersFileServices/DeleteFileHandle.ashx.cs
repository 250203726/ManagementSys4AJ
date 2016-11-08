using N_Bers.Business.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business.Model;
using N_Bers.Business.Core;
using System.IO;

namespace WebPages.Components.NBersFileServices
{
    /// <summary>
    /// DeleteFileHandle 的摘要说明
    /// </summary>
    public class DeleteFileHandle : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string fileGuidList = context.Request.Form["fileids"];


            List<AttachmentsModel> attList = (new AttachmentsBLL()).Query(string.Format("id in ({0})", fileGuidList));

            foreach (AttachmentsModel item in attList)
            {
                var rootPath = N_Bers.Business.Core.Public.GetBaseDirectory();
                var filePath = Path.Combine( item.Location , item.FileName);
                var fullPath = Path.Combine(rootPath,filePath);
                File.Delete(fullPath);
                item.Delete();
            }

            bool delSucessed = (new AttachmentsBLL()).DeleteByIDs(fileGuidList) > 0 ? true : false;
            if (delSucessed)
            {
                var result = new MyHttpResult(true, "");
                context.Response.Write(result.ToString());
            }
            else
            {
                var result = new MyHttpResult(false, "删除文件失败，请联系管理员！");
                context.Response.Write(result.ToString());
            }
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