<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalogo2.aspx.cs" Inherits="catalogo" %>

<%@ Register TagPrefix="mn" TagName="Menu" Src="~/Menu/menu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server"> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Cabecera" Runat="Server">
    <h2>Catálogo de productos</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Menu" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contenido" Runat="Server">
    <h2>Aquí puede ver nuestros productos</h2>
    
    <asp:SqlDataSource ID="dsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:provesDAW %>" SelectCommand="SELECT id, nombre, precio FROM productos"></asp:SqlDataSource>
    <asp:Repeater ID="listProductos" runat="server" OnItemCommand="listProductos_ItemCommand">
        <HeaderTemplate>
            <table class="table table-striped table-bordered table-hover">
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>&nbsp;</th>
                </tr>          
        </HeaderTemplate>

        <ItemTemplate>
        <tr>
            <td style="width: 10%;">
                <%# Eval("id") %>
            </td>
            <td style="width: 50%;">
                <%# Eval("nombre") %>
            </td>     
            <td style="width: 20%;">
                <%# Eval("precio") %>
            </td>  
            <td style="text-align: center; width: 20%;">
                <asp:LinkButton ID="lnkDetail" runat="server" CssClass="btn btn-default btn-sm" ToolTip="Ver detalles" CommandArgument='<%# Eval("id") %>' >
                    <span class="glyphicon glyphicon-align-justify"></span>
                </asp:LinkButton>
            </td>              
        </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource ID="dsDetalle" ConnectionString="<%$ ConnectionStrings:provesDAW %>" runat="server"></asp:SqlDataSource>

    <asp:Panel ID="pnlDetalle" runat="server" Visible="false">
        <h4><asp:Label ID="lblDetalle" runat="server" Text="Detalle del producto:"></asp:Label></h4>
              
        <asp:DetailsView ID="detalleProducto" runat="server" Height="100%" Width="100%" CssClass="table table-striped table-bordered table-hover"></asp:DetailsView>  
    </asp:Panel>
    <asp:Label ID="lblAux" Visible="false" runat="server" Text="Label"></asp:Label>
</asp:Content>

