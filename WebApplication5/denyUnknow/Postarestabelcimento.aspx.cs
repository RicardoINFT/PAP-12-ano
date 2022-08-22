using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.denyUnknow
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        InstaLocalEntities db = new InstaLocalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            int i = int.Parse(Request.QueryString["L"]);
            string id = db.Locals.Where(x => x.ID == i).FirstOrDefault().Nome;
            Label1.Text =  id;
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Esperemos que tenha bastantes visitas!" + "');", true);
            int i = int.Parse(Request.QueryString["P"]);
            db.insertComida(codigopostal.Text, facebook1.Text, null, null, instagram.Text, null, i, Morada.Text, nome.Text, telefone.Text, video.Text);
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }
    }
}