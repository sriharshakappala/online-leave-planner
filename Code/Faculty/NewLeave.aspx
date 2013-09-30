<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/LeaveMaster.master" AutoEventWireup="true"
    CodeFile="NewLeave.aspx.cs" Inherits="Faculty_NewLeave" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="LeaveDataSource"
        DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" 
        oniteminserting="FormView1_ItemInserting">
        <EditItemTemplate>
            <table>
                <tr>
                    <td nowrap="nowrap">
                        Leave Type
                    </td>
                    <td>
                        <asp:DropDownList ID="LeaveType" runat="server" DataSourceID="LeaveTypeDataSource"
                            DataTextField="Name" DataValueField="Id" Enabled="False" SelectedValue='<%# Bind("Leave_Type_Id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="LeaveTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                            SelectCommand="SELECT [Name], [Id] FROM [Leave_Type]"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px">
                        From
                    </td>
                    <td style="height: 26px">
                        <asp:TextBox ID="From_Date" runat="server" Enabled="False" 
                            Text='<%# Bind("From_Date") %>' />
                    </td>
                    <td style="height: 26px">
                        Session
                    </td>
                    <td style="height: 26px">
                        <asp:DropDownList ID="FromSession" runat="server" Enabled="False" SelectedValue='<%# Bind("From_Session") %>'>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Afternoon">Afternoon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="3">
                        &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        To
                    </td>
                    <td>
                        <asp:TextBox ID="To_Date" runat="server" Enabled="False" Text='<%# Bind("To_Date") %>' />
                        <asp:CalendarExtender ID="To_Date_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="To_Date">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        Session
                    </td>
                    <td>
                        <asp:DropDownList ID="ToSession" runat="server" Enabled="False" SelectedValue='<%# Bind("To_Session") %>'>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Afternoon">Afternoon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                        </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Reason
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="Reason" runat="server" Rows="6" Text='<%# Bind("Reason") %>' TextMode="MultiLine" />
                        &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile No
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="Next" runat="server" CommandName="Update" Text="Update" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr>
                    <td nowrap="nowrap">
                        Leave Type
                    </td>
                    <td>
                        <asp:DropDownList ID="LeaveType" runat="server" DataSourceID="LeaveTypeDataSource"
                            DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Leave_Type_Id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="LeaveTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                            SelectCommand="SELECT [Name], [Id] FROM [Leave_Type]"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        From
                    </td>
                    <td>
                        <asp:TextBox ID="From_Date" runat="server" Text='<%# Bind("From_Date") %>' />
                        <asp:CalendarExtender ID="From_Date_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="From_Date" Format="dd-MM-yyyy">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        Session
                    </td>
                    <td>
                        <asp:DropDownList ID="FromSession" runat="server" SelectedValue='<%# Bind("From_Session") %>'>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Afternoon">Afternoon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="3">
                        <asp:CompareValidator ID="FromDateCompareValidator" runat="server" 
                            ControlToValidate="From_Date" CssClass="errorNotification2" Display="Dynamic" 
                            ErrorMessage="Must not less than today's Date" 
                            oninit="FromDateCompareValidator_Init" Operator="GreaterThanEqual" Type="Date" 
                            ValidationGroup="NewLeave"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        To
                    </td>
                    <td>
                        <asp:TextBox ID="To_Date" runat="server" Text='<%# Bind("To_Date") %>' />
                        <asp:CalendarExtender ID="To_Date_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="To_Date" Format="dd-MM-yyyy">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        Session
                    </td>
                    <td>
                        <asp:DropDownList ID="ToSession" runat="server" SelectedValue='<%# Bind("To_Session") %>'>
                            <asp:ListItem Value="Morning">Morning</asp:ListItem>
                            <asp:ListItem Value="Morning">Afternoon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;<asp:CompareValidator ID="ToDateCompareValidator" runat="server" 
                            ControlToCompare="From_Date" ControlToValidate="To_Date" 
                            CssClass="errorNotification2" Display="Dynamic" 
                            ErrorMessage="Must not less than From Date" Operator="GreaterThanEqual" 
                            Type="Date" ValidationGroup="NewLeave"></asp:CompareValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Reason
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="Reason" runat="server" Text='<%# Bind("Reason") %>' Rows="6" TextMode="MultiLine" />
                        &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        Mobile No
                    </td>
                    <td>
                        <asp:TextBox ID="MobileNumber" runat="server" 
                            Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="MobileNumber" CssClass="errorNotification2" 
                            ErrorMessage="Invalid Mobile Number" ValidationGroup="NewLeave" 
                            ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Next" ID="Next" 
                            ValidationGroup="NewLeave" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            Leave_Type_Id:
            <asp:Label ID="Leave_Type_IdLabel" runat="server" Text='<%# Bind("Leave_Type_Id") %>' />
            <br />
            Applier_Id:
            <asp:Label ID="Applier_IdLabel" runat="server" Text='<%# Bind("Applier_Id") %>' />
            <br />
            From_Date:
            <asp:Label ID="From_DateLabel" runat="server" Text='<%# Bind("From_Date") %>' />
            <br />
            From_Session:
            <asp:Label ID="From_SessionLabel" runat="server" Text='<%# Bind("From_Session") %>' />
            <br />
            To_Date:
            <asp:Label ID="To_DateLabel" runat="server" Text='<%# Bind("To_Date") %>' />
            <br />
            To_Session:
            <asp:Label ID="To_SessionLabel" runat="server" Text='<%# Bind("To_Session") %>' />
            <br />
            Reason:
            <asp:Label ID="ReasonLabel" runat="server" Text='<%# Bind("Reason") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="LeaveDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
        DeleteCommand="DELETE FROM [Leave] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Leave] ([Leave_Type_Id], [Applier_Id], [From_Date], [From_Session], [To_Date], [To_Session], [Reason],[Phone_Number],[Status]) VALUES (@Leave_Type_Id, @Applier_Id, @From_Date, @From_Session, @To_Date, @To_Session, @Reason,@Phone_Number,@Status)
