<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PAGINAUSER.aspx.cs" Inherits="WebApplication5.PAGINAUSER" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 50em;
        }

        .circular--square {
            border-radius: 50%;
        }

        .auto-style3 {
            width: 5.4em;
            height: 90px;
            margin-left: 90px;
        }

        .auto-style4 {
            height: 109px;
        }

        .auto-style5 {
            height: 109px;
            width: 703px;
        }

        .auto-style6 {
            height: 109px;
            width: 25px;
        }

        .auto-style7 {
            height: 96px;
        }
        .auto-style8 {
            width: 123px;
            height: 114px;
            margin-left: 0px;
        }
        .auto-style9 {
            width: 56.6em;
            height: 290px;
            margin-left: 90px;
        }
        .auto-style10 {
            width: 884px;
        }
        .auto-style11 {
            height: 209px;
            width: 882px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ban" runat="server">
        <p>
            <br />
        </p>
        <p>
        </p>
        <div id="div1" runat="server" style="text-align: center">
            &nbsp;<h3>PAGINA DE UTILIZADOR</h3>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">
                        <div style="margin-right: auto; text-align:center" runat="server"  class="auto-style3">
                            <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4" Width="16px">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" CssClass="circular--square" Height="100px" ImageUrl='<%# Eval("Foto") %>' Border-radius="50%" Width="100px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            &nbsp;&nbsp;
                        </div>
                    </td>
                    <td class="auto-style4">
                        <div class="auto-style7" style="text-align: left">
                            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="nome" runat="server" Text="Label"></asp:Label></h3>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LoginView ID="LoginView2" runat="server">
                                <AnonymousTemplate>
                                    INICIA SESSAO NO WEBSITE&nbsp; PARA SEGUIR
                                </AnonymousTemplate>
                            </asp:LoginView>
                            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">Seguir</asp:LinkButton>
                            <asp:LinkButton ID="linkdeixardeseguir" runat="server" OnClick="linkdeixardeseguir_Click">Deixar de seguir</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="linkdefinicao" runat="server">Definições</asp:LinkButton>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Seguidores:&nbsp;
        <asp:Label ID="Seguidores" runat="server"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Segue:&nbsp;
        <asp:Label ID="segue" runat="server"></asp:Label>

                            <br />
                        </div>
                    </td>
                </tr>
            </table>
            <div class="jumbotron" style="width: 50%; margin: 0 auto;">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT [Foto] FROM [Utilizador] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="F" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            &nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Seus Posts</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Posts de quem segue</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Guardados</asp:LinkButton>

            <br />

            <br />

        </div>
        <div style="margin-left: auto; margin-right: auto; width: 50em" runat="server" id="DIVPOSTS">
            POSTS FEITOS
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnItemCommand="DataList1_ItemCommand">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <div>
                    <div style="max-width: 600px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); text-align: center">
                        <asp:ImageButton ID="ImageButton3" ImageAlign="Middle" Width="200px" Height="200px" runat="server" ImageUrl='<%# Eval("Foto") %>' CommandArgument='<%# Eval("ID") %>' CommandName="command1" />
                    </div>
                </div>
                <br />
                <asp:Label ID="Label3" Text='<%# Eval("Nome") %>' runat="server"></asp:Label>
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Foto, ID, Nome FROM Local WHERE (Utilizador = @Utilizador)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Utilizador" QueryStringField="F" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div style="margin-left: auto; margin-right: auto; width: 50em" runat="server" id="DIVFOLLOWERs" visible="false">
            PESSOAS COM FOLLOW     
            <br />

            <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="SqlDataSource2" RepeatColumns="4" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnItemCommand="DataList2_ItemCommand">
                <ItemTemplate>
                    <div style="max-width: 600px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageAlign="Middle" Width="200px" Height="200px" ImageUrl='<%# Eval("Foto") %>' CommandArgument='<%# Eval("Expr1") %>' CommandName="command1" />
                    </div>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Segue.ID, Segue.SeguidoPorUtilizador, Segue.SegueUtilizador, Local.Utilizador, Local.Nome, Local.Foto, Local.ID AS Expr1 FROM Segue INNER JOIN Local ON Segue.SeguidoPorUtilizador = Local.Utilizador WHERE (Segue.SegueUtilizador = @SegueUtilizador)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="SegueUtilizador" QueryStringField="F" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />

        </div>
        <div style="margin-left: auto; margin-right: auto;" runat="server" id="DIVGUARDADOS" visible="false" class="auto-style2">
            GUARDADOS

        <br />

            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatColumns="4" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnItemCommand="DataList3_ItemCommand">
                <ItemTemplate>
                    <div style="max-width: 600px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
                        <asp:ImageButton ID="ImageButton5" ImageAlign="Middle" Width="200px" Height="200px" runat="server" ImageUrl='<%# Eval("Foto") %>' CommandArgument='<%# Eval("ID") %>' CommandName="command1" />
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:InstaLocalConnectionString %>" SelectCommand="SELECT Visitar.local1, Visitar.user1, Local.Foto, Local.Nome, Local.ID FROM Visitar INNER JOIN Local ON Visitar.local1 = Local.ID WHERE (Visitar.user1 = @user1)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="user1" QueryStringField="F" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />

        </div>
        <div style="text-align: center">
            <h4 style="color: darkgrey">WEBSITE PARA PROJETO DE APTIDÃO PARA FINAL DE CURSO EM</h4>
            <h4 style="color: darkgrey">&nbsp;PROGRAMAÇÃO DA ESCOLA SECUNDARIA DE ODIVELAS!</h4>
            <p style="color: darkgrey">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton2_Click1">Acede Aqui!</asp:LinkButton>
            </p>
            <p style="color: darkgrey">
                <img alt="" class="auto-style8" src="Imagens/qr-code%20(1).png" />
            </p>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel1" runat="server" BackColor="White" HorizontalAlign="Center" Width="1009px" Height="297px">
            <div style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); background-color:white" class="auto-style9">
                <br />
                DEFINIÇÕES<br />
                <br />
                <asp:Button ID="Buttondetalhesdiv" runat="server" CssClass="example_e" Height="44px" Text="Detalhes" Width="177px" OnClick="Buttondetalhesdiv_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonPassdiv" runat="server" CssClass="example_e" Height="43px" Text="Mudar Password" OnClick="ButtonPassdiv_Click" />
                <br />
                <div>
                    <div class="auto-style10" id="Divpass" runat="server" visible="false">
                        <br />
                        Nova Password -
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
                        <br />
                        <br />
                        Confirmação -
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="textbox"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Button6" runat="server" CssClass="example_e" Height="46px" Text="Enviar" OnClick="Button6_Click" />
                        <br />
                    </div>
                    <div id="Divdetalhes" runat="server" class="auto-style11">
                        <br />
                        Nome -
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox"></asp:TextBox>
                        <br />
                        <br />
                        Email -
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
                        <br />
                        <br />
                        Foto -&nbsp;
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <br />
                        <br />
                        <asp:Button ID="Button7" runat="server" CssClass="example_e" Height="45px" Text="Enviar" OnClick="Button7_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="linkdefinicao"></ajaxToolkit:ModalPopupExtender>
        </div>
        <br />
        <div style="margin-left: auto; margin-right: auto; width: 50em" runat="server" id="DIVdef" visible="false">
            DEFINIÇÕES DE CONTA<br />
            <br />
            <asp:Button ID="ButtonDeleteConta" runat="server" CssClass="example_e" Height="44px" OnClick="ButtonDeleteConta_Click" Text="Eliminar Conta" />
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonMudarPass" runat="server" CssClass="example_e" Height="44px" OnClick="ButtonMudarPass_Click" Text="Mudar PassWord" />
            &nbsp;&nbsp;&nbsp;
        <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Confirmação" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server" BackColor="#FF0066" CssClass="textbox" ForeColor="White" Visible="False" oncopy="return false" onpaste="return false"
                oncut="return false"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" CssClass="example_e" Height="41px" OnClick="Button5_Click" Text="CONFIRMAR" Visible="False" />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server"></asp:Label>
        </div>

    </div>
    <div id="banf" runat="server">
        <p>
        </p>
        <p>
        </p>
        <div id="div3" runat="server" style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Label"> USER COM CONTA BLOQUEADA!</asp:Label>
        </div>

    </div>
</asp:Content>
