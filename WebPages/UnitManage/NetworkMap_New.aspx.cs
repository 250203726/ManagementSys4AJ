using N_Bers.Business.BLL;
using N_Bers.Business.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wonder4.Map.Extensions;

namespace WebPages.UnitManage
{
    public partial class NetworkMap_New : Page
    {
        public string strJSON = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //  strJSON = JsonExtensions.ToJson((new NetMapBLL()).DoQuery(""));
            NetMapBLL netMapbll = new NetMapBLL();
            List<NetMapModel> netMList = netMapbll.DoQuery("");

            List<NetMapInfo> list = new List<NetMapInfo>();
           list.Add(netMapbll.GenerateTree());

            strJSON = JsonExtensions.ToJson(list);

            this.mybody.InnerHtml =string.Format( "<table><tr><td>{0}</td></tr></table>", strJSON);
        }

        

    }
}