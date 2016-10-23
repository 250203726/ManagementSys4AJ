using N_Bers.Business.Model;
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

        public int Insert(BusinessUnitModel model)
        {
            return 0;
            //return model.Insert();  
        }

        public List<BusinessUnitModel> Query(string strfilter)
        {
            string queryStr = "select id,unit_name,unit_fullname,pid,createby,unit_type,unit_auditorname,unit_auditor,remark from nbers_businessunit where 1=1";
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
