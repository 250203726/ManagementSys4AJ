using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace N_Bers.Business.Core
{
    /// <summary>
    /// 功能：公共基础
    /// </summary>
   public static class Public
    {
        public static string GetBaseDirectory()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory;

            path = path.Replace(@"\bin\", @"\").Replace(@"\bin", @"\");

            return path;
        }
    }
}
