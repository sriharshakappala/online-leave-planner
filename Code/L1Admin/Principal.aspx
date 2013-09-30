
<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site.master" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="L1Admin_Principal" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    &nbsp;<asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="Faculty_Id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." 
        GridLines="None" HorizontalAlign="Center" ShowFooter="True" 
        ShowHeaderWhenEmpty="True" CssClass="mGrid">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:TemplateField HeaderText="Faculty" SortExpression="Faculty_Id">
                <EditItemTemplate>
                    <asp:DropDownList ID="Department" runat="server" AutoPostBack="True" 
                        DataSourceID="DepartmentDataSource" DataTextField="Id" DataValueField="Id" 
                        SelectedValue='<%# Bind("Id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                        SelectCommand="SELECT [Id], [Name] FROM [Department]"></asp:SqlDataSource>
                    <asp:DropDownList ID="FacultyId" runat="server" 
                        DataSourceID="FacultyDataSource" DataTextField="User_Name" 
                        DataValueField="User_Name" onprerender="FacultyId_Init">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="FacultyDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                        
                        SelectCommand="SELECT [User_Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Department" Name="Department_Id" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DepartmentId" runat="server" AutoPostBack="True" 
                        DataSourceID="DepartmentDataSource" DataTextField="Id" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                        SelectCommand="SELECT [Id] FROM [Department]"></asp:SqlDataSource>
                    <asp:DropDownList ID="FacultyId" runat="server" 
                        DataSourceID="FacultyDataSource" DataTextField="Name" 
                        DataValueField="User_Name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="FacultyDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                        SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DepartmentId" Name="Department_Id" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Faculty_Id") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Priority" SortExpression="Priority">
                <EditItemTemplate>
                    <asp:TextBox ID="Priority" runat="server" Text='<%# Bind("Priority") %>'></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="Priority_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="Priority">
                    </asp:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification" Display="Dynamic" 
                        ErrorMessage="*" ValidationGroup="UpdatePrincipal"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification" Display="Dynamic" 
                        ErrorMessage="Out of range" MaximumValue="5" MinimumValue="1" Type="Integer" 
                        ValidationGroup="UpdatePrincipal"></asp:RangeValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Priority" runat="server" ValidationGroup="AddPrincipal"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="Priority_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Numbers" TargetControlID="Priority">
                    </asp:FilteredTextBoxExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification" Display="Dynamic" 
                        ErrorMessage="*" ValidationGroup="AddPrincipal"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification" Display="Dynamic" 
                        ErrorMessage="Out of range" MaximumValue="5" MinimumValue="1" Type="Integer" 
                        ValidationGroup="AddPrincipal"></asp:RangeValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Priority") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Button ID="Update" runat="server" 
                        CommandName="AddPrincipal" 
                        oncommand="Update_Command" Text="Update" 
                        CommandArgument='<%# Eval("Faculty_Id") %>' 
                        ValidationGroup="UpdatePrincipal" />
                    <asp:Button ID="Cancel" runat="server" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Add" runat="server" CommandName="Add" oncommand="Add_Command" 
                        Text="Add" ValidationGroup="AddPrincipal" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="Edit" runat="server" CommandName="Edit" Text="Edit" 
                        CommandArgument='<%# Eval("Faculty_Id") %>' oncommand="Edit_Command" 
                        />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            <table >
                <tr>
                    <td>
                        <asp:DropDownList ID="DepartmentId" runat="server" AutoPostBack="True" 
                            DataSourceID="DepartmentDataSource" DataTextField="Id" DataValueField="Id">
                        </asp:DropDownList>
                        <asp:DropDownList ID="FacultyId" runat="server" 
                            DataSourceID="FacultyDataSource" DataTextField="Name" 
                            DataValueField="User_Name">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="FacultyDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                            SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DepartmentId" Name="Department_Id" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                            SelectCommand="SELECT [Id], [Name] FROM [Department]"></asp:SqlDataSource>
                    </td>
                    <td >
                        <asp:TextBox ID="Priority" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Add" runat="server" CommandName="Add" oncommand="Add_Command" 
                            Text="Add" />
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        DeleteCommand="DELETE FROM [Principal] WHERE [Faculty_Id] = @Faculty_Id" 
        InsertCommand="INSERT INTO [Principal] ([Faculty_Id], [Priority]) VALUES (@Faculty_Id, @Priority)" 
        ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" 
        SelectCommand="SELECT Principal.Faculty_Id, Principal.Priority, Department.Id FROM Department INNER JOIN Faculty ON Department.Id = Faculty.Department_Id RIGHT OUTER JOIN Principal ON Faculty.User_Name = Principal.Faculty_Id" 
        
        UpdateCommand="UPDATE [Principal] SET [Priority] = @Priority WHERE [Faculty_Id] = @Faculty_Id">
        <DeleteParameters>
            <asp:Parameter Name="Faculty_Id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Faculty_Id" Type="String" />
            <asp:Parameter Name="Priority" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Priority" Type="Byte" />
            <asp:Parameter Name="Faculty_Id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>

