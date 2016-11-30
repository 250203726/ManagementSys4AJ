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
    public partial class index : System.Web.UI.Page
    {
        public string PageData;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ArticleModel> all_list = (new ArticleBLL()).DoQuery("1=1 order by art_type,create_date DESC");
            var station_duty = (from item in all_list where item.art_type.Equals("岗位职责") select item).Take(6);

            var myPageData = new { station_duty= station_duty };
            PageData=Wonder4.Map.Extensions.JsonExtensions.ToJson(myPageData);
        }
    }
}