<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true" CodeFile="LeaveRequests2.aspx.cs" Inherits="Faculty_LeaveRequests2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataKeyNames="Id" DataSourceID="LeaveRequestsDataSource" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:BoundField DataField="Leave_Type" HeaderText="Leave_Type" 
                SortExpression="Leave_Type" />
            <asp:BoundField DataField="Applier_Id" HeaderText="Applier_Id" 
                SortExpression="Applier_Id" />
            <asp:BoundField DataField="From_Date" 
                DataFormatString="{0:dd/MMM/yyyy  (dddd)}" HeaderText="From_Date" 
                SortExpression="From_Date" />
            <asp:BoundField DataField="From_Session" HeaderText="From_Session" 
                SortExpression="From_Session" />
            <asp:BoundField DataField="To_Date" DataFormatString="{0:dd/MMM/yyyy  (dddd)}" 
                HeaderText="To_Date" SortExpression="To_Date" />
            <asp:BoundField DataField="To_Session" HeaderText="To_Session" 
                SortExpression="To_Session" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" 
                SortExpression="Phone_Number" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
        </Columns>
        <FooterStyle CssClass="mGridFooterRow" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <asp:SqlDataSource ID="LeaveRequestsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        
        SelectCommand="SELECT Leave.Id, Leave.Leave_Type_Id, Leave_Type.Name AS Leave_Type, Leave.Applier_Id, Leave.From_Date, Leave.From_Session, Leave.To_Date, Leave.To_Session, Leave.Reason, Leave.Phone_Number, Leave.Status, Leave.Comment FROM Leave INNER JOIN Leave_Type ON Leave.Leave_Type_Id = Leave_Type.Id WHERE (Leave.Status &lt;&gt; @Status)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Dummy Status" Name="Status" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

