using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class catalogo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        menu_menu menu = (menu_menu)Master.FindControl("menu1");

        menu.opcion = "opCatalogo";

        cargaProductos();

    }

    protected override void InitializeCulture()
    {
        string idioma = "es-ES";

        string dato = Request["__EVENTTARGET"] != null ? Request["__EVENTTARGET"].ToString() : "";
        if (dato.IndexOf("lnkIdioma") != -1)
        {
            switch (dato.Substring(dato.Length - 3, 3))
            {
                case "Esp":
                    idioma = "es-ES";
                    break;
                case "Eng":
                    idioma = "en-US";
                    break;
                case "Cat":
                    idioma = "ca-ES";
                    break;
                default:
                    idioma = "es-ES";
                    break;
            }
        }
        else if (Session["idioma"] != null)
        {
            idioma = Session["idioma"].ToString();
        }

        Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(idioma);
    }

    public void cargaProductos()
    {

        DataSet productos = new DataSet();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["provesDAW"].ConnectionString))
        {

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("select p.id, p.nombre, p.precio, c.nombre as nombreCategoria from productos p, categorias c where p.categoria = c.id order by nombreCategoria, nombre ", con);
                adapter.Fill(productos);

                listaProductos.DataSource = productos;

                listaProductos.DataBind();
            }
            catch (Exception ex)
            {
                lblAux.Visible = true;
                lblAux.Text = "Error al obtener los paises (poblando el desplegable). Causa: " + ex.Message;
            }
            finally
            {
                con.Close();
            }

        }

    }
}