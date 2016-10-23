using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using Wonder4.Map.Extensions;
using System.IO;

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
                case "GETUNITS":
                    retJsonStr = GetUnits();
                    break;
                case "ADDUNIT":
                    retJsonStr = AddUnit(getPostStr(context));
                    break;
                case "TEST":
                    retJsonStr = test();
                    break;
                default:                   
                    break;
            }
            context.Response.Write(retJsonStr);
        }

        private string test()
        {
            UserModel um = new UserModel();

            um.account = "wonder4";
            um.nickname = "庄少东";
            um.password = "wwerwe";
            um.bind_account = "hbsnjzsd@1qc.com";
            um.email = "sdf";

            um.info = "12";

            return um.Insert().ToString();
        }

        #region 获取采用Post方式Send过来的值
        /// <summary>
        /// 功能：获取采用Post方式Send过来的值
        /// </summary>
        private string getPostStr(HttpContext context)
        {
            string requestMsg;
            using (StreamReader sr = new StreamReader(context.Request.InputStream))  
            {
                requestMsg = sr.ReadLine();
            }
            return requestMsg;
        }
        #endregion

        private string AddUnit(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return JsonExtensions.ToJson(new MyHttpResult {
                    result = false,
                    msg = "提交数据错误！"
                });
            }

            BusinessUnitModel bu = JsonExtensions.FromJson<BusinessUnitModel>(input);
            bu.createby = 1;
            bu.createon = DateTime.Now;
            bu.pid = 0;
            bu.unit_type = 0;
            bu.unit_fullname = bu.unit_name;

            return JsonExtensions.ToJson(new MyHttpResult
            {                
                result = bu.Insert() >0?true:false,
            });
        }

        private string GetUnits()
        {
            List<BusinessUnitModel> list = (new MyUnitBLL()).Query("");
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetUsers()
        {
            List<UserModel> list = (new MyUserBLL()).Query("");
            var grid = new
            {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        private string GetMenu()
        {
            List<MenuModel> list = (new MenuBLL()).Query("");
            var grid = new {
                Rows = list,
                Total = list.Count
            };
            return JsonExtensions.ToJson(grid);
        }

        
    }
}