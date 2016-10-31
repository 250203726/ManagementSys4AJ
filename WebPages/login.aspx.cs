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
            if (this.IsPostBack)
            {
                string user_name = Request.Form["form-username"];
                string user_pwd = Request.Form["form-password"];
                //为空需要重新登陆，敏感参数都要在服务端做校验
                if (string.IsNullOrEmpty(user_name) || string.IsNullOrEmpty(user_pwd))
                {
                    Response.Redirect("login.aspx");
                }
                else//数据库校验
                {

                    string sqlQuery = "SELECT id,account,nickname,password,email FROM nbers_user WHERE ( account=@uid OR nickname=@uid) AND password=@pwd";
                    //密码使用md5加密（AesHelper类提供加密相关函数,后期再拓展，单纯的md5是不行的）
                    UserModel ui = CPQuery.From(sqlQuery, new { uid = user_name, pwd = AesHelper.MD5Encrypt(user_pwd) }).ToSingle<UserModel>();

                    if (ui != null)
                    {
                        Session[Public.SessionType.User_Info.ToString()] = ui;
                        var user =(UserModel)Public.User_Info;

                        var userid = user.id;
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('验证用户信息不正确')</script>");
                    }
                }

               
                
            }            

        }
    }
}