<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="mn" TagName="Menu" Src="~/Menu/menu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server"> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Cabecera" Runat="Server">
    <h2 class="col-xs-12"><asp:Label ID="lblTitulo" runat="server" Text="" ></asp:Label></h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Menu" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contenido" Runat="Server">
    <h2>Hola</h2>
    <asp:Panel ID="pnlNombre" runat="server" Visible="true">
        <div class="form-group">
            <asp:Label ID="lblNombre" AssociatedControlID="txtNombre" runat="server" Text="Por favor, dinos tu nombre: "></asp:Label>
           <asp:TextBox ValidationGroup="default" ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
                <asp:RequiredFieldValidator  ValidationGroup="default" CssClass="alert alert-danger" ID="requiredNombre" runat="server" ErrorMessage="debe escribir su nombre" ControlToValidate="txtNombre" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
                <asp:Button  ValidationGroup="default" ID="btnSubmit" runat="server" Text="Enviar" UseSubmitBehavior="true" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </asp:Panel>

    <asp:Label ID="lblAux" runat="server" Text=""></asp:Label>
</asp:Content>

