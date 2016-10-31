using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace N_Bers.Business.Core
{
    /// <summary>
    /// 功能：公共基础 
    /// 1、处理 Session相关
    /// 2、超级管理员判断
    /// </summary>
   public static class Public
    {

        public enum SessionType
        {
            User_Info
        }
        public static string GetBaseDirectory()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory;

            path = path.Replace(@"\bin\", @"\").Replace(@"\bin", @"\");

            return path;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static bool IsAdmin()
        {
            UserModel model = (UserModel)User_Info;
            return model != null & model.account.Equals("admin");
        }


        private static object GetSessionValue(SessionType sessionType)
        {
            string key = sessionType.ToString();
            if (null == System.Web.HttpContext.Current.Session[key])
                return null;
            return System.Web.HttpContext.Current.Session[key];
        }

        public static object User_Info
        {
            get
            {
                return GetSessionValue(SessionType.User_Info);
            }
        }
    }
}
