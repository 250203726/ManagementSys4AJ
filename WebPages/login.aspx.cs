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

                    UserModel ui = CPQuery.From(sqlQuery, new { uid = user_name, pwd = user_pwd }).ToSingle<UserModel>();

                    if (ui != null)
                    {
                        Session[BaseConst.USERSESSION] = ui;
                        Session[SystemContext.SessionType.UserID.ToString()] = ui.id;

                        var userid = Session[SystemContext.SessionType.UserID.ToString()];
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