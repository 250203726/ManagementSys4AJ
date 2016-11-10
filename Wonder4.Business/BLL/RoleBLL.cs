using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using N_Bers.Business.Model;
using Wonder4.Map.Extensions.DAL;
namespace N_Bers.Business.BLL
{
    public class RoleBLL : IBusinessBLL<RoleModel>
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

        public RoleModel GetModel(int id) {
            string str = " id=" + id;
            List<RoleModel> list = DoQuery(str);
            if (list.Count > 0)
                return list[0];
            return null;
        }

        public List<RoleModel> DoQuery(string strfilter)
        {
            string queryStr = "select * from nbers_role where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<RoleModel>();
        }

        public int DeleteByIDs(string ids)
        {
            throw new NotImplementedException();
        }

        public RoleModel getByMax() {
            string queryStr = "select * from nbers_role where id =(select max(id) from nbers_role )";
            return CPQuery.From(queryStr).ToList<RoleModel>()[0];
        }
    }
}
