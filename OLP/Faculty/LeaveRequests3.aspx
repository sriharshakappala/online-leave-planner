<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true" CodeFile="LeaveRequests3.aspx.cs" Inherits="Faculty_LeaveRequests3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="mGrid" DataSourceID="LeaveRequestsDataSource" GridLines="None" 
        Width="100%">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:BoundField DataField="Leave_Type" HeaderText="Leave_Type" ReadOnly="True" 
                SortExpression="Leave_Type" />
            <asp:BoundField DataField="Applier_Id" HeaderText="Applier_Id" ReadOnly="True" 
                SortExpression="Applier_Id" />
            <asp:BoundField DataField="From_Date" DataFormatString="{0:dd/MMM/yyyy (ddd)}" 
                HeaderText="From_Date" ReadOnly="True" SortExpression="From_Date" />
            <asp:BoundField DataField="From_Session" HeaderText="From_Session" 
                ReadOnly="True" SortExpression="From_Session" />
            <asp:BoundField DataField="To_Date" DataFormatString="{0:dd/MMM/yyyy (ddd)}" 
                HeaderText="To_Date" ReadOnly="True" SortExpression="To_Date" />
            <asp:BoundField DataField="To_Session" HeaderText="To_Session" ReadOnly="True" 
                SortExpression="To_Session" />
            <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" 
                ReadOnly="True" SortExpression="Phone_Number" />
            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" 
                SortExpression="Status" />
        </Columns>
        <FooterStyle CssClass="mGridFooterRow" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <asp:SqlDataSource ID="LeaveRequestsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" SelectCommand="(SELECT Completed_Leaves_View.Id,Completed_Leaves_View.Leave_Type_Id,Leave_Type.Name AS Leave_Type,Completed_Leaves_View.Applier_Id, Completed_Leaves_View.From_Date, Completed_Leaves_View.From_Session,Completed_Leaves_View.To_Date, Completed_Leaves_View.To_Session,Completed_Leaves_View.Reason,Completed_Leaves_View.Phone_Number, Completed_Leaves_View.Status, Completed_Leaves_View.Comment
 FROM Completed_Leaves_View INNER JOIN Faculty ON Completed_Leaves_View.Applier_Id = Faculty.User_Name INNER JOIN [Current_HODs_View] ON Faculty.Department_Id = [Current_HODs_View].Department_Id INNER JOIN Leave_Type ON Completed_Leaves_View.Leave_Type_Id = Leave_Type.Id WHERE ([Current_HODs_View].User_Name = @UserName))
union
((SELECT        Leave.Id,Leave.Leave_Type_Id,Leave_Type.Name AS Leave_Type,Leave.Applier_Id,Leave.From_Date,Leave.From_Session,Leave.To_Date,Leave.To_Session,Leave.Reason, Leave.Phone_Number, Leave.Status, Leave.Comment
FROM            Leave INNER JOIN
                         Leave_Type ON Leave.Leave_Type_Id = Leave_Type.Id
WHERE        (Leave.Status &lt;&gt; @Status))
)">
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="UserName" />
            <asp:Parameter DefaultValue="DummyStatus" Name="Status" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

