using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class PAGINAUSER : System.Web.UI.Page
    {
        int CurrentPage = 0;
        InstaLocalEntities db = new InstaLocalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CurrentPage"] = 0;
                
                CurrentPage = (int)ViewState["CurrentPage"];
                int F2 = int.Parse(Request.QueryString["F"]);
                string ip = db.Utilizadors.Where(x => x.ID == F2).FirstOrDefault().Nome;
                System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(ip);
                if (mu.IsApproved == false)
                {
                    ban.Visible = false;
                }
                else
                {
                    banf.Visible = false;
                    Label tb2 = (Label)div1.FindControl("nome");
                    int F = int.Parse(Request.QueryString["F"]);
                    string nome1 = db.Utilizadors.Where(x => x.ID == F).FirstOrDefault().Nome;
                    tb2.Text = nome1;
                    Label tb = (Label)div1.FindControl("segue");
                    Label tb1 = (Label)div1.FindControl("Seguidores");
                    int d1 = int.Parse(db.Segues.Where(x => x.SegueUtilizador == F).Count().ToString());
                    int id2 = db.Utilizadors.Where(x => x.Nome == tb2.Text).FirstOrDefault().ID;
                    int d2 = int.Parse(db.Segues.Where(x => x.SeguidoPorUtilizador == id2).Count().ToString());
                    tb.Text = d1.ToString();
                    tb1.Text = d2.ToString();
                    if (User.Identity.IsAuthenticated)
                    {
                        int id = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
                        string d = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().Email;
                        int userpage = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
                        if (userpage == F)
                        {
                            linkdefinicao.Visible = true;
                            linkdeixardeseguir.Visible = false;
                            LinkButton5.Visible = false;
                            TextBox7.Text = d;
                        }
                        else
                        {
                            Panel1.Visible = false;
                            linkdefinicao.Visible = false;
                        }
                        if (db.Segues.Where(x => x.SeguidoPorUtilizador == F && x.SegueUtilizador == id).Count() != 0)
                        {
                            linkdeixardeseguir.Visible = true;
                            LinkButton5.Visible = false;
                        }
                        else
                        {
                            linkdeixardeseguir.Visible = false;
                            LinkButton5.Visible = true;
                            if (userpage == F)
                            {
                                LinkButton5.Visible = false;
                                linkdeixardeseguir.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        linkdefinicao.Visible = false;
                        linkdeixardeseguir.Visible = false;
                        LinkButton5.Visible = false;
                    }
                    if (Session["role"] != null)
                    {
                        if (Session["role"].ToString() == "adm")
                        {
                            linkdefinicao.Visible = true;
                        }
                    }
                }
            }
        }
        //SEUS POSTS
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            if (DIVPOSTS.Visible == false)
            {
                DIVFOLLOWERs.Visible = false;
                DIVGUARDADOS.Visible = false;
                DIVPOSTS.Visible = true;
            }
        }
        //POSTS DE FOLLOW
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            if (DIVFOLLOWERs.Visible == false)
            {
                DIVFOLLOWERs.Visible = true;
                DIVGUARDADOS.Visible = false;
                DIVPOSTS.Visible = false;
            }
        }
        //GUARDADOS
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            if (DIVGUARDADOS.Visible == false)
            {
                DIVFOLLOWERs.Visible = false;
                DIVGUARDADOS.Visible = true;
                DIVPOSTS.Visible = false;
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            int Loggado = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
            int Seguir = db.Utilizadors.Where(x => x.Nome == nome.Text).FirstOrDefault().ID;
            db.insertSegue(null, Loggado, Seguir);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void ButtonDeleteConta_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            TextBox2.Visible = true;
            Label5.Visible = true;
            TextBox3.Visible = true;
            Button5.Visible = true;
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
            TextBox2.Text = str_build.ToString();
            TextBox2.ReadOnly = true;
        }

        protected void ButtonMudarPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/denyUnknow/Mudarpass.aspx");
        }

        protected void linkdeixardeseguir_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            int F = int.Parse(Request.QueryString["F"]);
            int id = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;

            int Loggado = db.Segues.Where(x => x.SeguidoPorUtilizador == F && x.SegueUtilizador == id).FirstOrDefault().ID;
            db.Deletesegue(Loggado);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void linkdefinicao_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;
            if (DIVdef.Visible == true)
            {
                DIVdef.Visible = false;
            }
            else
                DIVdef.Visible = true;
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int F = int.Parse(Request.QueryString["F"]);
            string id = db.Utilizadors.Where(x => x.ID == F).FirstOrDefault().Nome;
            System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(id);
            mu.IsApproved = false;
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "adm")
                {
                    mu.Comment = "Banido Por ADMIN";
                }
            }
            System.Web.Security.Membership.UpdateUser(mu);
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://agr-odivelas.pt/");
        }
        protected void Buttondetalhesdiv_Click(object sender, EventArgs e)
        {
            Divpass.Visible = false;
            Divdetalhes.Visible = true;
        }

        protected void ButtonPassdiv_Click(object sender, EventArgs e)
        {
            Divdetalhes.Visible = false;
            Divpass.Visible = true;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            InstaLocalEntities dbo = new InstaLocalEntities();
            int i = dbo.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
            string File = Path.GetFileName(FileUpload1.FileName);
            string filepath = "~/imagens/" + File;
            FileUpload1.SaveAs(Server.MapPath("~/Imagens/" + FileUpload1.FileName));
            dbo.UpdateUtilizador(i, TextBox6.Text, TextBox7.Text, filepath);
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("LoginCriarConta.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == TextBox5.Text)
            {
                System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(User.Identity.Name.ToString());
                mu.ChangePassword(mu.ResetPassword(), TextBox4.Text);
                Session.Clear();
                Session.Abandon();
                FormsAuthentication.SignOut();
                Response.Redirect("LoginCriarConta.aspx");
            }
        }
    }
}