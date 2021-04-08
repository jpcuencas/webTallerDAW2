<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="menu_menu" %>

<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= this.opcion %>").addClass("active");
    });
</script>

<ul class="nav navbar-nav">
        <li id="opInicio"><asp:HyperLink ID="linkInicio" runat="server" NavigateUrl="~/Default.aspx" class="btn btn-default navbar-btn"><%= GetLocalResourceObject("opInicio").ToString() %></asp:HyperLink></li>
        <li id="opCatalogo"><asp:HyperLink ID="linkCatalogo" runat="server" NavigateUrl="~/catalogo.aspx" class="btn btn-default navbar-btn"><%= GetLocalResourceObject("opCatalogo").ToString() %></asp:HyperLink></li>
        <li id="opServicios"><asp:HyperLink ID="linkServicios" runat="server" NavigateUrl="~/Default.aspx" class="btn btn-default navbar-btn"><%= GetLocalResourceObject("opServicios").ToString() %></asp:HyperLink></li>
        <li id="opMasInfo"><asp:HyperLink ID="linkMasInfo" runat="server" NavigateUrl="~/masinfo.aspx" class="btn btn-default navbar-btn"><%= GetLocalResourceObject("opMasInfo").ToString() %></asp:HyperLink></li>
</ul>