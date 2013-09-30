<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true"
    CodeFile="Inbox.aspx.cs" Inherits="Faculty_Inbox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="AdjustmentRequestViewDataSource" CssClass="mGrid" 
        GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:BoundField DataField="From" HeaderText="From" SortExpression="From" />
            <asp:BoundField DataField="Date" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="Date"
                SortExpression="Date" />
            <asp:BoundField DataField="Day" HeaderText="Day" ReadOnly="True" SortExpression="Day" />
            <asp:BoundField DataField="Section" HeaderText="Section" ReadOnly="True" SortExpression="Section" />
            <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        Text="Approve / Reject" Enabled='<%# Eval("Status").ToString().Equals("Pending") %>' />
                    <asp:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                        DynamicServicePath="" Enabled="True" PopupControlID="ModalPopupPanel" PopupDragHandleControlID="DragHandler"
                        TargetControlID="Button1">
                    </asp:ModalPopupExtender>
                    <br />
                    <asp:Panel ID="ModalPopupPanel" runat="server" CssClass="modalPopup" HorizontalAlign="Center">
                        <asp:Panel ID="DragHandler" runat="server" CssClass="modalDragHandler">
                        </asp:Panel>
                        <asp:HiddenField ID="AdjustmentIdHiddenField" runat="server" Value='<%# Bind("AdjusmentId") %>' />
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Rows="5" Text='<%# Bind("Comment") %>'
                            TextMode="MultiLine" CssClass="unwatermarked"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" runat="server"
                            Enabled="True" TargetControlID="TextBox1" WatermarkCssClass="watermarked" WatermarkText="Enter your comment here">
                        </asp:TextBoxWatermarkExtender>
                        <br />
                        <br />
                        <asp:Button ID="ApproveButton" runat="server" CommandName="Update" Height="26px"
                            Text="Approve" OnCommand="ApproveButton_Command" 
                            CommandArgument='<%# Eval("AdjusmentId") %>' />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="RejectButton" runat="server" CommandName="Update" OnCommand="RejectButton_Command"
                            Text="Reject" CommandArgument='<%# Eval("AdjusmentId") %>' />
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <asp:SqlDataSource ID="AdjustmentRequestViewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
        SelectCommand="SELECT AdjusmentId, [From], Date, dbo.DayOfWeek(Day) AS Day, CONVERT (VARCHAR, Year) + '-' + CONVERT (VARCHAR, Department_Id) + '-' + CONVERT (VARCHAR, Section_Name) AS Section, CONVERT (VARCHAR(5), Start_Time, 108) + ' - ' + CONVERT (VARCHAR(5), End_Time, 108) AS Time, Comment, [Status] FROM Adjustment_Request_View WHERE ([To] = @To)"
        
        UpdateCommand="UPDATE AdjustmentRequest SET Status = @Status, Comment = @Comment WHERE (AdjusmentId = @AdjustmentId) AND (FacultyId = @FacultyId)" 
        onupdated="AdjustmentRequestViewDataSource_Updated">
        <SelectParameters>
            <asp:SessionParameter Name="To" SessionField="UserName" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Comment" />
            <asp:SessionParameter Name="AdjustmentId" SessionField="AdjustmentId" />
            <asp:SessionParameter Name="FacultyId" SessionField="UserName" />
            <asp:SessionParameter Name="Status" SessionField="Status" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
