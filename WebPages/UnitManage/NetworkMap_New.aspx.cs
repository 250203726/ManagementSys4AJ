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
        protected void Page_Load(object sender, EventArgs e)
        {
            NetMapBLL netMapbll = new NetMapBLL();

            if (Cache.Get("cache_netmap")==null)
            {
                Cache.Insert("cache_netmap", netMapbll.GenerateTree4Dom());
            }
            this.myDiv.InnerHtml = Cache.Get("cache_netmap").ToString();
        }     

    }
}