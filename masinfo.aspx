<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="masinfo.aspx.cs" Inherits="masinfo" EnableEventValidation="false" %>

<%@ Register TagPrefix="mn" TagName="Menu" Src="~/Menu/menu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
<script type="text/javascript">

    $(document).ready(function () {

        $("#errCiudades").hide();
        $("#slctCiudad").prop('disabled', true);

        $("#slctPais").change(function () {
            $.ajax({
                url: "ajaxCiudades.aspx",
                type: "POST",
                data: { pais: $(this).prop("value") },
                dataType: "html"
            }).done(function (data) {
                if (data != "ERR") {
                    $("#slctCiudad").html(data);
                    $("#errCiudades").hide();
                    $("#slctCiudad").prop('disabled', false);
                } else {
                    $("#slctCiudad").prop('disabled', true);
                    $("#errCiudades").show();

                }
            });
        });
    });

</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Cabecera" Runat="Server">
   <h2>Solicitud de más información (con AJAX)</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Menu" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Contenido" Runat="Server">
    <h2><asp:Label ID="lblIntroForm" runat="server" Text="Por favor rellene el siguiente formulario para solicitar más información:"></asp:Label></h2>
    <asp:Panel ID="pnlFormulario" runat="server">
        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" AssociatedControlID="txtNombre" Text="Su nombre: "></asp:Label>
            <asp:Label ID="lblNombreObl" runat="server" Text="(*)" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
         </div>
        <div class="form-group">
            <asp:RequiredFieldValidator CssClass="alert alert-danger" ID="requiredNombre" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="txtNombre" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPWD" runat="server" AssociatedControlID="txtPWD" Text="Escriba una clave: "></asp:Label>
            <asp:Label ID="lblPWDObl" runat="server" Text="(*)" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="txtPWD" TextMode="Password" runat="server" CssClass="form-control" ToolTip="Mínimo 6 carácteres"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:RequiredFieldValidator CssClass="alert alert-danger" ID="requiredPWD" runat="server" ErrorMessage="Este campo es obligatorio" ControlToValidate="txtPWD" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator  CssClass="alert alert-danger" SetFocusOnError="true" ID="REPWD" runat="server" ErrorMessage="Longitud mínima de 6 carácteres" Display="Dynamic" ControlToValidate="txtPWD" ValidationExpression="[0-9A-Za-z]{6,32}"></asp:RegularExpressionValidator>
        </div>
    
        <div class="form-group">
            <asp:Label ID="lblPais" runat="server" AssociatedControlID="slctPais" Text="País de residencia: "></asp:Label>
            <asp:DropDownList ClientIDMode="Static" ID="slctPais" runat="server" CssClass="form-control">
                
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="lblCiudad"  runat="server" AssociatedControlID="slctCiudad" Text="Ciudad: "></asp:Label>
            <asp:DropDownList ClientIDMode="Static" ID="slctCiudad" runat="server" CssClass="form-control">

            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Panel Visible="true" ClientIDMode="Static" ID="errCiudades" runat="server" CssClass="alert alert-danger"><asp:Label ID="lblErrCiudad" runat="server" Text="Error al seleccionar un país."></asp:Label></asp:Panel>
        </div>

        <div class="form-group">
            <asp:Label ID="lblComentarios" runat="server" AssociatedControlID="txtComentario" Text="Su comentario o sugerencia: "></asp:Label>
            <asp:TextBox ID="txtComentario" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblDepartamento" runat="server" AssociatedControlID="chkDepartamento" Text="Departamentos involucrados: "></asp:Label>
            <asp:CheckBoxList ID="chkDepartamento" runat="server">
                <asp:ListItem Text="Contabilidad" Value="CON"></asp:ListItem>
                <asp:ListItem Text="Compras" Value="COM"></asp:ListItem>
                <asp:ListItem Text="Ventas" Value="VEN"></asp:ListItem>
                <asp:ListItem Text="Gerencia" Value="GER"></asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <div class="form-group">
            <asp:Label ID="lblRespuesta" runat="server" AssociatedControlID="radioResp" Text="Desea recibir una respuesta?"></asp:Label>
            <asp:RadioButtonList ID="radioResp" runat="server">
                <asp:ListItem Text="Sí" Value="S"></asp:ListItem>
                <asp:ListItem Text="No" Value="N" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar" UseSubmitBehavior="true" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlResultados" runat="server" Visible="false">

    </asp:Panel>
    <asp:Label ID="lblAux" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

