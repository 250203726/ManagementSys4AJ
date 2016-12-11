using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPages.Home
{
    public partial class unit_decription : System.Web.UI.Page
    {
        public List<ArticleModel> newslist;
        public string art_type;
        public List<MenuModel> type_tree;
        protected void Page_Load(object sender, EventArgs e)
        {
            art_type = Request.QueryString["news_type"];
            type_tree = (new MenuBLL()).DoQuery(string.Format("and moduleId='{0}' AND parentId<>0 ORDER BY sortCode", art_type));
            art_type = string.IsNullOrEmpty(N_Bers.Business.Core.Public.GetSysValue(art_type)) ? art_type : N_Bers.Business.Core.Public.GetSysValue(art_type);
            newslist = (new ArticleBLL()).DoQuery("art_type='" + art_type + "' ORDER BY create_date DESC");

            this.Title = "荆力总包安质部-" + art_type;
        }
    }
}