using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace N_Bers.Business.Core
{
    /// <summary>
    /// 功能：公共基础 
    /// 1、处理 Session相关
    /// 2、超级管理员判断
    /// by wonder4 2016年10月31日12:24:46
    /// </summary>
    public static class Public
    {
        /// <summary>
        /// session字段名称，用枚举值来规范
        /// </summary>
        public enum SessionType
        {
            User_Info,
            Server_Code
        }
        /// <summary>
        /// 获取网站的物理文件目录 by wonder4 2016年10月31日12:24:46
        /// </summary>
        /// <returns></returns>
        public static string GetBaseDirectory()
        {
            string path =HttpContext.Current.Server.MapPath("~");

            return path;
        }
        /// <summary>
        /// 判断当前用户是不是超级管理员，需要优化，通过其他属性来判断，不能通过code来界定。
        /// by wonder4 2016年10月31日12:24:46
        /// </summary>
        /// <returns></returns>
        public static bool IsAdmin()
        {
            UserModel model = (UserModel)User_Info;
            return model != null & model.account.Equals("admin");
        }

        /// <summary>
        /// 获取context的session对象 by wonder4 2016年10月31日12:24:46
        /// </summary>
        /// <param name="sessionType"></param>
        /// <returns></returns>
        private static object GetSessionValue(SessionType sessionType)
        {
            string key = sessionType.ToString();
            if (null == System.Web.HttpContext.Current.Session[key])
                return null;
            return System.Web.HttpContext.Current.Session[key];
        }

        /// <summary>
        /// 获取session中的用户信息 by wonder4 2016年10月31日12:24:46
        /// </summary>
        public static object User_Info
        {
            get
            {
                return GetSessionValue(SessionType.User_Info);
            }
        }

        /// <summary>
        /// 获取session中的验证码信息 by wonder4 2016年12月6日13:08:02
        /// </summary>
        public static string Auth_Code
        {
            get
            {
                return GetSessionValue(SessionType.Server_Code).ToString();
            }
        }

        /// <summary>
        /// 注销系统
        /// </summary>
        public static void Logout()
        {
            System.Web.HttpContext.Current.Session.Clear();
        }

        public static int GetDateTime
        {
            get
            {
                TimeSpan tss = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                return Convert.ToInt32(tss.TotalMilliseconds);
            }
        }

        public static string GetSysValue(string key)
        {
            NameValueCollection myCol = new NameValueCollection();
            myCol.Add("unit_decription", "部门概况");
            myCol.Add("unit_manage", "部门管理");
            myCol.Add("safety_manage", "安全管理");
            myCol.Add("quality_manage", "质量管理");
            myCol.Add("branch_manage", "分公司管控");

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


            if (myCol.GetValues(key)!=null)
            {
                return myCol.GetValues(key)[0];
            }
            return string.Empty;
        }

        public static string GenderKey()
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

            myCol.Add("CurrentUserName", (User_Info==null)?"":((UserModel)User_Info).nickname);

            return Wonder4.Map.Extensions.JsonExtensions.ToJson(myCol);
        }
    }
}
