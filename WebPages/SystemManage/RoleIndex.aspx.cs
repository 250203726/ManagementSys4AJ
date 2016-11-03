using N_Bers.Business.Core;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using N_Bers.Business.BLL;

namespace WebPages.SystemManage
{
    public partial class RoleIndex : BasePage
    {
        //用户的权限
        public string aList = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //setaList();  
        }

        /// <summary>
        /// 设置aList值
        /// </summary>
        private void setaList() {
            MenuBLL menubll = new MenuBLL();
            List<MenuModel> menuList = menubll.getByUserId(user.id);
            foreach (MenuModel menu in menuList){
                aList += menu.id + ",";
            }
        }

        //private void set 
    }
}