<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Mudarpass.aspx.cs" Inherits="WebApplication5.denyUnknow.Mudarpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
            height: 373px;
        }

        .auto-style3 {
            width: 170px;
        }

        .auto-style4 {
            height: 257px;
        }

        .auto-style5 {
            height: 219px;
        }

        .auto-style6 {
            width: 170px;
            height: 278px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; width: 50em;">
        <br />
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">
                    <asp:Button ID="Button7" runat="server" CssClass="example_e" Height="45px" Text="Detalhes de conta" Width="189px" OnClick="Button7_Click" />
                    <br />
                    <br />
                    <asp:Button ID="Button8" runat="server" CssClass="example_e" Height="46px" Text="Palavra pass" Width="189px" OnClick="Button8_Click" />
                </td>
                <td rowspan="2">
                    <div class="auto-style4" runat="server" id="divpass">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        MUDANÇA DE PASSWORD
        - Realizada pela ultima vez em
        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Password nova-<br />
                        &nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>

                        <br />
                        <br />

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        Confirmar a nova
        password-<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox"></asp:TextBox>
                        <br />
                        <br />


                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button5" runat="server" CssClass="example_e" Text="Confirmar" Width="200px" Height="45px" OnClick="Button5_Click" />


                    </div>
                    <div class="auto-style5" visible="false" runat="server" id="divconta">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ALTERAR DETALHES
                            <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Nome -
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Foto -
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Email -
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="CONFIRMAR" runat="server" CssClass="example_e" Height="44px" OnClick="Button9_Click" Text="Button" Width="113px" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Button6" runat="server" CssClass="example_e" Height="45px" OnClick="Button6_Click" Text="Voltar atrás" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
</asp:Content>
