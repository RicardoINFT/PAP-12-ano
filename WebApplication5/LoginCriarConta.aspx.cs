using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class LoginCriarConta : System.Web.UI.Page
    {
        public class CurrentPage
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "adm")
                {
                    TextBox6.Visible = true;
                    TextBox6.Text = "OLA ADMINISTRADOR!";
                }
            }
            if (!IsPostBack)
            {
                ViewState["contador"] = 0;
            }
            int i = 0;
            i = (int)ViewState["contador"];
            divrecuperarpass.Visible = false;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (Divcriar.Visible == false)
            {
                DivLog.Visible = false;
                Divcriar.Visible = true;
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (DivLog.Visible == false)
            {
                DivLog.Visible = true;
                Divcriar.Visible = false;
            }
        }

        InstaLocalEntities db = new InstaLocalEntities();

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Label1.Text = "Falta um ou mais campos por preencher!";
            }
            else if (TextBox3.Text == "")
            {
                Label1.Text = "Falta um ou mais campos por preencher!";
            }
            else if (TextBox4.Text == "")
            {
                Label1.Text = "Falta um ou mais campos por preencher!";
            }
            else if (TextBox5.Text == "")
            {
                Label1.Text = "Falta um ou mais campos por preencher!";
            }
            else
            {
                if (db.Utilizadors.Where(x => x.Nome == TextBox2.Text).Count() == 0)
                {
                    Label1.Text = "";
                    if (TextBox4.Text == TextBox5.Text)
                    {
                        System.Web.Security.Membership.CreateUser(TextBox2.Text, TextBox4.Text);

                        System.Web.Security.MembershipUser User = System.Web.Security.Membership.GetUser(TextBox2.Text);

                        object UserGUID = User.ProviderUserKey;

                        string File = Path.GetFileName(FileUpload1.FileName);
                        string filepath = "~/imagens/" + File;
                        FileUpload1.SaveAs(Server.MapPath("~/Imagens/" + FileUpload1.FileName));

                        db.InsertUtilizador(null, TextBox3.Text, TextBox2.Text, filepath, UserGUID.ToString());

                        Divcriar.Visible = false;
                        DivLog.Visible = true;
                        int i = db.UtilizadorProc().LastOrDefault().ID;
                        using (MailMessage msg = new MailMessage())
                        {
                            msg.From = new MailAddress("");
                            msg.To.Add(TextBox3.Text);
                            msg.Subject = "CODIGO DE ATUALIZAÇÃO DE CONTA ";
                            msg.Body = "<h1>Conta Criada no website PORTUGUIANDO para ativar a sua conta entre no seguinte link</h1> http://localhost:49406/ativar.aspx?Ativar="+UserGUID.ToString();
                            msg.IsBodyHtml = true;
                            using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtpClient.Credentials = new System.Net.NetworkCredential("", "");
                                smtpClient.EnableSsl = true;
                                smtpClient.Send(msg);
                            } 
                        }
                        string ss = db.Utilizadors.Where(x => x.ID == i).FirstOrDefault().Nome;
                        System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(ss);
                        mu.IsApproved = false;
                        System.Web.Security.Membership.UpdateUser(mu);
                    }
                    else
                        Label1.Text = "Palavra passe nao coincide com a confirmacao da mesma!";
                }
                Label1.Text = "User name já está a ser utilizado por outro utilizador";
            }
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            InstaLocalEntities bd = new InstaLocalEntities();
            MembershipUser User = System.Web.Security.Membership.GetUser(Login1.UserName);
            Session["UserID"] = User.ProviderUserKey.ToString();
            string user_id = Session["UserID"].ToString();
            var q = (from U in bd.Utilizadors
                     where U.UserId == user_id
                     select U.ID).FirstOrDefault();
            Session["ID"] = q.ToString();
            string nome = User.UserName;
            if (nome == "adm")
            {
                Session["role"] = "adm";
            }
            Response.Redirect("PRINCIPAL.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {

        }
        //DIv pass
        protected void Button9_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = 0;
            if (divrecuperarpass.Visible == false)
            {
                divrecuperarpass.Visible = true;
            }
            else if(divrecuperarpass.Visible == true)
                divrecuperarpass.Visible = false;
        }
        //confirmar pass

        protected void Button11_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = 0;
            int id = db.Utilizadors.Where(x => x.Nome == recupnome.Text && x.Email == recupemail.Text).Count();
            if (id != 0)
            {
                int length = 7;
                StringBuilder str_build = new StringBuilder();
                Random random = new Random();
                char letter;
                for (int i = 0; i < length; i++)
                {
                    double flt = random.NextDouble();
                    int shift = Convert.ToInt32(Math.Floor(25 * flt));
                    letter = Convert.ToChar(shift + 65);
                    str_build.Append(letter);
                }
                Label3.Text = str_build.ToString();
                string email = recupemail.Text;
                using (MailMessage msg = new MailMessage())
                {
                    msg.From = new MailAddress("");
                    msg.To.Add(email);
                    msg.Subject = "CODIGO DE ATUALIZAÇÃO DE CONTA ";
                    msg.Body = "<h1>Codigo de Confirmação -></h1>" + str_build.ToString();
                    msg.IsBodyHtml = true;
                    using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtpClient.Credentials = new System.Net.NetworkCredential("", "");
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(msg);
                    }
                }
            }
            else
                Label2.Text = "User e email não coicidem!"; 
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            if (recupcodigo.Text == Label3.Text)
            {
                System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(recupnome.Text);
                mu.UnlockUser();
                System.Web.Security.Membership.UpdateUser(mu);
                mu.ChangePassword(mu.ResetPassword(), recuppass.Text);
            }
            else
            {
                Label2.Text = "Codigo de confirmação errado!";
            }
        }
    }
}