using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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

    public void cargaProductos()
    {

        listProductos.DataSource = dsProductos;
        listProductos.DataBind();

    }

    protected void listProductos_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        dsDetalle.SelectCommand = " select * from productos where id=" + e.CommandArgument.ToString();

        lblDetalle.Text = "Detalle del producto de código: " + e.CommandArgument.ToString();

        detalleProducto.DataSource = dsDetalle;
        detalleProducto.DataBind();

        pnlDetalle.Visible = true;
    }
}