using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace N_Bers.Business.Core
{
    public class SystemContext
    {
        public enum SessionType
        {
            UserName,
            UserCode,
            UserID,
        }

        private static string GetSessionValue(SessionType sessionType)
        {
            string key = sessionType.ToString();
            if (null == System.Web.HttpContext.Current.Session[key])
                return null;
            return System.Web.HttpContext.Current.Session[key].ToString();
        }

        public static string UserCode
        {
            get
            {
                return GetSessionValue(SessionType.UserCode);
            }
        }

        public static string UserID
        {
            get
            {
                return GetSessionValue(SessionType.UserID);
            }
        }
    }
}
