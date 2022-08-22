using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApplication5
{
    public partial class TESTES : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                InstaLocalEntities ne = new InstaLocalEntities();

                if (Session["ID"] != null)
                {
                    TextBox3.Text = Session["ID"].ToString();
                }
                int id = ne.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
                TextBox4.Text = id.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            InstaLocalEntities ne = new InstaLocalEntities();
            ne.DeletComida(3);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (MailMessage msg = new MailMessage())
            {
                msg.From = new MailAddress("");
                msg.To.Add("");
                msg.Subject = "APENAS UM TESTE OLA EU DO FUTURO";
                msg.Body = "<h1>ESTE É O BODY</h1>";
                msg.IsBodyHtml = true;

                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.Credentials = new System.Net.NetworkCredential("", "");
                    smtpClient.EnableSsl = true;
                    smtpClient.Send(msg);
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string nome = TextBox2.Text;
            System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser(nome);
                user.IsApproved = true;
            user.Comment = null;
                System.Web.Security.Membership.UpdateUser(user);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            
        }
    }
}