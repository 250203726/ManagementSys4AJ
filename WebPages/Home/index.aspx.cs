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
        public string sysKeyValue = "{}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string strQuery = @"
                                            WITH    tb
                      AS ( SELECT   ROW_NUMBER() OVER ( ORDER BY id ) rid ,
                                    *
                           FROM     ( SELECT    id ,
                                                title ,
                                                art_type ,
                                                CONVERT(NVARCHAR(MAX), content) content ,
                                                create_date ,
                                                createby ,
                                                create_user ,
                                                'article' remark ,
                                                description ,
                                                0 Filesize,
                                                ispublish
                                      FROM      dbo.nbers_articles
                                      UNION
                                      SELECT    id ,
                                                DocName title ,
                                                DocType art_type ,
                                                '' content ,
                                                CreateOn ,
                                                createby ,
                                                CreateUser ,
                                                'file' Remarks ,
                                                RootType ,
                                                Filesize,
                                                ispublish
                                      FROM      dbo.nbers_Attachments
                                    ) tb
                         )
                SELECT  
                        *
                FROM    tb where 1=1 order by art_type,create_date DESC";
            strQuery = strQuery.Replace("1=1", "isnull(ispublish,0)=1");
            List<ArticleModel> all_list = Wonder4.Map.Extensions.DAL.CPQuery.From(strQuery).ToList<ArticleModel>();
            var index_banner = all_list.Where(p => p.art_type.StartsWith("首页新闻")).Take(5);
            var station_duty = (from item in all_list where item.art_type.EndsWith("安全稽查") select item).Take(6);
            var unit_notice = all_list.Where(p=>p.art_type.Equals("部门公告") && p.ispublish.Equals(1)).Take(1);
            var safty_meeting = all_list.Where(p=>p.art_type.StartsWith("安全例会")).Take(6);
            var work_plan = all_list.Where(p => p.art_type.EndsWith("教育培训")).Take(6);
            var work_summary = all_list.Where(p => p.art_type.EndsWith("三体系建设")).Take(6);
            var myPageData = new
            {
                station_duty = station_duty,
                unit_notice = unit_notice,
                safty_meeting= safty_meeting,
                work_plan= work_plan,
                work_summary= work_summary,
                index_banner= index_banner,
            };

            PageData=Wonder4.Map.Extensions.JsonExtensions.ToJson(myPageData);
            sysKeyValue =N_Bers.Business.Core.Public.GenderKey();
    }
    }
}