using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.denyUnknow
{
    public partial class Mudarpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == false)
            {
                Response.Redirect("LoginCriarConta.aspx");
            }
            else
            {
                System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(User.Identity.Name.ToString());
                Label2.Text = mu.LastPasswordChangedDate.ToString();
            }
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if ((TextBox2.Text != "") || (TextBox1.Text != ""))
            {
                if (TextBox2.Text == TextBox1.Text)
                {
                    System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(User.Identity.Name.ToString());
                    mu.ChangePassword(mu.ResetPassword(), TextBox1.Text);
                    object refUrl = ViewState["RefUrl"];
                    if (refUrl != null)
                        Response.Redirect((string)refUrl);
                }
                else
                    Label1.Text = "Palavra pass nao coicide!";

            }
            else
                Label1.Text = "Preencha todos os campos!";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            InstaLocalEntities dbo = new InstaLocalEntities();
            int i = dbo.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
            string File = Path.GetFileName(FileUpload1.FileName);
            string filepath = "~/imagens/" + File;
            FileUpload1.SaveAs(Server.MapPath("~/Imagens/" + FileUpload1.FileName));
            dbo.UpdateUtilizador(i, TextBox3.Text, TextBox4.Text, filepath);
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            divpass.Visible = true;
            divconta.Visible = false;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            divpass.Visible = false;
            divconta.Visible = true;
        }
    }
}