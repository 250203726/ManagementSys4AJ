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
                if (!string.IsNullOrEmpty(nodeid) && !validAccess.validPage(user.id.ToString(), nodeid))
                {
                    Response.Redirect("../error/404.html");
                }
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
            myCol.Add("stsz", "系统设置");
            myCol.Add("jsgl", "角色管理");
            myCol.Add("jbxx", "基础信息");
            myCol.Add("cdgl", "菜单管理");
            myCol.Add("yhgl", "用户管理");
            myCol.Add("bmgl", "部门管理");
            myCol.Add("sjhw", "上级来文");
            myCol.Add("gzzj", "工作总结");
            myCol.Add("bmgk", "部门概况");
            myCol.Add("jxkh", "绩效考核");
            myCol.Add("gzjh", "工作计划");
            myCol.Add("zdgl", "管理制度");
            myCol.Add("aqgl", "安全管理");
            myCol.Add("aqjc", "安全稽查");
            myCol.Add("aqlh", "安全例会");
            myCol.Add("agks", "安规考试");
            myCol.Add("jypx", "教育培训");
            myCol.Add("zgsh", "资质审核");
            myCol.Add("jtaq", "交通安全");
            myCol.Add("zlgl", "质量管理");
            myCol.Add("gggl", "公告管理");
            myCol.Add("bmzz", "部门职责");
            myCol.Add("gwzz", "岗位职责");
            myCol.Add("fgsgl", "分公司管控");
            myCol.Add("stxjs", "三体系建设");
            myCol.Add("xxjzz", "形象及宗旨");
            myCol.Add("gwryxx", "岗位人员信息");
            myCol.Add("syxwgl", "首页新闻管理");
            myCol.Add("aqjctb", "安全稽查通报");
            myCol.Add("gqjpzbz", "工器具配置标准");
            myCol.Add("gqjglpj", "工器具管理评价");
            myCol.Add("fgskhdx", "分公司考核兑现");
            myCol.Add("gsaqwlt", "公司安全网络图");
            myCol.Add("bbgl_page", "部门管理");
            myCol.Add("gwgl_page", "岗位管理");

            myCol.Add("CurrentUserName", ((UserModel)Public.User_Info).nickname);

            sysKeyValue = Wonder4.Map.Extensions.JsonExtensions.ToJson(myCol);
        }
    }
}