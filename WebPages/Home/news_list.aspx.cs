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
        public string art_type;
        protected void Page_Load(object sender, EventArgs e)
        {
            art_type = Request.QueryString["news_type"];
            newslist = (new ArticleBLL()).DoQuery("art_type='"+ art_type + "' ORDER BY create_date DESC");
            this.Title = "安质部-" + art_type;
        }
    }
}