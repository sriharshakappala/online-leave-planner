<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/LeaveMaster.master" AutoEventWireup="true" CodeFile="LeaveHistory.aspx.cs" Inherits="Faculty_LeaveHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="LeaveDataSource" 
        EmptyDataText="There are no data records to display." onrowdatabound="GridView1_RowDataBound" 
        ShowHeaderWhenEmpty="True" Width="100%" CssClass="mGrid" GridLines="None" >
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:BoundField DataField="Leave_Type_Id" HeaderText="Leave_Type_Id" 
                SortExpression="Leave_Type_Id" />
            <asp:BoundField DataField="From_Date" DataFormatString="{0:dd/MMM/yyyy}" 
                HeaderText="From_Date" SortExpression="From_Date" />
            <asp:BoundField DataField="From_Session" HeaderText="From_Session" 
                SortExpression="From_Session" />
            <asp:BoundField DataField="To_Date" DataFormatString="{0:dd/MMM/yyyy}" 
                HeaderText="To_Date" SortExpression="To_Date" />
            <asp:BoundField DataField="To_Session" HeaderText="To_Session" 
                SortExpression="To_Session" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                        CommandName="Delete" 
                        onclientclick="return confirm('Are you sure?\nThis action can not be rolled back');" 
                        Text="Cancel" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <asp:SqlDataSource ID="LeaveDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        DeleteCommand="DELETE FROM Adjustment WHERE [Leave_Id] = @Id
DELETE FROM [Leave] WHERE [Id] =@Id" 
        InsertCommand="INSERT INTO [Leave] ([Leave_Type_Id], [Applier_Id], [Approver_Id], [From_Date], [From_Session], [To_Date], [To_Session], [Reason], [Phone_Number], [Status], [Comment]) VALUES (@Leave_Type_Id, @Applier_Id, @Approver_Id, @From_Date, @From_Session, @To_Date, @To_Session, @Reason, @Phone_Number, @Status, @Comment)" 
        ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Id], [Leave_Type_Id], [Applier_Id], [Approver_Id], [From_Date], [From_Session], [To_Date], [To_Session], [Reason], [Phone_Number], [Status], [Comment] FROM [Leave]
WHERE [Applier_Id] = @UserName" 
        
    
        UpdateCommand="UPDATE [Leave] SET [Leave_Type_Id] = @Leave_Type_Id, [Applier_Id] = @Applier_Id, [Approver_Id] = @Approver_Id, [From_Date] = @From_Date, [From_Session] = @From_Session, [To_Date] = @To_Date, [To_Session] = @To_Session, [Reason] = @Reason, [Phone_Number] = @Phone_Number, [Status] = @Status, [Comment] = @Comment WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Leave_Type_Id" Type="Byte" />
            <asp:Parameter Name="Applier_Id" Type="String" />
            <asp:Parameter Name="Approver_Id" Type="String" />
            <asp:Parameter Name="From_Date" Type="DateTime" />
            <asp:Parameter Name="From_Session" Type="Decimal" />
            <asp:Parameter Name="To_Date" Type="DateTime" />
            <asp:Parameter Name="To_Session" Type="Decimal" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserName" SessionField="UserName" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Leave_Type_Id" Type="Byte" />
            <asp:Parameter Name="Applier_Id" Type="String" />
            <asp:Parameter Name="Approver_Id" Type="String" />
            <asp:Parameter Name="From_Date" Type="DateTime" />
            <asp:Parameter Name="From_Session" Type="Decimal" />
            <asp:Parameter Name="To_Date" Type="DateTime" />
            <asp:Parameter Name="To_Session" Type="Decimal" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

