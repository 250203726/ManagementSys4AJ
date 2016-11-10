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

            bool delSucessed = (new AttachmentsBLL()).DeleteByIDs(fileGuidList) > 0 ? true : false;
            if (delSucessed)
            {
                var result = new MyHttpResult(true, "删除成功！");
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