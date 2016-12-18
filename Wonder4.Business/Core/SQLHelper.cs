using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace N_Bers.Business.Core
{
    /// <summary>
    /// 
    /// </summary>
    public static class SQLHelper
    {
        /// <summary>
        /// 生成完整sql语句
        /// </summary>
        /// <param name="sql">取数sql</param>
        /// <param name="orderby">排序字段</param>
        /// <param name="ascdesc">排序规则（asc、desc）</param>
        /// <param name="pk">主键</param>
        /// <returns>返回根据上述条件生成的完整sql语句</returns>
        public static string GetSubSqlStr(string sql, string pk = "id", string strWhere="1=1",string filter="1=1") {
            string tpl = @"WITH    tb
                                  AS ( SELECT ROW_NUMBER() OVER ( ORDER BY @pk ) rid ,* FROM ( @sql ) tb
                                where @strWhere)
                            SELECT  ROW_NUMBER() OVER(ORDER BY @pk) rid,*
                            FROM    tb
                            WHERE   1=1  @strFilter";
            if (!string.IsNullOrEmpty(sql))
            {
                tpl = tpl.Replace("@sql",sql);
            }
            else
            {
                return string.Empty;
            }
            if (!string.IsNullOrEmpty(pk))
            {
                tpl = tpl.Replace("@pk",pk);
            }
            if (!string.IsNullOrEmpty(filter))
            {
                tpl = tpl.Replace("@strFilter", filter);
            }
            if (!string.IsNullOrEmpty(strWhere))
            {
                tpl = tpl.Replace("@strWhere", strWhere);
            }
            else
            {
                tpl = tpl.Replace("@strWhere", "1=1");
            }
            
            return tpl;
        }
    }
}
