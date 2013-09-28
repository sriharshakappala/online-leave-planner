<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/LeaveMaster.master" AutoEventWireup="true" CodeFile="LeaveHome.aspx.cs" Inherits="Faculty_LeaveHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <table align="center">
        <tr>
            <td>
    Select Month</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    ontextchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Jan</asp:ListItem>
                    <asp:ListItem Value="2">Feb</asp:ListItem>
                    <asp:ListItem Value="3">Mar</asp:ListItem>
                    <asp:ListItem Value="4">Apr</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">Jun</asp:ListItem>
                    <asp:ListItem Value="7">Jul</asp:ListItem>
                    <asp:ListItem Value="8">Aug</asp:ListItem>
                    <asp:ListItem Value="9">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" GridLines="None" 
        HorizontalAlign="Center">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <br />
    <br />
</asp:Content>

