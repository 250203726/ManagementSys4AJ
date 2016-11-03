using N_Bers.Business.BLL;
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
                    retJsonStr = getMenuById(onlyPara);
                    break;
                case "ADDMENU":
                    retJsonStr = addMenu(getPostStr());
                    break;
                case "CHANGEPWD":
                    retJsonStr = changePwd(onlyPara);
                    break;
                case "GETUSERINFO":
                    retJsonStr = GetUserInfo(onlyPara);
                    break;
                case "UPDATEUSER":
                    retJsonStr = UpdateUser(getPostStr());
                    break;
                case "GETROLES":
                    retJsonStr = getRoles();
                    break;
                case "GETROLEBYID":
                    retJsonStr = getRoleById(onlyPara);
                    break;
                case "DELETEROLE":
                    retJsonStr = deleteRole(onlyPara);
                    break;
                case "ADDROLE":
                    retJsonStr = addRole(onlyPara,getPostStr());
                    break;
                default:
                    break;
            }
            Response.ContentType = "text/HTML";
            Response.Clear();
            Response.Write(retJsonStr);
            Response.End();
        }

        /// <summary>
        /// 修改个人资料
        /// </summary>
        /// <returns></returns>
        private string UpdateUser(string user_json)
        {
            if (string.IsNullOrEmpty(user_json))
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }
            UserModel new_model = JsonExtensions.FromJson<UserModel>(user_json);
            UserModel old_model = (new MyUserBLL()).GetModel(new_model.id);
            if (null== old_model)
            {
                return JsonExtensions.ToJson(new MyHttpResult
                {
                    result = false,
                    msg = "提交数据错误！"
                });
            }

            old_model.nickname = new_model.nickname;
            old_model.email = new_model.email;
            old_model.phone = new_model.phone;
            old_model.type_id = new_model.type_id;
            old_model.info = new_model.info;

            return JsonExtensions.ToJson(new MyHttpResult
            {
                result = old_model.Update()>0?true:false,
                msg = "修改用户资料成功！"
            });

        }

        /// <summary>
        /// 获取当前用户信息 add by wonder4 2016年10月31日22:33:55
        /// </summary>
        /// <returns></returns>
        private string GetUserInfo(string user_id)
        {
            int userid;
            if (string.IsNullOrEmpty(user_id))
            {
                userid= ((UserModel)Public.User_Info).id;
            }
            else
            {
                userid = Convert.ToInt32(user_id);
            }

            return (new MyHttpResult(true, (new MyUserBLL()).GetModel(userid))).ToString();
        }

        /// <summary>
        /// 用户修改密码 by wonder4 2016年10月31日21:38:04
        /// </summary>
        /// <returns></returns>
        private string changePwd(string new_pwd)
        {
            UserModel model = (UserModel)Public.User_Info;
            model.password = AesHelper.MD5Encrypt(new_pwd);
            //model.update_time = Public.GetDateTime;

            return (new MyHttpResult(model.Update()>0?true:false,"密码修改成功！")).ToString();
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
            return (new MyHttpResult(true, list)).ToString();
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
            return (new MyHttpResult(true, (new MenuBLL()).getParentMenus(user))).ToString();
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
            return (new MyHttpResult(true, (new MenuBLL()).getSubMenus(user))).ToString();
        }

        /// <summary>
        /// 获取Menu列表传给MenuIndex显示
        /// </summary>
        /// <returns></returns>
        public string getAllMenus()
        {
            return new MyHttpResult(true, (new MenuBLL()).Query("")).ToString();
        }

        /// <summary>
        /// 通过Id得到菜单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string getMenuById(string id)
        {
            MenuModel menu = (new MenuBLL()).GetModel(int.Parse(id));
            return (new MyHttpResult(true,menu)).ToString();
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

        public string getRoles()
        {
            var grid = new {
                Rows = new RoleBLL().Query(""),
                Total = new RoleBLL().Query("").Count
            };
            return new MyHttpResult(true, grid).ToString();
        }
        public string getRoleById(string id) {
            RoleBLL rolebll = new RoleBLL();
            RoleModel model = rolebll.GetModel(int.Parse(id));
            return (new MyHttpResult(true, model)).ToString();
        }
        public string deleteRole(string id) {
            if (String.Empty != id)
            {
                RoleModel model = new RoleModel();
                model.id = int.Parse(id);
                int i = (new RoleBLL()).Delete(model);
                return new MyHttpResult(true,i.ToString()).ToString();
            }
            else
            {
                return new MyHttpResult(false, "0").ToString();
            }
        }
        /// <summary>
        /// Role实体和权限字符串
        /// </summary>
        /// <param name="auth"></param>
        /// <param name="json"></param>
        /// <returns></returns>
        public string addRole(string auth,string json) {
            
            if (string.IsNullOrEmpty(json)) {
                return new MyHttpResult(false, "提交数据错误！").ToString();
            }
            RoleModel model = JsonExtensions.FromJson<RoleModel>(json);
            int result;
            //1.判断是新增角色还是编辑角色
            if (model.id == 0)//新增
            {
                result = model.Insert();
            }
            else {//编辑
                result = model.Update();
            }
            return new MyHttpResult(result > 0 ? true : false, "").ToString();
        }
    }
}