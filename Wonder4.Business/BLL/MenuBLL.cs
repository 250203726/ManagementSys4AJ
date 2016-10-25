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



        #region 菜单加载
        /// <summary>
        /// 菜单根目录内部类
        /// </summary>
        private class menu
        {
            public string text;
            public bool isexpand;
            public List<menuChildren> children;
        }
        /// <summary>
        ///  菜单二级目录内部类
        /// </summary>
        private class menuChildren
        {
            public string url;
            public string text;
        }
        /// <summary>
        /// 根据用户id获得菜单的json
        /// </summary>
        /// <param name="userid">用户Id</param>
        /// <returns>二级菜单indexdata的json数据</returns>
        public string getMenu(UserModel user) 
        {
            //查询到的userid拥有的一级目录列表MenuModel
            List<MenuModel> rootList = Query(" pid=0 and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='"+user.id+"') )");
            //菜单实际需要转成json的列表
            List<menu> menus = new List<menu>();
            //用循环addmenu到list中
            foreach (MenuModel m in rootList)
            {
                menu root = new menu();
                root.text = m.title;
                root.isexpand = false;
                List<menuChildren> menuchildren=new List<menuChildren>();
                //查询到userid拥有的二级目录列表MenuList
                List<MenuModel> MenuModelChildren = Query(" pid=" + m.id + " and group_id=0 and id in (select node_id from nbers_access where role_id in (select role_id from nbers_role_user where user_id='" + userid + "') )");
                foreach (MenuModel MenuModelChild in MenuModelChildren)
                {
                    menuChildren menuchild=new menuChildren();
                    menuchild.text=MenuModelChild.title;
                    menuchild.url = MenuModelChild.url;
                    menuchildren.Add(menuchild);
                }
                root.children = menuchildren;
                menus.Add(root);
            }
            return JsonExtensions.ToJson(menus);
        }
        #endregion
    }
}