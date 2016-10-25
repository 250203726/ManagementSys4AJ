using System;
using Wonder4.Map.Extensions;
using Wonder4.Map.Extensions.DAL;
using N_Bers.Business.Model;
using System.Collections.Generic;

namespace N_Bers.Business.BLL
{
    public class MenuBLL : IBusinessBLL<MenuModel>
    {
        public int Delete(MenuModel t)
        {
            throw new NotImplementedException();
        }

        public MenuModel GetModel(int id)
        {
            throw new NotImplementedException();
        }

        public int Insert(MenuModel t)
        {
            return t.Insert();
        }

        public List<MenuModel> Query(string strfilter)
        {
            string queryStr = "select * from nbers_node where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1",strfilter);
            }
            return CPQuery.From(queryStr).ToList<MenuModel>();

        }

        public int Update(MenuModel t)
        {
            throw new NotImplementedException();
        }

    }
}
