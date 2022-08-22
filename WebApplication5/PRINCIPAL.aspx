<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PRINCIPAL.aspx.cs" Inherits="WebApplication5.PRINCIPAL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 50em;
            height: 513px;
            margin-left: 290px;
        }

        .auto-style5 {
            width: 925px;
        }

        .auto-style6 {
            width: 1039px;
        }

        .auto-style7 {
            width: 118px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; margin-right: auto;" class="auto-style4">
        <br />
        <br />
        <br />
        <div style="margin-left: auto; margin-right: auto; width: 50em" runat="server" id="DIVPOSTS">
            <h1 class="auto-style6">O que vai encontrar!</h1>
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style7">
                        <asp:LinkButton ID="linkPrimeira" runat="server" OnClick="linkPrimeira_Click">linkPrimeira</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="linkAnterior" runat="server" ImageUrl="~/25-254372_80-hand-drawn-arrows-ps-brush-set-arrow.png" OnClick="linkAnterior_Click">linkAnterior</asp:LinkButton>
                        <br />
                        <br />
                        <asp:ImageButton ID="ImageButton2"  runat="server" OnClick="ImageButton2_Click" />
                    </td>
                    <td class="auto-style5">
                        <br />
                        <br />
                        <asp:DataList ID="DataList1" runat="server" BackColor="Transparent" CellPadding="4" RepeatColumns="4" Width="659px" OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" ImageAlign="Middle" Width="200px" Height="200px" runat="server" ImageUrl='<%# Eval("Foto") %>' CommandArgument='<%# Eval("ID") %>' CommandName="command1" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td>
                        <asp:LinkButton ID="linkSeguinte" runat="server" OnClick="linkSeguinte_Click">linkSeguinte</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="linkUltima" runat="server" OnClick="linkUltima_Click">linkUltima</asp:LinkButton>
                        <br />
                        <br />
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/25-254372_80-hand-drawn-arrows-ps-brush-set-arrow.png" OnClick="ImageButton3_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
