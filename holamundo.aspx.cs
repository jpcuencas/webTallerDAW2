using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Holamundo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl h1 = new HtmlGenericControl();
        h1.TagName = "h1";
        h1.InnerText = "Hola mundo desde código de servidor";

        Panel1.Controls.Add(h1);
    }
}