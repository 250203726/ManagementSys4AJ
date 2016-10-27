using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Wonder4.Map.Extensions;
using System.IO;
using System.Web.UI.WebControls;
using N_Bers.Business;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;

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
            string onlyPara = context.Request.QueryString["strkey"];
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
                    retJsonStr = GetUnits(onlyPara);
                    break;
                case "ADDUNIT":
                    retJsonStr = AddUnit(getPostStr(context));
                    break;
                case "TEST":
                    retJsonStr = test();
                    break;
                case "GETFIRSTLEVELUNIT":
                    retJsonStr = GetFirstLevelUnit();
                    break;
                case "GETUNITMODEL":
                    retJsonStr = GetUnitModel(onlyPara);
                    break;
                case "GETPARENTMENUSBYJSON":
                    retJsonStr = getParentMenusByJson();
                    break;
                case "GETSUBMENUSBYJSON":
                    retJsonStr = getSubMenusByJson();
                    break;
                default:                   
                    break;
            }
            context.Response.Write(retJsonStr);
        }

        private string GetFirstLevelUnit()
        {
           List<BusinessUnitModel> buList= (new MyUnitBLL()).Query(" ISNULL(pid,0)=0");
            return JsonExtensions.ToJson(buList);
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

            //UserModel um = (UserModel)Session["user_info"];
            

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

        private string GetUnits(string filter)
        {
            List<BusinessUnitModel> list = (new MyUnitBLL()).Query(filter);
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

        private string GetUnitModel(string id)
        {
            int iid = Convert.ToInt32(id);
            return JsonExtensions.ToJson((new MyUnitBLL()).GetModel(iid));
        }


        /// <summary>
        /// 获取用户一级菜单的json，给sidebarData
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private string getParentMenusByJson()
        {
            UserModel user = new UserModel();
            user.id = 1;//后面替换成参数
            return JsonExtensions.ToJson((new MenuBLL()).getParentMenus(user));
        }

        /// <summary>
        /// 获取用户所有子菜单的json，给navigateData
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        private string getSubMenusByJson()
        {
            UserModel user = new UserModel();
            user.id = 1;
            return JsonExtensions.ToJson((new MenuBLL()).getSubMenus(user));
        }

        //private string getButtonMenusByJson()
        //{
        //    UserModel user = new UserModel();
        //    user.id=1;
        //    return (new MenuBLL()).getButtonMenus(user, "5");
        //}
    }
}