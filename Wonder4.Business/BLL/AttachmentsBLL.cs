using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
    public class AttachmentsBLL : IBusinessBLL<AttachmentsModel>
    {
        public int Delete(AttachmentsModel t)
        {
            return t.Delete();
        }

        public int DeleteByIDs(string ids)
        {
            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            string sqlStr = "DELETE FROM dbo.nbers_Attachments WHERE id IN({0})";
            return CPQuery.From(string.Format(sqlStr, ids)).ExecuteNonQuery();
        }

        public AttachmentsModel GetModel(int id)
        {
            List<AttachmentsModel> buList = Query("id =" + id);
            return buList.Count > 0 ? buList[0] : null;
        }

        public int Insert(AttachmentsModel t)
        {
            return t.Insert();
        }

        public List<AttachmentsModel> Query(string strfilter)
        {
            string queryStr = "select * from nbers_Attachments where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<AttachmentsModel>();
        }

        public int Update(AttachmentsModel t)
        {
            return t.Update();
        }

        public string[] GetDownLoadFiles(string[] fileids)
        {
            string sql = string.Empty;
            string[] downloadurls = new string[1];
            if (fileids.Length > 1)
            {
                sql = string.Format(@"select isnull(Location,'')+FileName as FilePath,DocName from nbers_Attachments where id in('{0}')", string.Join(",", fileids));
                DataTable dt = CPQuery.From(sql).FillDataTable();
                if (dt == null || dt.Rows.Count == 0) throw new NullReferenceException("未找到要下载的文档记录");
                List<string> files = new List<string>();
                foreach (DataRow dr in dt.Rows)
                {
                    files.Add(string.Format("{0}|{1}", dr["FilePath"].ToString(), dr["DocName"].ToString()));
                }
                downloadurls = files.ToArray();
            }
            else
            {
                sql = @"select isnull(Location,'')+FileName as FilePath,DocName from nbers_Attachments where id =@DocGUID";
                DataTable dt = CPQuery.From(sql, new { DocGUID = fileids[0] }).FillDataTable();
                if (dt == null || dt.Rows.Count == 0) throw new NullReferenceException("未找到要下载的文档记录");
                string strFilePath = dt.Rows[0]["FilePath"].ToString();
                string strDocName = dt.Rows[0]["DocName"].ToString();
                downloadurls[0] = strFilePath + "|" + strDocName;
            }
            return downloadurls;
        }
    }
}
