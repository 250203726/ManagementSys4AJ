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
    public partial class news_view : BasePage
    {
        public ArticleModel artM;
        protected void Page_Load(object sender, EventArgs e)
        {
            string oid = Request.QueryString["oid"];
            if (string.IsNullOrEmpty(oid))
            {
                Response.Write("<script>alert('参数错误，请关闭页面重试！');window.close();</script>");
                Response.End();
            }
            artM = (new ArticleBLL()).GetModel(Convert.ToInt32(oid));
            this.Title = "荆力总包安质部-" + artM.title;
        }
    }
}