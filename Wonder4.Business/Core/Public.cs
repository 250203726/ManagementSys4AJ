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

            if (myCol.GetValues(key)!=null)
            {
                return myCol.GetValues(key)[0];
            }
            return string.Empty;
        }
    }
}
