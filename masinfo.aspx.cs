using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class masinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        menu_menu menu = (menu_menu)Master.FindControl("menu1");
        menu.opcion = "opMasInfo";

        paises.cargaSelectPaises(slctPais, "es");

        slctPais.Items.Insert(0, new ListItem("Seleccione un pais", "-1"));

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblIntroForm.Text = "Formulario enviado correctamente con los siguientes datos: ";
        pnlFormulario.Visible = false;
        pnlResultados.Visible = true;

        Literal l = new Literal();

        l.Text = "Nombre: " + txtNombre.Text + "<br>";
        l.Text += "Clave: " + txtPWD.Text + "<br>";
        l.Text += "Pais: " + slctPais.SelectedValue + "<br>";
        l.Text += "Ciudad: " + Request.Form[slctCiudad.UniqueID].ToString() + "<br>";
        l.Text += "Comentarios: " + txtComentario.Text + "<br>";
        l.Text += "Departamentos: ";
        for (int i = 0; i < chkDepartamento.Items.Count; i++)
        {
            if (chkDepartamento.Items[i].Selected == true)
            {
                l.Text += chkDepartamento.Items[i].Value + ", ";
            }
        }
        l.Text+="<br>";

        l.Text += "Respuesta: " + radioResp.SelectedValue + "<br>";

        pnlResultados.Controls.Add(l);

    }
}