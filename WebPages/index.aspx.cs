using N_Bers.Business.BLL;
using N_Bers.Business.Core;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;

namespace WebPages
{
    public partial class index : System.Web.UI.Page
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
                    Response.Redirect("index.aspx");
                }
                else//数据库校验
                {

                    string sqlQuery = "SELECT ID,account,nickname,password,email FROM nbers_user WHERE ( account=@uid OR nickname=@uid) AND password=@pwd";

                    UserModel ui = CPQuery.From(sqlQuery, new { uid = user_name, pwd = user_pwd }).ToSingle<UserModel>();

                    if (ui!=null)
                    {                        
                        Session[SystemContext.SessionType.UserCode.ToString()] = ui.id;

                    }
                    else
                    {

                    }
                }


                var user_id = SystemContext.UserCode;

                Response.Redirect("main.html");
            }            
        }
    }
}