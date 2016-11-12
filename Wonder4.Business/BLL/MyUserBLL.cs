using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
    public class MyUserBLL : IBusinessBLL<UserModel>
    {

        public int Insert(UserModel t)
        {
            throw new NotImplementedException();
        }

       

        public int Update(UserModel t)
        {
           return t.Update();
        }

        public List<UserModel> DoQuery(string strfilter)
        {
            string queryStr = "SELECT * FROM (select ROW_NUMBER() OVER(ORDER BY id) rid,* from nbers_user) tb where 1=1";
            if (!string.IsNullOrEmpty(strfilter))
            {
                queryStr = queryStr.Replace("1=1", strfilter);
            }
            return CPQuery.From(queryStr).ToList<UserModel>();
        }

        public int Delete(UserModel t)
        {
            throw new NotImplementedException();
        }

        public UserModel GetModel(int id)
        {
            List<UserModel> userList = DoQuery("id =" + id);
            return userList.Count > 0 ? userList[0] : null;
        }

        public UserInfo MyLogin(Dictionary<string,string> dic)
        {
            string uid=string.Empty, pwd=string.Empty;
            if (!dic.TryGetValue("uid", out uid) && !dic.TryGetValue("pwd",out pwd))
            {
                return null;
            }
            //入参校验
            if (string.IsNullOrEmpty(uid) || string.IsNullOrEmpty(pwd))
            {
                return null;
            }

            string sqlQuery = "SELECT * FROM nbers_user WHERE ( account=@uid OR nickname=@uid) AND password=@pwd";

            UserInfo ui=CPQuery.From(sqlQuery, new { uid = uid, pwd = pwd }).ToSingle<UserInfo>();


            return ui;
        }

        public int DeleteByIDs(string ids)
        {
            if (string.IsNullOrEmpty(ids))
            {
                return 0;
            }
            string sqlStr = "DELETE FROM dbo.nbers_user WHERE id IN({0})";
            return CPQuery.From(string.Format(sqlStr, ids)).ExecuteNonQuery();
        }
    }
}
