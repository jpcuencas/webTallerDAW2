using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["nombreUsuario"] != "")
        {
            panelNombre.Visible = true;
        }
        else
        {
            panelNombre.Visible = false;
        }
        this.PreRender += MasterPage_PreRender;

    }

    void MasterPage_PreRender(object sender, EventArgs e)
    {
        if (Session["nombreUsuario"] != "")
        {
            panelNombre.Visible = true;
        }
        else
        {
            panelNombre.Visible = false;
        }
    }


    protected void lnkIdioma_Command(object sender, CommandEventArgs e)
    {
        Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(e.CommandArgument.ToString());
        Session["idioma"] = e.CommandArgument.ToString();
    }
}
