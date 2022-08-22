<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TESTES.aspx.cs" Inherits="WebApplication5.TESTES" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 345px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <div class="auto-style1" style="background-color: red">
                    <asp:Button ID="Button6" runat="server" Text="FECHAR" OnClick="Button6_Click" />
                    <br />
                    <br />
                    Teste<br />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
                    <br />
                    <br />
                    user para block<br />
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button" />
                    <br />
                    <br />
                    session id<br />
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>
        </div>
        <p>
            <asp:Button ID="Button5" runat="server" Text="pop" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="Button5"></ajaxToolkit:ModalPopupExtender>
        </p>
    </form>
</body>
</html>
