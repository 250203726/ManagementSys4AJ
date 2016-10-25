using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using N_Bers.Business.Model;
using Wonder4.Map.Extensions.DAL;
namespace N_Bers.Business.BLL
{
    class RoleBLL : IBusinessBLL<RoleModel>
    {
        
        public int Insert(RoleModel t)
        {
            return t.Insert();
        }

        public int Update(RoleModel t)
        {
            
            return t.Update();
        }

        public int Delete(RoleModel t)
        {
           
            return t.Delete();
        }

        public List<RoleModel> Query(string strfilter)
        {
            string queryStr = "select i* from nbers_role where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<RoleModel>();
        }

    }
}
