using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business;
using N_Bers.Business.BLL;

namespace WebPages
{
    /// <summary>
    /// myHandler 的摘要说明
    /// </summary>
    public class myHandler : IHttpHandler
    {
        public bool IsReusable
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            string oprType = context.Request.QueryString["oprtype"];
            string retJsonStr = string.Empty;
            switch (oprType.ToUpper())
            {
                case "GETMUNE":
                    retJsonStr = GetMune();
                    break;
                default:                   
                    break;
            }
            context.Response.Write(retJsonStr);
        }

        private string GetMune()
        {
            MenuBLL mb = new MenuBLL();
            
            return mb.Query("id=49");

        }

        
    }
}