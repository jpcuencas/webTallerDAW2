using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    string aux="";
    protected void Page_Load(object sender, EventArgs e)
    {
        Application["nombreWeb"] = "Diseño de aplicaciones web con webforms";

        menu_menu menu = (menu_menu)Master.FindControl("menu1");

        menu.opcion = "opInicio";

        if (Session["nombreUsuario"].ToString() != "")
        {
            pnlNombre.Visible = false;
        }
        else
        {
            pnlNombre.Visible = true;
        }

        CargaTextos();
    }

    protected override void InitializeCulture() {
        string idioma="es-ES";
        
        string dato =Request["__EVENTTARGET"]!=null?Request["__EVENTTARGET"].ToString():"";
        if (dato.IndexOf("lnkIdioma")!=-1) {
            switch (dato.Substring(dato.Length-3, 3)) {
                case "Esp":
                    idioma="es-ES";
                    break;
                case "Eng":
                    idioma="en-US";
                    break;
                case "Cat":
                    idioma="ca-ES";
                    break;
                default:
                    idioma="es-ES";
                    break;
            }
        }
        else if (Session["idioma"] != null)
        {
            idioma = Session["idioma"].ToString();
        }
        
        Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(idioma);
    }


    public void CargaTextos()
    {
        lblTitulo.Text = GetLocalResourceObject("txtBienvenida").ToString();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtNombre.Text != "")
        {
            Session["nombreUsuario"] = txtNombre.Text;
        }
    }

}