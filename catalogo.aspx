<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalogo.aspx.cs" Inherits="catalogo" %>

<%@ Register TagPrefix="mn" TagName="Menu" Src="~/Menu/menu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server"> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Cabecera" Runat="Server">
    <h2 class="col-xs-12"><%= GetLocalResourceObject("titulo").ToString() %></h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Menu" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contenido" Runat="Server">
    <h2><%= GetLocalResourceObject("intro").ToString() %></h2>

    <asp:GridView ID="listaProductos" runat="server" CssClass="table table-striped table-bordered table-hover"></asp:GridView>

    <asp:Label ID="lblAux" Visible="false" runat="server" Text="Label"></asp:Label>

    <asp:HyperLink ID="lnkCatalogo2" NavigateUrl="~/catalogo2.aspx" runat="server">Ver. 2 del catálogo</asp:HyperLink>
</asp:Content>

