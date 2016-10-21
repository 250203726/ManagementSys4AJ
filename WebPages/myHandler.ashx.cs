using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using Wonder4.Map.Extensions;

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
                case "GETMENU":
                    retJsonStr = GetMenu();
                    break;
                case "GETUSERS":
                    retJsonStr = GetUsers();
                    break;
                default:                   
                    break;
            }
            context.Response.Write(retJsonStr);
        }

        private string GetUsers()
        {
            List<MyUser> list = (new MyUserBLL()).Query("");
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };

            return JsonExtensions.ToJson(grid);
        }

        private string GetMenu()
        {
            MenuBLL mb = new MenuBLL();

            List<MyMenu> list = mb.Query("");
            var grid = new {
                Rows = list,
                Total = list.Count
            };

            return JsonExtensions.ToJson(grid);

        }

        
    }
}