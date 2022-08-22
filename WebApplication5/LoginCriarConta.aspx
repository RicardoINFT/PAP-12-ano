<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginCriarConta.aspx.cs" Inherits="WebApplication5.LoginCriarConta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 547px;
        }

        .auto-style12 {
            height: 50px;
            width: 290px;
        }

        .auto-style14 {
            height: 50px;
            width: 237px;
        }

        .auto-style15 {
            height: 232px;
            width: 528px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; width: 50em;">
        <br />
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox6" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button7" class="example_e" runat="server" Text="Criar Conta" Height="45px" OnClick="Button7_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" class="example_e" runat="server" Text="Log In" Height="45px" OnClick="Button8_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <div runat="server" id="Divcriar" visible="false">
            CRIACAO DE CONTA
        <br />
            <br />
            Nome -
        <asp:TextBox ID="TextBox2" class="textbox" runat="server"></asp:TextBox>
            <br />
            <br />
            Email -
        <asp:TextBox ID="TextBox3" class="textbox" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            Password -
        <asp:TextBox ID="TextBox4" class="textbox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            Confirmar Password -
        <asp:TextBox ID="TextBox5" class="textbox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button6" class="example_e" runat="server" Text="Criar Conta" Height="46px" OnClick="Button6_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
        </div>
        <div runat="server" id="DivLog">
            LOG IN
             <br />
            <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn" Width="531px">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td class="auto-style4">
                                <table cellpadding="0">
                                    <tr>
                                        <td align="left" class="auto-style14">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nome de Utilizador:</asp:Label>
                                        </td>
                                        <td class="auto-style12">
                                            <asp:TextBox ID="UserName" CssClass="textbox" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="O Nome de Utilizador é obrigatório." ToolTip="O Nome de Utilizador é obrigatório." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="auto-style14">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Palavra-passe:</asp:Label>
                                        </td>
                                        <td class="auto-style12">
                                            <asp:TextBox ID="Password" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Palavra-passe obrigatória." ToolTip="Palavra-passe obrigatória." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Lembrar-se de mim na próxima vez." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <br />
                                            <asp:Button ID="LoginButton" CssClass="example_e" runat="server" CommandName="Login" Text="Iniciar Sessão" ValidationGroup="Login1" Height="45px" />
                                            &nbsp;&nbsp;<br />
                                            <br />
                                            <asp:Button ID="Button9" runat="server" CssClass="example_e" Height="45px" OnClick="Button9_Click" Text="Recuperar Password" Width="290px" />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            <div class="auto-style15" runat="server" id="divrecuperarpass" __designer:mapid="53">
                RECUPERAR PASSWORD
                <asp:Label ID="Label3" runat="server"></asp:Label>
                <br />
                <br />
                Nome da conta -&nbsp;
                <asp:TextBox ID="recupnome" runat="server" CssClass="textbox"></asp:TextBox>
                <br />
                <br __designer:mapid="55" />
                Email -
                 <asp:TextBox ID="recupemail" runat="server" CssClass="textbox"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button11" runat="server" CssClass="example_e" Height="45px" OnClick="Button11_Click" Text="Enviar Codigo" />
                <br />
                <br __designer:mapid="58" />
                <asp:Label ID="Label4" runat="server" Text="Nova Pass - "></asp:Label>
                 <asp:TextBox ID="recuppass" runat="server" CssClass="textbox"></asp:TextBox>
                <br __designer:mapid="5a" />
                <br __designer:mapid="5b" />
                <asp:Label ID="Label5" runat="server" Text="Confirmação -"></asp:Label>
&nbsp;<asp:TextBox ID="recupepasscon" runat="server" OnTextChanged="TextBox9_TextChanged" CssClass="textbox"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Codigo -"></asp:Label>
&nbsp;<asp:TextBox ID="recupcodigo" runat="server" CssClass="textbox"></asp:TextBox>
                <br __designer:mapid="5d" />
                <br __designer:mapid="5e" />
                <asp:Button ID="Button10" runat="server" CssClass="example_e" Height="44px" Text="Recuperar" OnClick="Button10_Click" />
                <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
