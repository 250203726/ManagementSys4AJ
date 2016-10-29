﻿using N_Bers.Business.BLL;
using N_Bers.Business.Core;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wonder4.Map.Extensions;

namespace WebPages
{
    public partial class NB_JsonHttp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( null == Session[BaseConst.USERSESSION] || string.IsNullOrEmpty(Session[BaseConst.USERSESSION].ToString()))
            {
                Response.ContentType = "text/html";
                Response.Clear();
                Response.Write((new MyHttpResult(false,"登陆超时，请重新登陆！")).ToString());
                Response.End();
            }
            string oprType, onlyPara,retJsonStr=string.Empty;
            oprType = Request.QueryString["oprtype"];
            onlyPara = Request.QueryString["strkey"];
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
                    retJsonStr = AddUnit(getPostStr());
                    break;
                case "DELETEUNITS":
                    retJsonStr = DeleteUnits(onlyPara);
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
                case "GETALLMENUS":
                    retJsonStr = getAllMenus();
                    break;
                case "DELETEMENU":
                    retJsonStr = deleteMenu(onlyPara);
                    break;
                case "GETMENUBYID":
                    retJsonStr=getMenuById(onlyPara);
                    break;
                case "ADDMENU":
                    retJsonStr = addMenu(getPostStr());
                    break;
                default:
                    break;
            }
            Response.ContentType = "text/HTML";
            Response.Clear();
            Response.Write(retJsonStr);
            Response.End();
        }

        private string DeleteUnits(string onlyPara)
        {
            return (new MyHttpResult
            {
                result = true,
                msg = "操作成功，共删除 " + (new MyUnitBLL()).DeleteByIDs(onlyPara) + " 条数据。",
            }).ToString();
        }



        private string GetFirstLevelUnit()
        {
            List<BusinessUnitModel> buList = (new MyUnitBLL()).Query(" ISNULL(pid,0)=0");
            return (new MyHttpResult(true,buList)).ToString();
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
        private string getPostStr()
        {
            string requestMsg;
            using (StreamReader sr = new StreamReader(Request.InputStream))
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
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }

            //UserModel um = (UserModel)Session["user_info"];


            BusinessUnitModel bu = JsonExtensions.FromJson<BusinessUnitModel>(input);
            //var context = SystemContext.UserCode;
            var session = HttpContext.Current.Session;
            var userid =((UserModel)Session[BaseConst.USERSESSION]).id;
            bu.createby = Convert.ToInt32(1);
            bu.createon = DateTime.Now;

            bu.unit_fullname = bu.unit_name;

            int iResult;
            if (bu.id == 0)
            {
                iResult = bu.Insert();
            }
            else
            {
                iResult = bu.Update();
            }

            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = iResult > 0 ? true : false,
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
            var grid = new
            {
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

        /// <summary>
        /// 获取Menu列表传给MenuIndex显示
        /// </summary>
        /// <returns></returns>
        public string getAllMenus()
        {
            return JsonExtensions.ToJson((new MenuBLL()).Query(""));
        }

        /// <summary>
        /// 通过Id得到菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string getMenuById(string id)
        {
            MenuModel menu = (new MenuBLL()).GetModel(int.Parse(id));
            return JsonExtensions.ToJson(menu);
        }

        /// <summary>
        /// 通过json获取传过来的MenuModel，执行Add或Update
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public string addMenu(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            MenuModel menu = JsonExtensions.FromJson<MenuModel>(input);
            int iResult;
            if (menu.id == 0)
            {
                iResult = menu.Insert();
            }
            else
            {
                iResult = menu.Update();
            }
            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = iResult > 0 ? true : false,
            });
        }

        /// <summary>
        /// 删除菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string deleteMenu(String id)
        {
            if (String.Empty != id)
            {
                MenuModel menu = new MenuModel();
                menu.id = int.Parse(id);
                int i = (new MenuBLL()).Delete(menu);
                return i.ToString();
            }
            else
            {
                return "0";
            }
        }
    }
}