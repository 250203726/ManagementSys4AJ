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
    public partial class news_list : System.Web.UI.Page
    {
        public List<ArticleModel> newslist;
        protected void Page_Load(object sender, EventArgs e)
        {
            string news_type = Request.QueryString["news_type"];
            newslist = (new ArticleBLL()).DoQuery("art_type='"+ news_type+"'");

        }
    }
}