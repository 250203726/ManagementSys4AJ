using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
    public class MyUserBLL : IBusinessBLL
    {
        public int Delete()
        {
            throw new NotImplementedException();
        }

        public int Insert(object t)
        {
            throw new NotImplementedException();
        }

       

        public int Update(object t)
        {
            throw new NotImplementedException();
        }

        public List<MyUser> Query(string strfilter)
        {
            string queryStr = "select * from nbers_user where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<MyUser>();
        }

        List<object> IBusinessBLL.Query(string strfilter)
        {
            throw new NotImplementedException();
        }
    }
}
