using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        string username = System.Web.HttpContext.Current.User.Identity.Name;

        InstaLocalEntities db = new InstaLocalEntities();

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("denyUnknow/Postar.aspx");
        }

        protected void LOGOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void ImageButton1_Click1(object sender, EventArgs e)
        {
            int id = db.Utilizadors.Where(x => x.Nome == username).FirstOrDefault().ID;
            Response.Redirect("PAGINAUSER.aspx?F=" + id);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx?search=" + TextBox1.Text);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
        }
    }
}
