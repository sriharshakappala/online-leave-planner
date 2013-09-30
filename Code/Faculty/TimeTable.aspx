<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true"
    CodeFile="TimeTable.aspx.cs" Inherits="Faculty_TimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <table border="1">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                    SelectCommand="SELECT DISTINCT dbo.ExtractTime([Start_Time]) as Start_Time, [End_Time] FROM [Working_Hours_View] WHERE ([Faculty_Id] = @Faculty_Id) ORDER BY [Start_Time]">
                    <SelectParameters>
                        <asp:SessionParameter Name="Faculty_Id" SessionField="UserName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ListView ID="ListView" runat="server" DataSourceID="SqlDataSource">
                    <ItemTemplate>
                        <td runat="server" width="150px">
                            <asp:Label ID="Start_TimeLabel" runat="server" Text='<%# Eval("Start_Time","{0:hh:mm}") %>' />
                            -
                            <asp:Label ID="End_TimeLabel" runat="server" Text='<%# Eval("End_Time","{0:hh:mm}") %>' />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" border="1" >
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server" width="150px">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Mon
            </td>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">
                          <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Tue
            </td>
            <td>
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">    
                            <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Wed
            </td>
            <td>
                <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">
                            <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Thu
            </td>
            <td>
                <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">
                            <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Friday
            </td>
            <td>
                <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">
                            
                            <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table3" runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td>
                Sat
            </td>
            <td>
                <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource" 
                    onitemdatabound="ListView_ItemDataBound">
                    <ItemTemplate>
                        <td id="Td1" runat="server" width="150px">
                            
                            <asp:Label ID="Class" runat="server" Text=""></asp:Label>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table3" runat="server" border="1" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
