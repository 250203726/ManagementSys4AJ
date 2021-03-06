﻿using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
   public class MyUnitBLL : IBusinessBLL<BusinessUnitModel>
    {
        public int Delete(BusinessUnitModel model)
        {
            return 0;
            //return model.Delete();
        }

        public int DeleteByIDs(string ids)
        {
            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            string sqlStr = "DELETE FROM dbo.nbers_businessunit WHERE id IN({0})";            
            return CPQuery.From(string.Format(sqlStr, ids)).ExecuteNonQuery();
        }

        public BusinessUnitModel GetModel(int id)
        {
            List<BusinessUnitModel> buList = DoQuery("id =" + id);
            return buList.Count > 0 ? buList[0] : null;
        }

        public int Insert(BusinessUnitModel model)
        {
            return 0;
            //return model.Insert();  
        }

        public List<BusinessUnitModel> DoQuery(string strfilter)
        {           
            string queryStr = "SELECT * FROM (select ROW_NUMBER() OVER(PARTITION BY unit_type ORDER BY id) rid,* from nbers_businessunit) tb where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            //var dt = CPQuery.From(queryStr).FillDataTable();
            return CPQuery.From(queryStr).ToList<BusinessUnitModel>();

        }

        public int Update(BusinessUnitModel model)
        {
            return 0;
            //return model.Update();
        }
    }
}