SELECT @Id = SCOPE_IDENTITY()" ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>"
        SelectCommand="SELECT [Id], [Leave_Type_Id], [Applier_Id], [From_Date], [From_Session], [To_Date], [To_Session], [Reason],[Phone_Number] FROM [Leave] WHERE [Id] = @Id"
        UpdateCommand="UPDATE [Leave] SET [Reason] = @Reason WHERE [Id] = @Id" 
        OnInserted="LeaveDataSource_Inserted" oninserting="LeaveDataSource_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Leave_Type_Id" Type="Byte" />
            <asp:SessionParameter Name="Applier_Id" SessionField="UserName" Type="String" />
            <asp:Parameter Name="From_Date" Type="DateTime" />
            <asp:Parameter Name="From_Session" Type="String" />
            <asp:Parameter Name="To_Date" Type="DateTime" />
            <asp:Parameter Name="To_Session" Type="String" />
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Direction="Output" Name="Id" Type="Int32" />
            <asp:Parameter Name="Phone_Number" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="LeaveId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Reason" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="AdjustmentsPanel" runat="server">
        <br />
        <asp:Accordion ID="Accordion2" runat="server" ContentCssClass="accordionContent"
            FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            RequireOpenedPane="False" TransitionDuration="250" OnItemDataBound="Accordion2_ItemDataBound">
            <HeaderTemplate>
                <%# ((DaySession)Container.DataItem).Date.ToString("dd/MMM/yyyy")%>
            </HeaderTemplate>
            <ContentTemplate>
                <asp:HiddenField ID="DateHiddenField" runat="server" Value='<%# ((DaySession)Container.DataItem).Date %>' />
                <asp:HiddenField ID="SessionHiddenField" runat="server" Value='<%#((DaySession)Container.DataItem).Session %>' />
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table>
                            <thead>
                                <tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <th>
                            <%# DataBinder.Eval(Container.DataItem,"Year") %>
                            -
                            <%# DataBinder.Eval(Container.DataItem,"Department_Id") %>
                            -
                            <%# DataBinder.Eval(Container.DataItem,"Section_Name") %><br />
                            <%# DataBinder.Eval(Container.DataItem,"Start_Time","{0:hh:mm}") %>
                            -
                            <%# DataBinder.Eval(Container.DataItem,"End_Time","{0:hh:mm}") %>
                        </th>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tr> </thead>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="AdjustmentViewDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                    SelectCommand="SELECT [Department_Id], [Section_Name], [Start_Time], [End_Time], [Session], [Working_Hour_Id], [Year], [Id] FROM [Adjustment_View] WHERE (([Date] = @Date) AND ([Leave_Id] = @Leave_Id)) ORDER BY [Start_Time]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DateHiddenField" Name="Date" PropertyName="Value"
                            Type="DateTime" />
                        <asp:SessionParameter Name="Leave_Id" SessionField="LeaveId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="Repeater2" runat="server">
                    <HeaderTemplate>
                        <tbody>
                            <tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td>
                            <asp:HiddenField ID="AdjustmentIdHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Id") %>' />
                            <asp:HiddenField ID="DepartmentIdHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Department_Id") %>' />
                            <asp:HiddenField ID="SectionIdHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Section_Id") %>' />
                            <asp:HiddenField ID="StartTimeHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Start_Time","{0:hh:mm}") %>' />
                            <asp:HiddenField ID="EndTimeHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"End_Time","{0:hh:mm}") %>' />
                            <asp:HiddenField ID="DayHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Day") %>' />
                            <asp:ListView ID="ListView3" runat="server" DataKeyNames="AdjusmentId,FacultyId"
                                DataSourceID="AdjustmentRequestDataSource" ItemPlaceholderID="itemPlaceholder">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Label ID="FacultyIdLabel2" runat="server" Text='<%# Eval("FacultyId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="StatusLabel0" runat="server" Text='<%# Eval("Status") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CommentLabel0" runat="server" Text='<%# Eval("Comment") %>' />
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton0" runat="server" CommandName="Update" Text="Update" />
                                            <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </td>
                                        <td>
                                            <asp:Label ID="AdjusmentIdLabel2" runat="server" Text='<%# Eval("AdjusmentId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="FacultyIdLabel3" runat="server" Text='<%# Eval("FacultyId") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="StatusTextBox0" runat="server" Text='<%# Bind("Status") %>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CommentTextBox0" runat="server" Text='<%# Bind("Comment") %>' />
                                        </td>
                                    </tr>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table id="Table1" runat="server" style="">
                                        <tr>
                                            <td>
                                                No data was returned.
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Label ID="FacultyIdLabel4" runat="server" Text='<%# Eval("FacultyId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="StatusLabel1" runat="server" Text='<%# Eval("Status") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CommentLabel1" runat="server" Text='<%# Eval("Comment") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table id="Table2" runat="server">
                                        <tr id="Tr1" runat="server">
                                            <td id="Td1" runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                    <tr id="Tr2" runat="server" style="">
                                                        <th id="Th1" runat="server">
                                                            FacultyId
                                                        </th>
                                                        <th id="Th2" runat="server">
                                                            Status
                                                        </th>
                                                        <th id="Th3" runat="server">
                                                            Comment
                                                        </th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="AdjusmentIdLabel3" runat="server" Text='<%# Eval("AdjusmentId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="FacultyIdLabel5" runat="server" Text='<%# Eval("FacultyId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="StatusLabel2" runat="server" Text='<%# Eval("Status") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="CommentLabel2" runat="server" Text='<%# Eval("Comment") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="AdjustmentRequestDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                DeleteCommand="DELETE FROM [AdjustmentRequest] WHERE [AdjusmentId] = @AdjusmentId AND [FacultyId] = @FacultyId"
                                InsertCommand="INSERT INTO [AdjustmentRequest] ([AdjusmentId], [FacultyId], [Status], [Comment]) VALUES (@AdjusmentId, @FacultyId, @Status, @Comment)"
                                SelectCommand="SELECT * FROM [AdjustmentRequest] WHERE ([AdjusmentId] = @AdjusmentId)"
                                UpdateCommand="UPDATE [AdjustmentRequest] SET [Status] = @Status, [Comment] = @Comment WHERE [AdjusmentId] = @AdjusmentId AND [FacultyId] = @FacultyId">
                                <DeleteParameters>
                                    <asp:Parameter Name="AdjusmentId" Type="Int32" />
                                    <asp:Parameter Name="FacultyId" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="AdjustmentIdHiddenField" Name="AdjusmentId" PropertyName="Value"
                                        Type="Int32" />
                                    <asp:Parameter Name="FacultyId" Type="String" />
                                    <asp:Parameter DefaultValue="Pending" Name="Status" Type="String" />
                                    <asp:Parameter DefaultValue="" Name="Comment" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="AdjustmentIdHiddenField" Name="AdjusmentId" PropertyName="Value"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="Comment" Type="String" />
                                    <asp:Parameter Name="AdjusmentId" Type="Int32" />
                                    <asp:Parameter Name="FacultyId" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="ModalTarget" runat="server" Text="Send Request" />
                            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="ModalTarget"
                                BackgroundCssClass="modalBackground" Drag="True" PopupControlID="ModalPopupPanel"
                                PopupDragHandleControlID="DragHandler">
                            </asp:ModalPopupExtender>
                            <asp:Panel ID="ModalPopupPanel" runat="server" CssClass="modalPopup">
                                <asp:Panel ID="DragHandler" runat="server" CssClass="modalDragHandler">
                                </asp:Panel>
                                <table cellpadding="5">
                                    <tr>
                                        <td>
                                            Filter
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="FilterDropDownList" runat="server" OnDataBinding="FilterDropDownList_DataBinding"
                                                OnSelectedIndexChanged="FilterDropDownList_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Faculty
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="FacultyDropDownList" runat="server" DataSourceID="SectionFacultyDataSource"
                                                DataTextField="User_Name" DataValueField="User_Name">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="AllFacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                                SelectCommand="SELECT        User_Name
                                                               FROM            Faculty
                                                               WHERE        (User_Name NOT IN
                                                                                        (SELECT DISTINCT Faculty_Id
                                                                                        FROM   Working_Hours_View
                                                                                        WHERE  (dbo.ExtractTime(Start_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                                 dbo.ExtractTime(Start_Time) &lt;= dbo.ExtractTime(@EndTime)) OR (dbo.ExtractTime(End_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                                 dbo.ExtractTime(End_Time) &lt;= dbo.ExtractTime(@EndTime)) AND (Day = @Day)))">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StartTimeHiddenField" Name="StartTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="EndTimeHiddenField" Name="EndTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SectionFacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                                SelectCommand="SELECT        User_Name
                                                               FROM            Faculty
                                                               WHERE        (User_Name NOT IN
                                                                                        (SELECT DISTINCT Faculty_Id
                                                                                        FROM            Working_Hours_View
                                                                                        WHERE        (dbo.ExtractTime(Start_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                                     dbo.ExtractTime(Start_Time) &lt;= dbo.ExtractTime(@EndTime)) OR (dbo.ExtractTime(End_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                                     dbo.ExtractTime(End_Time) &lt;= dbo.ExtractTime(@EndTime)) AND (Day = @Day))) AND (User_Name IN
                                                                                                                                                             (SELECT        Faculty_Id
                                                                                                                                                              FROM            Working_Hours
                                                                                                                                                              WHERE        (Section_Id = @Section_Id)))">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StartTimeHiddenField" Name="StartTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="EndTimeHiddenField" Name="EndTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="SectionIdHiddenField" Name="Section_Id" PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="DepartmentFacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                                SelectCommand="SELECT        User_Name
                                                                FROM            Faculty
                                                                WHERE        (User_Name NOT IN
                                                                                        (SELECT DISTINCT Faculty_Id
                                                                                        FROM            Working_Hours_View
                                                                                        WHERE        (dbo.ExtractTime(Start_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                        dbo.ExtractTime(Start_Time) &lt;= dbo.ExtractTime(@EndTime)) OR (dbo.ExtractTime(End_Time) &gt;= dbo.ExtractTime(@StartTime) AND
                                                                                        dbo.ExtractTime(End_Time) &lt;= dbo.ExtractTime(@EndTime)) AND (Day = @Day))) AND (Department_Id = @DepartmentId)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="StartTimeHiddenField" Name="StartTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="EndTimeHiddenField" Name="EndTime" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="DepartmentIdHiddenField" Name="DepartmentId" PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Submit" OnCommand="SendRequestButton_Command"
                                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Id") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tr> </tbody> </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="AdjustmentViewDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                    SelectCommand="SELECT [Department_Id],[Section_Id],[Section_Name], [Start_Time], [End_Time], [Working_Hour_Id], [Year], [Id],[Day] FROM [Adjustment_View] WHERE (([Date] = @Date) AND ([Leave_Id] = @Leave_Id)) ORDER BY [Start_Time]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DateHiddenField" Name="Date" PropertyName="Value"
                            Type="DateTime" />
                        <asp:SessionParameter Name="Leave_Id" SessionField="LeaveId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:Accordion>
        <br />
        <br />
    </asp:Panel>
</asp:Content>
