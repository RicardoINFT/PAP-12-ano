using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5.denyUnknow
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int CurrentPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button7.Visible = false;
                LinkButton5.Visible = false;
                string nome = User.Identity.Name;
                Label user = DataList1.Items[0].FindControl("Label1") as Label;
                int id1 = db.Utilizadors.Where(x => x.Nome == user.Text).FirstOrDefault().ID;
                if (User.Identity.IsAuthenticated)
                {
                    Panel1.Visible = true;
                    Button7.Visible = true;
                    int id2 = db.Utilizadors.Where(x => x.Nome == nome).FirstOrDefault().ID;
                    if (id1 == id2)
                    {
                        LinkButton5.Visible = true;
                    }
                    else
                    {
                        LinkButton5.Visible = false;
                    }
                    int F = int.Parse(Request.QueryString["p"]);
                    if (db.Visitars.Where(x => x.local1 == F && x.user1 == id2).Count() != 0)
                    {
                        LinkButton8.Visible = true;
                        LinkButton7.Visible = false;
                    }
                    else
                    {
                        LinkButton7.Visible = true;
                        LinkButton8.Visible = false;
                    }
                }
                
                if (Session["role"] != null)
                {
                    if (Session["role"].ToString() == "adm")
                    {
                        LinkButton5.Visible = true;
                    }
                }
                //if (User.Identity.IsAuthenticated == true)
                //{
                //    DataList dataList = LoginView1.FindControl("DataList2") as DataList;
                //    LinkButton eliminar = dataList.FindControl("LinkButton9") as LinkButton;
                //    Label nome1 = dataList.FindControl("UtilizadorLabel") as Label;
                //    if (nome1.Text == User.Identity.Name)
                //    {
                //        eliminar.Visible = true;
                //    }
                //    else
                //        eliminar.Visible = false;
                //}
                //DataList k = LoginView1.FindControl("DataList2") as DataList;
                //k.DataBind();
                ViewState["contador"] = 0;
            }
            CurrentPage = (int)ViewState["contador"];
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        InstaLocalEntities db = new InstaLocalEntities();
        protected void LinkButtonComentar_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;

            TextBox Comentario = LoginView1.FindControl("TextBox1") as TextBox;
            RadioButtonList Classifi = LoginView1.FindControl("RadioButtonList1") as RadioButtonList;
            if (Classifi.SelectedItem != null)
            {
                if (Comentario.Text != "")
                {
                    int idlocal = int.Parse(Request.QueryString["p"]);
                    int iduser = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
                    db.Insertcomentarios(Comentario.Text, DateTime.Now, int.Parse(Classifi.SelectedItem.Value), DateTime.Now.TimeOfDay, idlocal, iduser);
                    DataList2.DataBind();
                    Comentario.Text = "";
                    Classifi.ClearSelection();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Obrigado por contribuir com a comunidade!" + "');", true);
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Falta a Comentario" + "');", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Falta classificacao" + "');", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            
            if (div1.Visible == true)
            {
                div1.Visible = false;
            }
            else
            {
                div1.Visible = true;
            };
            ViewState["contador"] = CurrentPage;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }
        //NADA
        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        }
        //NADA
        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //NADA
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
        //NADA
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //pAGINA DO USER
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;

            Label userid = DataList1.Items[0].FindControl("Label1") as Label;
            int i = db.Utilizadors.Where(x => x.Nome == userid.Text).FirstOrDefault().ID;
            Response.Redirect("PAGINAUSER.aspx?F=" + i);
        }
        //eLIMINAR POST
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;

            int idlocal = int.Parse(Request.QueryString["p"]);

            //DELETAR COMIDA
            foreach (var item in db.ComidaProc())
            {
                if (db.Comidas.Where(x => x.Local1 == idlocal).Count() != 0)
                {
                    int id = db.Comidas.Where(x => x.Local1 == idlocal).FirstOrDefault().ID;
                    db.DeletComida(id);
                }
            }

            //DELETAR COMENTARIOS
            foreach (var item in db.ComentariosProc())
            {
                if (db.Comentario_Classificacao.Where(x => x.Local1 == idlocal).Count() != 0)
                {
                    int id = db.Comentario_Classificacao.Where(x => x.Local1 == idlocal).FirstOrDefault().ID;
                    db.DeleteComentarios(id);
                }
            }

            //DELETAR FOTOS
            foreach (var item in db.FotoProc())
            {
                if (db.Fotoes.Where(x => x.Local1 == idlocal).Count() != 0)
                {
                    int id = db.Fotoes.Where(x => x.Local1 == idlocal).FirstOrDefault().ID;
                    db.DeletFoto(id);
                }
            }

            //DELETAR VISITAR
            foreach (var item in db.ProcVisitar())
            {
                if (db.Visitars.Where(x => x.local1 == idlocal).Count() != 0)
                {
                    int id = db.Visitars.Where(x => x.local1 == idlocal).FirstOrDefault().id;
                    db.DeleteVisitar(id);
                }
            }

            db.DeleteLocal(idlocal);
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Post e respetivos complementos eliminados!" + "');", true);
            Response.Redirect("WebForm1.aspx?Search=");
        }
        //ESTABELICIMENTO
        protected void LinkButton6_Click(object sender, EventArgs e)
        {

            if (User.Identity.IsAuthenticated)
            {

                Label label = DataList1.Items[0].FindControl("MoradaLabel") as Label;
                int i = db.Locals.Where(x => x.Morada == label.Text).FirstOrDefault().ID;
                Response.Redirect("denyUnknow/Postarestabelcimento.aspx?L=" + i);
            }
        }
        //GUARDAR POST
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            int d = int.Parse(Request.QueryString["p"]);
            int i = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;
            db.InsertVisitar(d, i);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        //REMOVE VISITAR
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            int F = int.Parse(Request.QueryString["p"]);
            int id = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;

            int lugar = db.Visitars.Where(x => x.local1 == F && x.user1 == id).FirstOrDefault().id;
            db.DeleteVisitar(lugar);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                db.DeleteComentarios(int.Parse(e.CommandArgument.ToString()));
            }
            DataList2.DataBind();
        }

        protected void DataList2_DataBinding(object sender, EventArgs e)
        {
        }

        protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            ViewState["contador"] = CurrentPage;

            LinkButton eliminar = (LinkButton)e.Item.FindControl("Eliminarcomment");
            eliminar.Visible = false;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (User.Identity.IsAuthenticated)
                {
                    Label nome1 = (Label)e.Item.FindControl("UtilizadorLabel");
                    if (nome1.Text == User.Identity.Name)
                    {
                        eliminar.Visible = true;
                    }
                    else if (Session["role"] != null)
                    {
                        if (Session["role"].ToString() == "adm")
                        {
                            eliminar.Visible = true;
                        }
                    }
                    else
                        eliminar.Visible = false;
                }
            }
        }

        protected void Eliminarcomment_Command(object sender, CommandEventArgs e)
        {

        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            ViewState["contador"] = CurrentPage;

            string s = User.Identity.Name;
            System.Web.Security.MembershipUser mu = System.Web.Security.Membership.GetUser(s);

            mu.IsApproved = true;
            System.Web.Security.Membership.UpdateUser(mu);
            using (MailMessage msg = new MailMessage())
            {
                msg.From = new MailAddress("goldenplayersmad@gmail.com");
                msg.To.Add(db.Utilizadors.Where(x => x.Nome == s).FirstOrDefault().Email);
                msg.Subject = "REPORT";
                string absoluteurl = HttpContext.Current.Request.Url.AbsoluteUri;
                msg.Body = "<h1>REPORTAR POST</h1> POST REPORTADO -> " + absoluteurl + " POR " + s;
                msg.IsBodyHtml = true;
                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.Credentials = new System.Net.NetworkCredential("goldenplayersmad@gmail.com", "sonic123");
                    smtpClient.EnableSsl = true;
                    smtpClient.Send(msg);
                }
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
        }

        protected void sair_Click(object sender, EventArgs e)
        {
            int i = int.Parse(Request.QueryString["p"]);
            db.insertComida(codigopostal.Text, facebook1.Text, null, null, instagram.Text, null, i, Morada.Text, nome.Text, telefone.Text, video.Text);
            DataList4.DataBind();
        }
    }
}