<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true"
    CodeFile="LeaveRequests.aspx.cs" Inherits="Faculty_LeaveRequests" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
        DataSourceID="LeavesDataSource" GridLines="None" 
        OnRowDataBound="GridView1_RowDataBound" DataKeyNames="Id">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:BoundField DataField="Applier_Id" HeaderText="Applier_Id" SortExpression="Applier_Id" />
            <asp:BoundField DataField="Leave_Type" HeaderText="Leave_Type" SortExpression="Leave_Type" />
            <asp:BoundField DataField="From_Date" DataFormatString="{0:dd/MM/yyyy (ddd)}" HeaderText="From_Date"
                SortExpression="From_Date" />
            <asp:BoundField DataField="From_Session" HeaderText="From_Session" SortExpression="From_Session" />
            <asp:BoundField DataField="To_Date" DataFormatString="{0:dd/MM/yyyy (ddd)}" HeaderText="To_Date"
                SortExpression="To_Date" />
            <asp:BoundField DataField="To_Session" HeaderText="To_Session" SortExpression="To_Session" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="ApproveRejectButton" runat="server" Text="Approve / Reject" Enabled='<%# (Eval("Status").ToString().Equals(Session["StatusToCheck"])) || (Eval("Status").ToString().Equals(Session["Status2ToCheck"]))   %>'/>
                    <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="ApproveRejectButton" Drag="True" PopupDragHandleControlID="DragHandler" PopupControlID="ModalPopupPanel">
                    </asp:ModalPopupExtender>
                    <br />
                    <asp:Panel ID="ModalPopupPanel" runat="server" CssClass="modalPopup">
                        <asp:Panel ID="DragHandler" runat="server" CssClass="modalDragHandler">
                        </asp:Panel>
                        <br />
                        <asp:TextBox ID="CommentTextBox" runat="server" CssClass="unwatermarked" 
                            Rows="10" Text='<%# Eval("Comment") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="CommentTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="CommentTextBox" 
                            WatermarkCssClass="watermarked" WatermarkText="Enter your comment here......">
                        </asp:TextBoxWatermarkExtender>
                        <br />
                        <br />
                        <asp:Button ID="ApproveButton" runat="server" Text="Approve" 
                            CommandName="Update" oncommand="ApproveButton_Command" />
                        &nbsp;&nbsp;
                        <asp:Button ID="RejectButton" runat="server" Text="Reject" CommandName="Update" 
                            oncommand="RejectButton_Command" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    `<asp:SqlDataSource ID="LeavesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
        SelectCommand="SELECT Completed_Leaves_View.Id, Completed_Leaves_View.Leave_Type_Id, Leave_Type.Name AS Leave_Type, Completed_Leaves_View.Applier_Id, Completed_Leaves_View.From_Date, Completed_Leaves_View.From_Session, Completed_Leaves_View.To_Date, Completed_Leaves_View.To_Session, Completed_Leaves_View.Reason, Completed_Leaves_View.Phone_Number, Completed_Leaves_View.Status, Completed_Leaves_View.Comment, [Current_HODs_View].User_Name AS HOD_Id FROM Completed_Leaves_View INNER JOIN Faculty ON Completed_Leaves_View.Applier_Id = Faculty.User_Name INNER JOIN [Current_HODs_View] ON Faculty.Department_Id = [Current_HODs_View].Department_Id INNER JOIN Leave_Type ON Completed_Leaves_View.Leave_Type_Id = Leave_Type.Id WHERE ([Current_HODs_View].User_Name = @HOD_Id)"
        
        UpdateCommand="UPDATE [Leave] SET Status = @Status,Comment=@Comment WHERE Id = @Id">
        <SelectParameters>
            <asp:SessionParameter Name="HOD_Id" SessionField="UserName" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter DefaultValue="" Name="Status" SessionField="Status" />
            <asp:Parameter Name="Id" />
            <asp:Parameter Name="Comment" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
