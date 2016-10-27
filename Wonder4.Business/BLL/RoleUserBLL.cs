using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using N_Bers.Business.Model;
using Wonder4.Map.Extensions.DAL;

namespace N_Bers.Business.BLL
{
    /// <summary>
    /// 管理用户的角色
    /// </summary>
    public class RoleUserBLL:IBusinessBLL<RoleUserModel>
    {
        public int Insert(RoleUserModel t)
        {
            return t.Insert();
        }

        public int Update(RoleUserModel t)
        {
            return t.Update();
        }

        public int Delete(RoleUserModel t)
        {
            return t.Delete();
        }

        public List<RoleUserModel> Query(string strfilter)
        {
            throw new NotImplementedException();
        }
        public RoleUserModel GetModel(int id)
        {
            return GetModel(id);
        }
        /// <summary>
        /// 给用户分配角色
        /// </summary>
        /// <param name="role">分配的角色</param>
        /// <param name="user">指定的用户</param>
        /// <returns></returns>
        public int assignRole2User(RoleModel role,UserModel user)
        {
            RoleUserModel roleuser=new RoleUserModel();
            roleuser.role_id=role.id;
            roleuser.user_id=user.id;
            return roleuser.Insert();
        }
        //修改用户的角色
        
        //查询用户的角色
        public RoleModel getRoleByUser(UserModel user)
        {
            string queryStr = "select * from nbers_role where id in (select role_id from nbers_role_user where user_id="+user.id+")";
            List<RoleModel> roles=CPQuery.From(queryStr).ToList<RoleModel>();
            return roles[0];
        }
        
    }
}
