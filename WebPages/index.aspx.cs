using N_Bers.Business.Core;
using N_Bers.Business.Model;
using System;
using Wonder4.Map.Extensions.DAL;

namespace WebPages
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session[BaseConst.USERSESSION] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {                      
        }
        
    }
}