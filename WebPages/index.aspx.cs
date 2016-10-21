using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

                }              


                Response.Redirect("main.html");
            }            
        }
    }
}