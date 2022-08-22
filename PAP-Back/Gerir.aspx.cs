using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAP_Back
{
    public partial class Gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //FALTA ACABAR DE FAZER REMOVES da tabela FOLLOW FOTO VISITAR COMENTARIO
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        InstaLocalEntities InstaLocalEntities = new InstaLocalEntities();
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int IdUser = int.Parse(GridView1.SelectedRow.Cells[0].Text);
            InstaLocalEntities.DeletUtilizador(IdUser);
            foreach( var item in InstaLocalEntities.Locals.Where(x => x.Utilizador == IdUser))
            {
                int local = InstaLocalEntities.Locals.Where(x => x.Utilizador == IdUser).FirstOrDefault().ID;
                InstaLocalEntities.DeleteLocal(local);
            }

        }
        //FALTA ACABAR DE FAZER REMOVES da tabela FOTO VISITAR COMENTARIO
        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }
    }
}