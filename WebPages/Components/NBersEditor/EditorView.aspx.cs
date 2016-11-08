using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPages.Components.NBersEditor
{
    public partial class EditorView : BasePage
    {
        public ArticleModel artM;
        protected void Page_Load(object sender, EventArgs e)
        {
            string art_id = Request.QueryString["oid"];
           artM = (new ArticleBLL()).GetModel(Convert.ToInt32(art_id));

            this.Title = artM.title+"_"+artM.art_type;

        }
    }
}