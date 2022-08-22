<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Postarestabelcimento.aspx.cs" Inherits="WebApplication5.denyUnknow.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; width: 50em;">
        
        INTRODUZA O SEU ESTABELECIMENTO<br />
        <br />
        <br />
        Local -
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        Nome do seu estabelecimento -
        <asp:TextBox ID="nome" runat="server" class="textbox"></asp:TextBox>
        <br />
        <br />
        Morada - 
        <asp:TextBox ID="Morada" runat="server" class="textbox"></asp:TextBox>
        <br />
        <br />
        Codigo Postal - 
        <asp:TextBox ID="codigopostal" runat="server" class="textbox"></asp:TextBox>
        <br />
        <br />
        Telefone - 
        <asp:TextBox ID="telefone" runat="server" class="textbox" TextMode="Phone"></asp:TextBox>
        <br />
        <br />
        Link de video -
        <asp:TextBox ID="video" class="textbox" runat="server" TextMode="Url"></asp:TextBox>
        <br />
        <br />
        Facebook - 
        <asp:TextBox ID="facebook1" class="textbox" runat="server" TextMode="Url"></asp:TextBox>
        <br />
        <br />
        Instagram - 
        <asp:TextBox runat="server" ID="instagram" class="textbox" TextMode="Url"></asp:TextBox>
        <br />
        <br />
         <li style="float:right; list-style-type: none;">
             <asp:Button ID="Button6" CssClass="example_e" runat="server" OnClick="Button6_Click" Text="ENVIAR" Height="44px" /></li>
            <li style="float:left; list-style-type: none;">
                <asp:Button ID="Button7" CssClass="example_e" runat="server" Text="VOLTAR" Height="45px" OnClick="Button7_Click" />
        </li>
    </div>
</asp:Content>
