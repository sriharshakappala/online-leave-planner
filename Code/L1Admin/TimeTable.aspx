<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site2.master" AutoEventWireup="true"
    CodeFile="TimeTable.aspx.cs" Inherits="L1Admin_TimeTable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"
                DataSourceID="TemplateDataSource" EmptyDataText="There are no Templates to display."
                ForeColor="Black" GridLines="Vertical" ShowFooter="True" ShowHeaderWhenEmpty="True"
                Style="text-align: center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Period_Duration" HeaderText="Period Duration" SortExpression="Period_Duration" />
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Button ID="NewTemplateButton" runat="server" OnClick="NewTemplateButton_Click"
                                Text="New Template" ToolTip=" " />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Button ID="EditButton" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="EditButton_Command"
                                Text="Edit" />
                            <asp:Button ID="Delete" runat="server" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Ther are no templates.<br />
                    <asp:Button ID="Button1" runat="server" OnClick="NewTemplateButton_Click" Text="New Template" />
                </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="TemplateDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                DeleteCommand="DELETE FROM [TimeTableTemplate] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TimeTableTemplate] ([Name], [Period_Duration]) VALUES (@Name, @Period_Duration)"
                ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Period_Duration] FROM [TimeTableTemplate]"
                
                UpdateCommand="UPDATE [TimeTableTemplate] SET [Name] = @Name, [Period_Duration] = @Period_Duration WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Period_Duration" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Period_Duration" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:HiddenField ID="ModelPopupTarget" runat="server" />
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground"
                Drag="True" PopupControlID="EditingPanel" PopupDragHandleControlID="DragHandler"
                TargetControlID="ModelPopupTarget">
            </asp:ModalPopupExtender>
            <asp:Panel ID="EditingPanel" runat="server" CssClass="modalPopup">
                <asp:Panel ID="DragHandler" runat="server" BackColor="#DDDDDD" CssClass="modalDragHandler"
                    HorizontalAlign="Center">
                    <asp:Label ID="EditingPanelHeaderLabel" runat="server" Text="Enter the data and click Next"></asp:Label>
                </asp:Panel>
                <br />
                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="1" DisplaySideBar="False"
                    OnNextButtonClick="Wizard1_NextButtonClick" Width="100%" Height="100%">
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
                    </FinishNavigationTemplate>
                    <WizardSteps>
                        <asp:WizardStep runat="server" Title="Step 1">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                                DataKeyNames="Id" DataSourceID="TemplateDataSource2" ForeColor="#333333" GridLines="None"
                                Height="100%" Width="100%">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                <EditRowStyle BackColor="#999999" />
                                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                <Fields>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Period_Duration" HeaderText="Period Duration" SortExpression="Period_Duration" />
                                </Fields>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="TemplateDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                DeleteCommand="DELETE FROM [TimeTableTemplate] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TimeTableTemplate] ([Name], [Period_Duration]) VALUES (@Name, @Period_Duration)
SELECT @Id = SCOPE_IDENTITY()" OnInserted="TemplateDataSource_Inserted" ProviderName="System.Data.SqlClient"
                                SelectCommand="SELECT * FROM [TimeTableTemplate] WHERE ([Id] = @Id)" 
                                UpdateCommand="UPDATE [TimeTableTemplate] SET [Name] = @Name, [Period_Duration] = @Period_Duration WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Period_Duration" Type="Int32" />
                                    <asp:Parameter Direction="Output" Name="Id" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Id" SessionField="Id" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Period_Duration" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 2">
                            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="PeriodDataSource"
                                InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemEditing="ListView1_ItemEditing"
                                OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated">
                                <AlternatingItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Start_TimeLabel" runat="server" Text='<%# Eval("Start_Time","{0:hh:mm}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="SessionLabel" runat="server" Text='<%# Eval("Session") %>' />
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Start_TimeTextBox" runat="server" Text='<%# Bind("Start_Time","{0:hh:mm}") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Session") %>'>
                                                <asp:ListItem>Morning</asp:ListItem>
                                                <asp:ListItem>Afternoon</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </EditItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>
                                                No data was returned.
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <InsertItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Start_TimeTextBox" runat="server" Text='<%# Bind("Start_Time","{0:hh:mm}") %>' />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Session") %>'>
                                                <asp:ListItem>Morning</asp:ListItem>
                                                <asp:ListItem>Afternoon</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Start_TimeLabel" runat="server" Text='<%# Eval("Start_Time","{0:hh:mm}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="SessionLabel" runat="server" Text='<%# Eval("Session") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                    <tr runat="server" style="">
                                                        <th runat="server">
                                                        </th>
                                                        <th runat="server">
                                                            Start_Time
                                                        </th>
                                                        <th runat="server">
                                                            Session
                                                        </th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" style="">
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                        </td>
                                        <td>
                                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Start_TimeLabel" runat="server" Text='<%# Eval("Start_Time") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="SessionLabel" runat="server" Text='<%# Eval("Session") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="PeriodDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                DeleteCommand="DELETE FROM [Period] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Period] ([Template_Id], [Start_Time],[Session]) VALUES (@Template_Id, @Start_Time, @Session)"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id],[Start_Time],[Session] FROM [Period] WHERE ([Template_Id] = @Template_Id)"
                                UpdateCommand="UPDATE [Period] SET [Start_Time] = @Start_Time, [Session] = @Session WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:SessionParameter Name="Template_Id" SessionField="Id" Type="Int32" />
                                    <asp:Parameter Name="Start_Time" Type="DateTime" />
                                    <asp:Parameter Name="Session" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Template_Id" SessionField="Id" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Template_Id" Type="Int32" />
                                    <asp:Parameter Name="Start_Time" Type="DateTime" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="Session" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>
