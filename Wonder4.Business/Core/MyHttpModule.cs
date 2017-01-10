using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace N_Bers.Business.Core
{
    public class MyHttpModule : IHttpModule
    {
        public void Dispose()
        {
            
        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
        }

        private void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;
            if (!Public.VerifyRights())
            {
                context.Response.Redirect("~/error/405.html");
            }           
        }
    }
}
