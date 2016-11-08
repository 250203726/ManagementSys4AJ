using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
    public class ArticleBLL : IBusinessBLL<ArticleModel>
    {
        public int Delete(ArticleModel t)
        {
            return t.Delete();
        }

        public int DeleteByIDs(string ids)
        {
            throw new NotImplementedException();
        }

        public ArticleModel GetModel(int id)
        {
            List<ArticleModel> buList = Query("id =" + id);
            return buList.Count > 0 ? buList[0] : null;
        }

        public int Insert(ArticleModel t)
        {
            return t.Insert();
        }

        public List<ArticleModel> Query(string strfilter)
        {
            string queryStr = "select * from nbers_articles where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<ArticleModel>();
        }

        public int Update(ArticleModel t)
        {
            return t.Update();
        }
    }
}
