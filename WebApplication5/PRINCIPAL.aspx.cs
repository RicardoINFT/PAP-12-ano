using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class PRINCIPAL : System.Web.UI.Page
    {
        int CurrentPage = 0;
        InstaLocalEntities dba = new InstaLocalEntities();
        void bindlistposts(DataTable table)
        {
            PagedDataSource paged = new PagedDataSource();
            paged.DataSource = table.DefaultView;
            paged.PageSize = 4;
            paged.AllowPaging = true;
            paged.CurrentPageIndex = CurrentPage;
            linkPrimeira.Enabled = !paged.IsFirstPage;
            linkAnterior.Enabled = !paged.IsFirstPage;
            linkSeguinte.Enabled = !paged.IsLastPage;
            linkUltima.Enabled = !paged.IsLastPage;
            ViewState["total"] = paged.PageCount;
            DataList1.DataSource = paged;
            DataList1.DataBind();
            ViewState["dataSource"] = table;

        }
        void getposts()
        {
            SqlConnection connection = new SqlConnection
            (@"data source=.\sqlexpress; initial catalog=InstaLocal; " +"integrated security = true;");
            SqlCommand command = new SqlCommand
            ("SELECT ID, Nome, Foto FROM Local", connection);
            SqlDataReader reader;
            DataTable table = new DataTable();
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();
            bindlistposts(table);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getposts();
                ViewState["contador"] = 0;
            }
            CurrentPage = (int)ViewState["contador"];

        }
        protected void linkUltima_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["total"] - 1;
            ViewState["contador"] = CurrentPage;
            bindlistposts((DataTable)ViewState["dataSource"]);
        }

        protected void linkSeguinte_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage += 1;
            ViewState["contador"] = CurrentPage;
            bindlistposts((DataTable)ViewState["dataSource"]);
        }

        protected void linkAnterior_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage -= 1;
            ViewState["contador"] = CurrentPage;
            bindlistposts((DataTable)ViewState["dataSource"]);
        }

        protected void linkPrimeira_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            ViewState["contador"] = CurrentPage;
            getposts();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "command1")
            {
                Response.Redirect("Comentario.aspx?p=" + e.CommandArgument.ToString());
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage -= 1;
            ViewState["contador"] = CurrentPage;
            bindlistposts((DataTable)ViewState["dataSource"]);
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            CurrentPage = (int)ViewState["contador"];
            CurrentPage += 1;
            ViewState["contador"] = CurrentPage;
            bindlistposts((DataTable)ViewState["dataSource"]);
        }
    }
}