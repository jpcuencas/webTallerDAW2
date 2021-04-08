<%@ Page Language="C#" AutoEventWireup="true" CodeFile="holamundo.aspx.cs" Inherits="_Holamundo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Hola mundo</title>
</head>
<body>
    <h1>Hola mundo desde cliente</h1>
    <h1><asp:Label ID="Label1" runat="server" Text="Hola mundo desde control de servidor"></asp:Label></h1>
    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
