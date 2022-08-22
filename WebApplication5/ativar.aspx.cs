using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class ativar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == true)
            {
                InstaLocalEntities db = new InstaLocalEntities();
                string ids = Request.QueryString["Ativar"];
                string ss = db.Utilizadors.Where(x => x.UserId == ids).FirstOrDefault().Nome;
                System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(ss);
                if (Session["role"] != null)
                {
                    if (Session["role"].ToString() == "adm")
                    {
                        mu.IsApproved = true;
                        mu.Comment = null;
                        System.Web.Security.Membership.UpdateUser(mu);
                        Label1.Text = "<h1>Unban como admin confirmado! Redirecionado em 5 segundos para a pagina principal do website!";
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "5;url=PRINCIPAL.aspx";
                        this.Page.Controls.Add(meta);
                    }
                }
                else if (mu.Comment == null)
                {
                    if (db.Utilizadors.Where(x => x.UserId == ids).Count() != 0)
                    {
                        string email = db.Utilizadors.Where(x => x.UserId == ids).FirstOrDefault().Email;


                        if (mu.IsApproved == false)
                        {
                            mu.IsApproved = true;
                            System.Web.Security.Membership.UpdateUser(mu);
                            using (MailMessage msg = new MailMessage())
                            {
                                msg.From = new MailAddress("");
                                msg.To.Add(email);
                                msg.Subject = "CONFIRMAÇÃO";
                                msg.Body = "<h1>Obrigado por fazer parte desta comunidade</h1>";
                                msg.IsBodyHtml = true;
                                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                                {
                                    smtpClient.Credentials = new System.Net.NetworkCredential("", "");
                                    smtpClient.EnableSsl = true;
                                    smtpClient.Send(msg);
                                }
                            }
                            Response.Redirect("~/LoginCriarConta.aspx");
                        }
                        else
                        {
                            HtmlMeta meta = new HtmlMeta();
                            meta.HttpEquiv = "Refresh";
                            meta.Content = "5;url=PRINCIPAL.aspx";
                            this.Page.Controls.Add(meta);
                            Label1.Text = "<h1>Erro vais ser redirecionado em 5 segundos para a pagina inicial!";
                        }
                    }
                    else
                    {
                        HtmlMeta meta = new HtmlMeta();
                        meta.HttpEquiv = "Refresh";
                        meta.Content = "5;url=PRINCIPAL.aspx";
                        this.Page.Controls.Add(meta);
                        Label1.Text = "<h1>Erro vais ser redirecionado em 5 segundos para a pagina inicial!";
                    }
                }
                else
                {
                    Label1.Text = "<h1>User Banido permanentemente pelo admin";
                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "5;url=PRINCIPAL.aspx";
                    this.Page.Controls.Add(meta);
                }
            }
            else
            {
                Label1.Text = "<h1>Negado a utilizadores desconhecidos!";
                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "5;url=PRINCIPAL.aspx";
                this.Page.Controls.Add(meta);
            }    
        }
    }
}