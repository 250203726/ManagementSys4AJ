using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPages.UnitManage.SavePage
{
    public partial class SaveRuleManagement : BasePage
    {
        public string PageData = "{}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string oid = Request.QueryString["oid"];
            string mode = Request.QueryString["mode"];
            if (!string.IsNullOrEmpty(oid) && !string.IsNullOrEmpty(mode))
            {
                ArticleModel art = (new ArticleBLL()).GetModel(Convert.ToInt32(oid));
                var page_data = new
                {
                    article = art
                };
                PageData = Wonder4.Map.Extensions.JsonExtensions.ToJson(page_data);
            }
        }
    }
}