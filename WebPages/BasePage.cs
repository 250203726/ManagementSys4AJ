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
        public string sysKeyValue = "{}";
        protected void Page_Init(object sender, EventArgs e)
        {
            //session 注入 Session[Public.SessionType.User_Info.ToString()] = ui; 这种写法
            //取当前用户 系统中类似用法都可以这么些
            user = (UserModel)Public.User_Info;
            String nodeid=Request.QueryString["nodeid"];
            
            if (user != null)
            {
                genderKey();
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
                Response.Redirect("~/login.aspx");
            }
        }

        private void genderKey()
        {
            Dictionary<string, string> myCol = new Dictionary<string, string>();
            myCol.Add("gzjh", "工作计划");
            myCol.Add("zdgl", "管理制度");
            myCol.Add("aqjc", "安全稽查");
            myCol.Add("aqlh", "安全例会");
            myCol.Add("agks", "安规考试");
            myCol.Add("jypx", "教育培训");
            myCol.Add("zgsh", "资质审核");
            myCol.Add("jtaq", "交通安全");
            myCol.Add("bmzz", "部门职责");
            myCol.Add("gwzz", "岗位职责");
            myCol.Add("stxjs", "三体系建设");
            myCol.Add("xxjzz", "形象及宗旨");
            myCol.Add("gwryxx", "岗位人员信息");
            myCol.Add("aqjctb", "安全稽查通报");
            myCol.Add("gqjpzbz", "工器具配置标准");
            myCol.Add("gqjglpj", "工器具管理评价");
            myCol.Add("fgskhdx", "分公司考核兑现");
            myCol.Add("gsaqwlt", "公司安全网络图");

            sysKeyValue = Wonder4.Map.Extensions.JsonExtensions.ToJson(myCol);
        }
    }
}