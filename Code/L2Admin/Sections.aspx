<%@ Page Title="" Language="C#" MasterPageFile="~/L2Admin/Site.master" AutoEventWireup="true"
    CodeFile="Sections.aspx.cs" Inherits="L2Admin_Sections" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Id" DataSourceID="SectionSqlDataSource" 
                EmptyDataText="There are no data records to display." ShowFooter="True" ShowHeaderWhenEmpty="True"
                AllowSorting="True" HorizontalAlign="Center" Style="text-align: right" 
                CssClass="mGrid" GridLines="None">
                <AlternatingRowStyle CssClass="mGridAlternateRow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Update" runat="server" Text="Update" OnCommand="Update_Command" CommandArgument='<%# Bind("Id") %>'
                                ValidationGroup="UpdateSection" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="Button3" runat="server" CommandName="Insert" Text="Add" OnCommand="Insert_Command"
                                ValidationGroup="AddSection" />
                        </FooterTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit" />
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Year" SortExpression="Year">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Year" runat="server" SelectedValue='<%# Bind("Year") %>'>
                                <asp:ListItem Value="1">I</asp:ListItem>
                                <asp:ListItem Value="2">II</asp:ListItem>
                                <asp:ListItem Value="3">III</asp:ListItem>
                                <asp:ListItem Value="4">IV</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="Year" runat="server">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Year"
                                CssClass="failureNotification" ErrorMessage="*" ValidationGroup="AddSection"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Name"
                                CssClass="errorNotification2" ErrorMessage="*" 
                                ValidationGroup="UpdateSection" SetFocusOnError="True" 
                                ToolTip="Section Name Required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                                CssClass="errorNotification" ErrorMessage="*" 
                                ToolTip="Section Name Required" ValidationGroup="AddSection"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="ViewTimeTable" runat="server" CommandArgument='<%# Eval("Id") %>'
                                CommandName="View" OnCommand="ViewTimeTable_Command">View/Create TimeTable</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td align="center">
                                <asp:DropDownList ID="Year" runat="server">
                                    <asp:ListItem Value="1">I</asp:ListItem>
                                    <asp:ListItem Value="2">II</asp:ListItem>
                                    <asp:ListItem Value="3">III</asp:ListItem>
                                    <asp:ListItem Value="4">IV</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Year"
                                    CssClass="failureNotification" ErrorMessage="*" ValidationGroup="AddSection"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Name"
                                    CssClass="failureNotification" ErrorMessage="*" ValidationGroup="Section"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" CommandName="Insert" OnCommand="Insert_Command"
                                    Text="Add" />
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <FooterStyle CssClass="mGridFooter" />
                <HeaderStyle CssClass="mGridHeader" />
                <RowStyle CssClass="mGridRow" />
            </asp:GridView>
            <asp:SqlDataSource ID="SectionSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                DeleteCommand="DELETE FROM [Section] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Section] ([Department_Id], [Name], [Year]) VALUES (@Department_Id, @Name, @Year)"
                ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Department_Id], [Name], [Year] FROM [Section] WHERE [Department_Id] = @DepartmentId"
                
                UpdateCommand="UPDATE [Section] SET [Department_Id] = @Department_Id, [Name] = @Name, [Year] = @Year WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Department_Id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Year" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Department_Id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Year" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:HiddenField ID="ModalPopupTarget" runat="server" />
            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupDragHandleControlID="DragHandler"
                TargetControlID="ModalPopupTarget" BackgroundCssClass="modalBackGround" PopupControlID="TimeTablePanel">
            </asp:ModalPopupExtender>
            <asp:Panel ID="TimeTablePanel" runat="server" Width="964px" 
                CssClass="modalPopup" ScrollBars="Auto">
                <asp:Panel ID="DragHandler" runat="server" CssClass="modalDragHandler">
                </asp:Panel>
                <asp:Wizard ID="Wizard1" runat="server" OnNextButtonClick="Wizard1_NextButtonClick"
                    ActiveStepIndex="1">
                    <WizardSteps>
                        <asp:WizardStep runat="server" Title="Step 1">
                            <asp:DropDownList ID="TemplateDropDownList" runat="server" AutoPostBack="True" DataSourceID="TemplateDataSource0"
                                DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="ModalPopupShow">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="TemplateDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [TimeTableTemplate]">
                            </asp:SqlDataSource>
                            <br />
                            <table border="2">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="PeriodDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT DATEPART(Hour, Start_Time) AS Hour, DATEPART(Minute, Start_Time) AS Minute FROM Period WHERE (Template_Id = @Template_Id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="TemplateDropDownList" Name="Template_Id" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="PeriodDataSource">
                                            <AlternatingItemTemplate>
                                                <td runat="server" class="timeTablePeriods">
                                                    <asp:Label ID="HourLabel" runat="server" Text='<%# Eval("Hour") %>' />
                                                    :
                                                    <asp:Label ID="MinuteLabel" runat="server" Text='<%# Eval("Minute") %>' />
                                                    <br />
                                                </td>
                                            </AlternatingItemTemplate>
                                            <EmptyDataTemplate>
                                                <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999;
                                                    border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr>
                                                        <td>
                                                            No data was returned.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <td runat="server" class="timeTablePeriods">
                                                    <asp:Label ID="HourLabel0" runat="server" Text='<%# Eval("Hour") %>' />
                                                    :
                                                    <asp:Label ID="MinuteLabel0" runat="server" Text='<%# Eval("Minute") %>' />
                                                    <br />
                                                </td>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table runat="server" border="1">
                                                    <tr id="itemPlaceholderContainer" runat="server">
                                                        <td id="itemPlaceholder" runat="server">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="timeTablePeriods">
                                                </div>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Monday
                                    </td>
                                    <td rowspan="6">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tuesday
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Wednesday
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Thursday
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Friday
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Saturday
                                    </td>
                                </tr>
                            </table>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" Title="Step 2">
                            <table border="1">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="PeriodDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                            ProviderName="System.Data.SqlClient" SelectCommand="SELECT DATEPART(Hour, Start_Time) AS Hour, DATEPART(Minute, Start_Time) AS Minute FROM Period WHERE (Template_Id = @Template_Id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="TemplateDropDownList" Name="Template_Id" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="PeriodDataSource0">
                                            <AlternatingItemTemplate>
                                                <td runat="server" class="timeTablePeriods">
                                                    <asp:Label ID="HourLabel" runat="server" Text='<%# Eval("Hour") %>' />:<asp:Label
                                                        ID="MinuteLabel" runat="server" Text='<%# Eval("Minute") %>' />
                                                    <br />
                                                </td>
                                            </AlternatingItemTemplate>
                                            <EmptyDataTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            No data was returned.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <td runat="server" class="timeTablePeriods">
                                                    <asp:Label ID="HourLabel" runat="server" Text='<%# Eval("Hour") %>' />
                                                    :
                                                    <asp:Label ID="MinuteLabel" runat="server" Text='<%# Eval("Minute") %>' />
                                                    <br />
                                                </td>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table runat="server" border="1">
                                                    <tr id="itemPlaceholderContainer" runat="server">
                                                        <td id="itemPlaceholder" runat="server">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="timeTableDays" border="1">
                                            <tr>
                                                <td>
                                                    Monday
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Tuesday
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Wednesday
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Thrusday
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Friday
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Saturday
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:ListView ID="TimeTableListView" runat="server" DataSourceID="WorkingHoursDataSource"
                                            GroupItemCount="3" OnDataBound="TimeTableListView_DataBound">                           
                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>
                                                            No data was returned.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <EmptyItemTemplate>
                                                <td runat="server" />
                                            </EmptyItemTemplate>
                                            <GroupTemplate>
                                                <tr id="itemPlaceholderContainer" runat="server">
                                                    <td id="itemPlaceholder" runat="server">
                                                    </td>
                                                </tr>
                                            </GroupTemplate>                               
                                            <ItemTemplate>
                                                <td runat="server" class="timeTableFaculty">
                                                    <asp:HiddenField ID="DayHiddenField" runat="server" Value='<%# Bind("Day") %>' />
                                                    <asp:HiddenField ID="Period_IdHiddenField" runat="server" Value='<%# Bind("Period_Id") %>' />
                                                    <asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" AutoGenerateRows="False"
                                                        DataKeyNames="Id" DataSourceID="WorkingHoursDataSource3" Height="50px" Width="125px"
                                                        OnPageIndexChanged="ModalPopupShow">
                                                        <EmptyDataTemplate>
                                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="New" Text="New" OnCommand="ModalPopupShow">New</asp:LinkButton>
                                                        </EmptyDataTemplate>
                                                        <Fields>
                                                            <asp:TemplateField HeaderText="Faculty_Id" ShowHeader="False" SortExpression="Faculty_Id">
                                                                <EditItemTemplate>
                                                                    <br />
                                                                    <asp:DropDownList ID="Faculty" runat="server" DataSourceID="FacultyDataSource" DataTextField="Name"
                                                                        DataValueField="User_Name" SelectedValue='<%# Bind("Faculty_Id") %>'>
                                                                    </asp:DropDownList>

                                                                    <asp:ListSearchExtender ID="Faculty_ListSearchExtender" runat="server" Enabled="True"
                                                                        QueryPattern="Contains" TargetControlID="Faculty">
                                                                    </asp:ListSearchExtender>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <br />
                                                                    <asp:DropDownList ID="Faculty" runat="server" DataSourceID="FacultyDataSource" DataTextField="Name"
                                                                        DataValueField="User_Name" SelectedValue='<%# Bind("Faculty_Id") %>'>
                                                                    </asp:DropDownList>
                                                                    <asp:ListSearchExtender ID="Faculty_ListSearchExtender" runat="server" Enabled="True"
                                                                        PromptPosition="Top" QueryPattern="Contains" TargetControlID="Faculty">
                                                                    </asp:ListSearchExtender>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Faculty_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                                        OnClick="ModalPopupShow" Text="Update"></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                        OnClick="ModalPopupShow" Text="Cancel"></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <InsertItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                                                        OnClick="ModalPopupShow" Text="Insert"></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                        OnClick="ModalPopupShow" Text="Cancel"></asp:LinkButton>
                                                                </InsertItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                        OnClick="ModalPopupShow" Text="Edit"></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New"
                                                                        OnClick="ModalPopupShow" Text="New"></asp:LinkButton>
                                                                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete"
                                                                        OnClick="ModalPopupShow" Text="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Fields>
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="WorkingHoursDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                                        DeleteCommand="DELETE FROM [Working_Hours] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Working_Hours] ([Faculty_Id], [Day], [Section_Id], [Period_Id]) VALUES (@Faculty_Id, @Day, @Section_Id, @Period_Id)"
                                                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Faculty_Id], [Id], [Day], [Section_Id], [Period_Id] FROM [Working_Hours] WHERE (([Period_Id] = @Period_Id) AND ([Day] = @Day) AND ([Section_Id] = @Section_Id))"
                                                        UpdateCommand="UPDATE [Working_Hours] SET [Faculty_Id] = @Faculty_Id, [Day] = @Day, [Section_Id] = @Section_Id, [Period_Id] = @Period_Id WHERE [Id] = @Id">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="Id" Type="Int32" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="Faculty_Id" Type="String" />
                                                            <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value"
                                                                Type="Byte" />
                                                            <asp:SessionParameter Name="Section_Id" SessionField="SectionId" Type="Int32" />
                                                            <asp:ControlParameter ControlID="Period_IdHiddenField" Name="Period_Id" PropertyName="Value"
                                                                Type="Int32" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="Period_IdHiddenField" Name="Period_Id" PropertyName="Value"
                                                                Type="Int32" />
                                                            <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value"
                                                                Type="Byte" />
                                                            <asp:SessionParameter Name="Section_Id" SessionField="SectionId" Type="Int32" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="Faculty_Id" Type="String" />
                                                            <asp:ControlParameter ControlID="DayHiddenField" Name="Day" PropertyName="Value"
                                                                Type="Byte" />
                                                            <asp:SessionParameter Name="Section_Id" SessionField="SectionId" Type="Int32" />
                                                            <asp:ControlParameter ControlID="Period_IdHiddenField" Name="Period_Id" PropertyName="Value"
                                                                Type="Int32" />
                                                            <asp:Parameter Name="Id" Type="Int32" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table runat="server">
                                                    <tr runat="server">
                                                        <td runat="server">
                                                            <table id="groupPlaceholderContainer" runat="server" border="1">
                                                                <tr id="groupPlaceholder" runat="server">
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
                                        </asp:ListView>
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="WorkingHoursDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [Day], [Period_Id] FROM [Working_Hours] WHERE ([Section_Id] = @Section_Id) ORDER BY [Day], [Period_Id]">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Section_Id" SessionField="SectionId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] ORDER BY [Name]">
                            </asp:SqlDataSource>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </asp:Panel>
            <br />
            <br />
</asp:Content>
