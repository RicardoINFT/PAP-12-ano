using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Postar : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["RefUrl"] = Request.UrlReferrer.ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //InformacoesAReceber
            InstaLocalEntities db = new InstaLocalEntities();
            string File = Path.GetFileName(FileUpload1.FileName);
            string filepath = "~/imagens/" + File;
            FileUpload1.SaveAs(Server.MapPath("~/Imagens/" + FileUpload1.FileName));
            int i = db.Utilizadors.Where(x => x.Nome == User.Identity.Name).FirstOrDefault().ID;

            //WHAt3WORDS
            WebRequest req;
            req = WebRequest.Create("https://api.what3words.com/v3/convert-to-3wa?key=QX2Y7RZ3&coordinates="+ lat.Text +"%2C"+ lng.Text);
            req.ContentType = "application/json";
            WebResponse resp = req.GetResponse();
            Stream strm = resp.GetResponseStream();
            StreamReader strm_reader = new StreamReader(strm);
            string json = strm_reader.ReadToEnd();
            What3Words.Root dados = JsonConvert.DeserializeObject<What3Words.Root>(json);
            string w3w = dados.words.ToString();

            //ENVIO
            db.InsertLocal( i, TextBoxNOME.Text, endereco.Text , null, null, lat.Text, lng.Text, TextLegenda.Text, w3w, filepath, null, null);
            int b = db.Locals.Where(x => x.Morada == endereco.Text).FirstOrDefault().ID;

            //envio de fotos
            if (FileUpload1.HasFiles)
            {
                int filec = 0;
                foreach (HttpPostedFile item in FileUpload2.PostedFiles)
                {
                    filec += 1;
                    item.SaveAs(Server.MapPath("~/Imagens/" + item.FileName));
                    string ima = "~/Imagens/" + item.FileName;
                    Foto foto = new Foto();
                    foto.Ficheiro = ima;
                    foto.Local1 = b;
                    foto.Legenda = null;
                    db.Fotoes.Add(foto);
                }
                db.SaveChanges();
            }

            //PAGINA ANTERIOR
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //PAGINA ANTERIOR
            if (!IsPostBack)
            {
                ViewState["PreviousPageUrl"] = Request.UrlReferrer.ToString();
            }
        }

        protected void what3_TextChanged(object sender, EventArgs e)
        {
        }

        protected void lnkGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            //PAGINA ANTERIOR
            object refUrl = ViewState["RefUrl"];
            if (refUrl != null)
                Response.Redirect((string)refUrl);
        }
    }
}