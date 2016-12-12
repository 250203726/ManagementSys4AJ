using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using N_Bers.Business.Core;

namespace WebPages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string isLogout = Request.QueryString["RemoveSession"];
            //注销系统
            if (!string.IsNullOrEmpty(isLogout) && isLogout.Equals("1"))
            {
                Public.Logout();
            }

            if (this.IsPostBack)
            {
                string user_name = Request.Form["form-username"];
                string user_pwd = Request.Form["form-password"];
                string auth_code = Request.Form["authCode"];

                ////二维码校验
                //if (!Session[Public.SessionType.Server_Code.ToString()].Equals(auth_code))
                //{
                //    //Response.Write("<script>alert('验证码错误，请重新输入！')</script>");
                //    string strJson = Wonder4.Map.Extensions.JsonExtensions.ToJson(
                //    new
                //    {
                //        status = false,
                //        msg = "验证码错误，请重新输入！"
                //    });
                //    Response.Write("<script>server_data='{0}';</script>".Replace("{0}", strJson));
                //    return;
                //}


                //为空需要重新登陆，敏感参数都要在服务端做校验
                if (string.IsNullOrEmpty(user_name) || string.IsNullOrEmpty(user_pwd))
                {
                    Response.Redirect("login.aspx");
                }
                else//数据库校验
                {
                    string sqlQuery = "SELECT id,account,nickname,email FROM nbers_user WHERE ( account=@uid OR nickname=@uid) AND password=@pwd";
                    //密码使用md5加密（AesHelper类提供加密相关函数,后期再拓展，单纯的md5是不行的） 补充ByWHZ：这种小系统用个MD5已经很好了，不要想太多！！给自己制造麻烦
                    UserModel ui = CPQuery.From(sqlQuery, new { uid = user_name, pwd = AesHelper.MD5Encrypt(user_pwd) }).ToSingle<UserModel>();

                    if (ui != null)
                    {
                        Session[Public.SessionType.User_Info.ToString()] = ui;
                        var user = (UserModel)Public.User_Info;

                        var userid = user.id;
                        Response.Redirect("~/Home/index.aspx");
                    }
                    else
                    {
                        string strJson = Wonder4.Map.Extensions.JsonExtensions.ToJson(
                    new
                    {
                        status = false,
                        msg = "用户名或密码错误!"
                    });
                        Response.Write("<script>server_data='{0}';</script>".Replace("{0}", strJson));
                        //Response.Write("<script>server_data={status=false,msg='{0}'};</script>".Replace("{0}", "用户名或密码错误!"));                   
                    }
                }
            }

        }

    }
}