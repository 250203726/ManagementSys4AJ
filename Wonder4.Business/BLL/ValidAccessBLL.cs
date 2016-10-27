using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using N_Bers.Business.Model;

namespace N_Bers.Business.BLL
{
    /// <summary>
    /// 验证权限的业务
    /// 
    /// </summary>
    public class ValidAccessBLL
    {
        /// <summary>
        /// 验证页面权限
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="nodeId"></param>
        /// <returns></returns>
        public bool validPage(string userId,string nodeId)
        {
            UserModel user = new UserModel();
            MenuModel node = new MenuModel();
            user.id = int.Parse(userId);
            node.id = int.Parse(nodeId);
            return (new MenuBLL()).CheckPageMenu(user, node);
        }

        /// <summary>
        /// 获取按钮json
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="nodeId"></param>
        /// <returns></returns>
        public String getButton(string userId, string nodeId)
        {
            UserModel user = new UserModel();
            user.id = int.Parse(userId);
            MenuModel node = new MenuModel();
            node.id = int.Parse(nodeId);
            return (new MenuBLL()).getButtonMenus(user, node);
        }
    }
}
