<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="L1Admin_Departments" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="ErrorLabel" runat="server" CssClass="errorNotification3"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="DepartmentDataSource" 
        EmptyDataText="There are no data records to display." 
        GridLines="None" ShowFooter="True" HorizontalAlign="Center" 
        ShowHeaderWhenEmpty="True" CssClass="mGrid" Width="100%" 
        onrowdeleted="GridView1_RowDeleted">
        <AlternatingRowStyle CssClass="mGridAlternateRow" />
        <Columns>
            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                <EditItemTemplate>
                    &nbsp;<asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>' Columns="10" 
                        Height="22px" Width="129px" AutoPostBack="True" 
                        ontextchanged="Id_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="Id" Display="Dynamic" ErrorMessage="*" 
                        ValidationGroup="UpdateDepartment" CssClass="errorNotification2"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="errorNotification2"></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Id" runat="server" AutoPostBack="True" 
                        ontextchanged="Id_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Id" CssClass="errorNotification" ErrorMessage="*" 
                        ToolTip="Id required" ValidationGroup="AddDepartment" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="errorNotification"></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="Password" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Password" CssClass="errorNotification" ErrorMessage="*" 
                        ToolTip="Password Required" ValidationGroup="UpdateDepartment" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Password" CssClass="errorNotification" ErrorMessage="*" 
                        ValidationGroup="AddDepartment" Display="Dynamic"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Name" CssClass="errorNotification" ErrorMessage="*" 
                        ValidationGroup="UpdateDepartment" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="Name" CssClass="errorNotification" ErrorMessage="*" 
                        ToolTip="Name required" ValidationGroup="AddDepartment" Display="Dynamic"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="CommandButton" runat="server" 
                        CommandName="Update" Text="Update" 
                        CommandArgument='<%# Eval("Id") %>' oncommand="Update_Command" 
                        ValidationGroup="UpdateDepartment" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="CommandButton" runat="server" CommandName="Insert" 
                        oncommand="Insert_Command" Text="Add" ValidationGroup="AddDepartment" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" 
                        onclientclick="return confirm('Are you sure?\nThis action can't be rolled back.')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="Id" 
                DataSourceID="DepartmentDataSource" DefaultMode="Insert" 
                ForeColor="#333333" BackColor="Black">
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#313131" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PasswordTextBox" runat="server" 
                                    Text='<%# Bind("Password") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" CommandName="Insert" Text="Add" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <InsertRowStyle BackColor="Black" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:FormView>
        </EmptyDataTemplate>
        <FooterStyle CssClass="mGridFooter" />
        <HeaderStyle CssClass="mGridHeader" />
        <RowStyle CssClass="mGridRow" />
    </asp:GridView>
    <br />
    <br />
    <asp:RoundedCornersExtender ID="GridView1_RoundedCornersExtender" 
        runat="server" Enabled="True" TargetControlID="GridView1">
    </asp:RoundedCornersExtender>
    <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        DeleteCommand="DELETE FROM [Department] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Department] ([Id], [Password], [Name]) VALUES (@Id, @Password, @Name)" 
        ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Id], [Password], [Name] FROM [Department]" 
        UpdateCommand="UPDATE [Department] SET [Id] = @Id, [Password] = @Password, [Name] = @Name WHERE [Id] = @OldId">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Id" Type="String" />
            <asp:Parameter Name="OldId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

