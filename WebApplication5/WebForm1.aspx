<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication5.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .circular--square {
            border-radius: 50%;
        }

        .content {
            width: 400px;
            padding: 20px;
            overflow: hidden;
        }

            .content img {
                margin-right: 15px;
                float: left;
            }

            .content h3,
            .content p {
                margin-left: 15px;
                display: block;
                margin: 2px 0 0 0;
            }

        .auto-style3 {
            width: 324px;
        }
        .auto-style4 {
            position: fixed;
            width: 323px;
        }
        .auto-style5 {
            width: 120px;
            height: 121px;
        }
        .auto-style6 {
            width: 415px;
            padding: 20px;
            overflow: hidden;
        }
        .auto-style7 {
            width: 450px;
        }
        .auto-style8 {
            width: 422px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    </p>
    <p>
    </p>
    <div style="margin-left: auto; margin-right: auto; width: 50em;">

        <table style="width: 100%;">

            <tr>
                <td class="auto-style8">
                    <div runat="server" id="loadpage" style="background-color:white">
                        <asp:DataList ID="DataList1" HorizontalAlign="Center" Visible="false" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
                            <SeparatorTemplate>
                                <br />
                                <br />
                                <br />
                                <br />
                            </SeparatorTemplate>
                            <ItemTemplate>
                                <div style="min-width: 500px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                                    &nbsp;Post por -
                                <asp:Label ID="UtilizadorLabel" runat="server" Text='<%# Eval("Expr1") %>' />
                                    &nbsp;<hr />
                                    PUBLICACAO:
                <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                                    <br />
                                    <br />
                                    <div style="text-align: center;">
                                        <asp:ImageButton ID="ImageButton4" Height="354" Width="350px" ImageAlign="Middle" runat="server" ImageUrl='<%# Eval("Foto") %>' CommandArgument='<%# Eval("id") %>' CommandName="command1" />
                                    </div>
                                    <br />

                                    <br />
                                    Descricao:<br />
                                    <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Local.Nome, Local.Foto, Local.Descricao, Utilizador.Nome AS Expr1, Local.ID FROM Local INNER JOIN Utilizador ON Local.Utilizador = Utilizador.ID ORDER BY Local.ID DESC"></asp:SqlDataSource>
                    </div>
                    <div runat="server" id="pesquisa" visible="false">
                        <asp:DataList HorizontalAlign="Center" ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand" CellSpacing="40">
                            <ItemTemplate>
                                <div style="min-width: 465px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" class="auto-style7">
                                    <div class="content">
                                        <asp:Image ID="Image1" runat="server" CssClass="circular--square" Height="42px" ImageUrl='<%# Eval("Expr2") %>' Width="43px" />
                                        <h3>
                                            <asp:Label ID="UtilizadorLabel" runat="server" Text='<%# Eval("Expr1") %>' /></h3>
                                        <p>
                                            PUBLICACAO:
                                            <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                                        </p>
                                        <hr width="”75%”">
                                        <asp:ImageButton ID="ImageButton5" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="command1" Height="435px" ImageAlign="Middle" ImageUrl='<%# Eval("Foto") %>' Width="428px" />
                                        </hr>
                                    </div>
                                    <br />
                                    &nbsp;Descricao:
                                    <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                                    <br />
                                    &nbsp;<br />
                                    <br />
                                &nbsp;</div>

                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Local.Nome, Local.Foto, Local.Descricao, Utilizador.Nome AS Expr1, Local.ID, Utilizador.Foto AS Expr2 FROM Local INNER JOIN Utilizador ON Local.Utilizador = Utilizador.ID WHERE (Local.Morada LIKE '%' + @Morada + '%')">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Morada" QueryStringField="search" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </td>
                <td style="vertical-align: top; " class="auto-style4">
                    <br />
                    <br />
                    <br />
                    <div style="text-align: center; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" class="auto-style3">
                        <asp:LoginView ID="LoginView2" runat="server">
                            <AnonymousTemplate>
                                TEM DE FAZER LOG IN PARA
                            <br />
                                TER ACESSO A TODAS AS FUNCIONALIDADES PRESENTES NO WEBSITE
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />
                                SEJA BEM VINDO<br />
                                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <div style="text-align: center;" class="auto-style3">
                                            <asp:Image ID="Image2" runat="server" Height="49px" CssClass="circular--square" ImageUrl='<%# Eval("Foto") %>' Width="53px" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT [Foto] FROM [Utilizador] WHERE ([Nome] = @Nome)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label2" Name="Nome" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:LoginName ID="LoginName1" runat="server" />
                                <br />
                                Procurar User<br />
                                <br />
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Button ID="Button5" runat="server" CssClass="example_e" Height="45px" OnClick="Button5_Click" Text="Pesquisar!" />
                                <br />
                                <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
                                <br />
                            </LoggedInTemplate>
                        </asp:LoginView>
                        <br />
                    </div>
                    <h4 style="color:darkgrey">WEBSITE PARA PROJETO DE APTIDÃO PARA FINAL DE CURSO EM PROGRAMAÇÃO DA ESCOLA SECUNDARIA DE ODIVELAS!</h4>
                    <p style="color:darkgrey">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click1">Acede Aqui!</asp:LinkButton>
                    </p>
                    <p style="color:darkgrey">
                        <img alt="" class="auto-style5" src="Imagens/qr-code%20(1).png" /></p>
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
