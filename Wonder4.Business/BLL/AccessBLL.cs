using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.Model;

namespace N_Bers.Business.BLL
{
    /// <summary>
    /// 管理角色的菜单权限
    /// </summary>
    public class AccessBLL:IBusinessBLL<AccessModel>
    {
        public int Insert(AccessModel t)
        {
            return t.Insert();
        }

        public int Update(AccessModel t)
        {
            return t.Update();
        }

        public int Delete(AccessModel t)
        {
            return t.Delete();
        }

        public AccessModel GetModel(int id)
        {
            return GetModel(id);
        }
        public List<AccessModel> Query(string strfilter)
        {
            string queryStr = "select * from nbers_access where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<AccessModel>();
        }

        public int deleteByRoleId(string roleId)
        {
            string str = "delete from nbers_access where role_id=" + roleId;
;
            return CPQuery.From(str).ExecuteNonQuery();
        }
        
        public int DeleteByIDs(string ids)
        {
            throw new NotImplementedException();
        }
    }
}
