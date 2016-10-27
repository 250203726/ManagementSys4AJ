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
            throw new NotImplementedException();
        }
    }
}
