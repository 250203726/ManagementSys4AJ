using System;
using Wonder4.Map.Extensions;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.Model;
using System.Collections.Generic;

namespace N_Bers.Business.BLL
{
    public class MenuBLL : IBusinessBLL
    {
        public int Delete()
        {
            throw new NotImplementedException();
        }

        public int Insert(object t)
        {
            //MyMenu mm = (MyMenu)t;
            //return mm.Insert();
            return 0;
        }

        public List<MyMenu> Query(string strfilter)
        {
            string queryStr = "select * from nbers_node where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1",strfilter);
            }
            return CPQuery.From(queryStr).ToList<MyMenu>();

        }

        public int Update(object t)
        {
            throw new NotImplementedException();
        }

        List<object> IBusinessBLL.Query(string strfilter)
        {
            throw new NotImplementedException();
        }
    }
}
