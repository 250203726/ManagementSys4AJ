using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPages.UnitDecription
{   
    public partial class UnitFigure : BasePage
    {
        public string PageData="{}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string oid = Request.QueryString["oid"];
            string type = Request.QueryString["type"];
            ArticleModel article=null;
            List<BusinessUnitModel> station=null;
            if (!string.IsNullOrEmpty(oid))
            {
                article = (new ArticleBLL()).GetModel(Convert.ToInt32(oid));
                
            }
            if (!string.IsNullOrEmpty(type))
            {
                //目前只有一个用了type=station_duty，需要给前台返回岗位信息
                station = (new MyUnitBLL()).DoQuery("unit_type=2");
            }
            var page_data = new
            {
                article = article,
                station= station
            };
            PageData = Wonder4.Map.Extensions.JsonExtensions.ToJson(page_data);
        }
    }
}