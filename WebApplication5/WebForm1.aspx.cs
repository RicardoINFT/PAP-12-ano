using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request["search"] != "")
            {
                pesquisa.Visible = true;
                loadpage.Visible = false;
                if(User.Identity.IsAuthenticated == true)
                {
                    Label label2 = (Label)LoginView2.FindControl("Label2");
                    label2.Text = User.Identity.Name;
                }
            }
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox ts = LoginView2.FindControl("TextBox2") as TextBox;
            Label lb = LoginView2.FindControl("Label1") as Label;
            InstaLocalEntities db = new InstaLocalEntities();
            if (db.Utilizadors.Where(x => x.Nome == ts.Text).Count() != 0)
            {
                Response.Redirect("PAGINAUSER.aspx?F=" + db.Utilizadors.Where(x => x.Nome == ts.Text).FirstOrDefault().ID);
            }
            else
                lb.Text = "UTILIZADOR NAO ENCONTRADO!";
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //RadioButtonList radioButtonList = LoginView2.FindControl("RadioButtonList1") as RadioButtonList;
            //if(radioButtonList.SelectedValue == "Pordata")
            //{
            //    SqlDataSource2.SelectCommand = "SELECT Local.Nome, Local.Foto, Local.Descricao, Utilizador.Nome AS Expr1, Local.ID FROM Local INNER JOIN Utilizador ON Local.Utilizador = Utilizador.ID WHERE (Local.Morada LIKE '%' + @Morada + '%') Order BY column1 asc";
            //}
            //else if (radioButtonList.SelectedValue == "PorAZ")
            //{ 
            //}
            //else if (radioButtonList.SelectedValue == "Porclassificacao")
            //{ 
            //}
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://agr-odivelas.pt/");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}