<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Comentario.aspx.cs" Inherits="WebApplication5.denyUnknow.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            margin-right: 40px;
        }
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
            width: 796px;
            height: 505px;
        }
        .auto-style4 {
            width: 50em;
            height: 7096px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; " class="auto-style4">
        <br />
        <br />
        <br />
        <br />
        <div style="align-content: center" class="auto-style2">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <div style="min-width: 825px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <div class="content">
                            <asp:Image ID="Image1" runat="server" CssClass="circular--square" Height="42px" ImageUrl='<%# Eval("Expr2") %>' Width="43px" />
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Expr1") %>'></asp:Label>&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Text="Perfil"></asp:LinkButton>
                            </h3>
                            <p>
                                PUBLICAÇÃO -
                                <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                            </p>
                            <hr />
                        </div>
                        <div style="text-align: center">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="439px" Width="553px" ImageUrl='<%# Eval("Foto") %>' />
                        </div>
                        <br />
                        &nbsp;Descricao -&nbsp;
            <asp:Label ID="DescricaoLabel" runat="server" Text='<%# Eval("Descricao") %>' />
                        <br />
                        <br />
                        &nbsp;What3Words -
            <asp:Label ID="What3WordsLabel" runat="server" Text='<%# Eval("What3Words") %>' />
                        <br />
                        <br />
                        &nbsp;Morada -
            <asp:Label ID="MoradaLabel" runat="server" Text='<%# Eval("Morada") %>' />
                        <br />
                        <br />
                        <asp:LoginView ID="LoginView2" runat="server">
                            <AnonymousTemplate>
                                &nbsp;
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <br />
                                <asp:LinkButton ID="LinkButton9" ForeColor="Red" runat="server">Reportar Post</asp:LinkButton>
                                <br />
                            </LoggedInTemplate>
                        </asp:LoginView>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>

            </asp:DataList>
        </div>
        <br />
        <div style="text-align: center;">
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" CssClass="example_e" Height="16px" Width="184px">Eliminar Post</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click" Visible="False" CssClass="example_e" Height="16px" Width="170px">Não Guardar</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click" Visible="false" CssClass="example_e" Height="16px" Width="124px">Guardar</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="Button7" runat="server" CssClass="example_e" Height="16px" Text="ESTABELECIMENTO" OnClick="Button7_Click" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="Button7"></ajaxToolkit:ModalPopupExtender>
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp; 
            <br />
            <br />
            <asp:Button ID="Button1" CssClass="example_e" runat="server" Text="MOSTRAR MAIS FOTOS E ESTABELECIMENTOS" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
        <div id="div1" runat="server" style="text-align: center" visible="false">
            MAIS FOTOS DO LOCAL<br />
            <asp:DataList ID="DataList3" HorizontalAlign="Center" runat="server" DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" RepeatColumns="4" RepeatDirection="Horizontal">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    &nbsp;<asp:Image ID="Image1" runat="server" Width="180px" Height="147px" ImageUrl='<%# Eval("Ficheiro") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            &nbsp;&nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT [Nome], [Morada], [Telefone], [Facebook], [Instagram] FROM [Comida] WHERE ([Local1] = @Local1)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Local1" QueryStringField="P" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Ficheiro] FROM [Foto] WHERE ([Local1] = @Local1)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Local1" QueryStringField="p" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div>
                ESTABELECIMENTOS<br />
                <asp:DataList ID="DataList4" runat="server" HorizontalAlign="Center" DataSourceID="SqlDataSource4">
                    <ItemTemplate>
                        Nome:
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Eval("Nome") %>' />
                        <br />
                        <br />
                        Morada:
                    <asp:Label ID="MoradaLabel" runat="server" Text='<%# Eval("Morada") %>' />
                        <br />
                        <br />
                        Telefone:
                    <asp:Label ID="TelefoneLabel" runat="server" Text='<%# Eval("Telefone") %>' />
                        <br />
                        <br />
                        Facebook:
                    <asp:Label ID="FacebookLabel" runat="server" Text='<%# Eval("Facebook") %>' />
                        <br />
                        Instagram:
                    <asp:Label ID="InstagramLabel" runat="server" Text='<%# Eval("Instagram") %>' />
                        <br />
                        <br />
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Panel ID="Panel1" runat="server" BackColor="White" Visible="false" HorizontalAlign="Center" Width="799px" >
               <div style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" class="auto-style3">
                    <br />
                    POSTAR ESTABELECIMENTO<br />
                    <br />
                    INTRODUZA O SEU ESTABELECIMENTO<br />
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
                    <asp:TextBox ID="video" runat="server" class="textbox" TextMode="Url"></asp:TextBox>
                    <br />
                    <br />
                    Facebook -
                    <asp:TextBox ID="facebook1" runat="server" class="textbox" TextMode="Url"></asp:TextBox>
                    <br />
                    <br />
                    Instagram -
                    <asp:TextBox ID="instagram" runat="server" class="textbox" TextMode="Url"></asp:TextBox>
                    <br />
                    <asp:Button ID="voltar" runat="server" CssClass="example_e" Height="41px" Text="VOLTAR" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="sair" runat="server" CssClass="example_e" Height="42px" Text="ENVIAR" OnClick="sair_Click" />
                </div>
            </asp:Panel>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <div style="text-align: center; align-content: center; align-items: center">
                    <a href="LoginCriarConta.aspx" style="color: black">LOG IN PARA COMENTAR </a>
                </div>
            </AnonymousTemplate>
            <LoggedInTemplate>
                <br />
                ESPAÇO PARA COMENTAR<br />
                <br />
                - Comentario -
                <br />
                <asp:TextBox ID="TextBox1" Class="textbox" runat="server" TextMode="MultiLine" Height="93px" Width="298px"></asp:TextBox>
                <br />
                <br />
                - Avaliação -
            <br />
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="49px" RepeatDirection="Horizontal" Width="797px">
                    <asp:ListItem Value="0"></asp:ListItem>
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                    <asp:ListItem Value="4"></asp:ListItem>
                    <asp:ListItem Value="5"></asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                <asp:LinkButton ID="LinkButtonComentar" runat="server" OnClick="LinkButtonComentar_Click" CssClass="example_e" Height="16px">COMENTAR</asp:LinkButton>
                <br />
                <br />
                <br />
            </LoggedInTemplate>
        </asp:LoginView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Comentario_Classificacao.Comentarios, Comentario_Classificacao.Classificacao, Utilizador.Nome, Comentario_Classificacao.Utilizador, Comentario_Classificacao.ID FROM Comentario_Classificacao INNER JOIN Utilizador ON Comentario_Classificacao.Utilizador = Utilizador.ID WHERE (Comentario_Classificacao.Local1 = @Local1)" OnSelecting="SqlDataSource2_Selecting">
            <SelectParameters>
                <asp:QueryStringParameter Name="Local1" QueryStringField="p" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Utilizador.Nome AS Expr1, Local.Nome, Local.Foto, Local.Descricao, Local.What3Words, Local.Morada, Utilizador.Foto AS Expr2 FROM Local INNER JOIN Utilizador ON Local.Utilizador = Utilizador.ID WHERE (Local.ID = @ID)" OnSelecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="p" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMENTARIOS<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" OnDataBinding="DataList2_DataBinding" OnItemCommand="DataList2_ItemCommand" Width="363px" OnItemDataBound="DataList2_ItemDataBound">
            <ItemTemplate>
                <br />
                Utilizador -
                        <asp:Label ID="UtilizadorLabel" runat="server" Text='<%# Eval("Nome") %>' />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                <br />
                Classificacao -
                        <asp:Label ID="ClassificacaoLabel" runat="server" Text='<%# Eval("Classificacao") %>' />
                &nbsp;Pontos<br />
                <br />
                - Comentario -<br />
                <asp:Label ID="ComentariosLabel" runat="server" Text='<%# Eval("Comentarios") %>' />
                <br />
                <br />
                <asp:LinkButton ID="Eliminarcomment" runat="server" OnCommand="Eliminarcomment_Command" CommandName="command1" CommandArgument='<%# Eval("ID") %>'>Eliminar Comentário!</asp:LinkButton>
                <br />
                <hr />
            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>
