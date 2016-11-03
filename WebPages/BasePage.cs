using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using N_Bers.Business.Core;
namespace WebPages
{
    public class BasePage : System.Web.UI.Page
    {
        ValidAccessBLL validAccess = new ValidAccessBLL();
        public UserModel user;
        public string buttonJson = "";
        protected void Page_Init(object sender, EventArgs e)
        {
            user = (UserModel)Session[BaseConst.USERSESSION];
            String nodeid=Request.QueryString["nodeid"];
            
            if (user != null)
            {
                //1、验证页面权限  调试过程中注释掉，正式环境加上
                //if (!validAccess.validPage(user.id.ToString(), nodeid))
                //{
                //    Response.Redirect("../error/404.html");
                //}
                //2、验证按钮权限
                nodeid = string.IsNullOrEmpty(nodeid) ? "0" : nodeid;
                buttonJson = validAccess.getButton(user, nodeid);
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
        }
    }
}