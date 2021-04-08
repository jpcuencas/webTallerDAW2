using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajaxCiudades : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pais = Request.Form["pais"].ToString();

        string respuesta = "";

        List<ciudad> lista = ciudades.listadoCiudadesPorPais(Convert.ToInt32(pais));
        if (ciudades.msgError == "")
        {
            if (lista.Count > 0)
            {
                for (int i = 0; i < lista.Count; i++)
                {
                    respuesta += "<option value='" + lista[i].id.ToString() + "'>" + lista[i].nombre_es + "</option>";
                }
            }
            else
            {
                respuesta = "ERR";
            }
        }
        else
        {
            respuesta = "ERR";
        }
        Response.Write(respuesta);
    }
}