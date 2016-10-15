using N_Bers.Entity.SysEntity;
using System;
using Wonder4.Map.Extensions;
using Wonder4.Map.Extensions.DAL;

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

        public string Query(string strfilter)
        {
            string queryStr = "select * from nbers_node where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1",strfilter);
            }
            var menuList = CPQuery.From(queryStr).ToList<MyMenu>();

            return JsonExtensions.ToJson(menuList);
        }

        public int Update(object t)
        {
            throw new NotImplementedException();
        }
    }
}
