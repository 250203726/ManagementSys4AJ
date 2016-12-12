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
    public partial class index : BasePage
    {
        public string PageData;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ArticleModel> all_list = (new ArticleBLL()).DoQuery(" 1=1 order by art_type,create_date,ispublish DESC");
            var station_duty = (from item in all_list where item.art_type.EndsWith("_岗位职责") select item).Take(6);
            //var unit_notice = (from item in all_list where item.art_type.Equals("部门公告") select item).Take(1);
            var unit_notice = all_list.Where(p=>p.art_type.Equals("部门公告") && p.ispublish.Equals(1)).Take(1);
            var safty_meeting = all_list.Where(p=>p.art_type.StartsWith("安全例会_")).Take(6);
            var work_plan = all_list.Where(p => p.art_type.EndsWith("_工作计划")).Take(6);
            var work_summary = all_list.Where(p => p.art_type.EndsWith("工作总结")).Take(6);
            var myPageData = new
            {
                station_duty = station_duty,
                unit_notice = unit_notice,
                safty_meeting= safty_meeting,
                work_plan= work_plan,
                work_summary= work_summary,
            };

            PageData=Wonder4.Map.Extensions.JsonExtensions.ToJson(myPageData);
        }
    }
}