<%@ Page Title="" Language="C#" MasterPageFile="~/L2Admin/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="L2Admin_Profile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" 
            DataSourceID="DepartmentDataSource" HorizontalAlign="Center">
            <EditItemTemplate>
                <table class="style1" cellpadding="5" cellspacing="5">
                    <tr>
                        <td>
                            Username</td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password</td>
                        <td nowrap="nowrap">
                            <asp:TextBox ID="PasswordTextBox" runat="server" 
                                Text='<%# Bind("Password") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="PasswordTextBox" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap="nowrap">
                            Confirm Password</td>
                        <td nowrap="nowrap">
                            <asp:TextBox ID="PasswordTextBox0" runat="server" 
                                Text='<%# Bind("Password") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="PasswordTextBox0" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="PasswordTextBox" ControlToValidate="PasswordTextBox0" 
                                CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="Passwords must match" ValidationGroup="UpdateProfile"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="NameTextBox" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" CommandName="Update" 
                                 Text="Update" ValidationGroup="UpdateProfile" />
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
                &nbsp;
            </EditItemTemplate>
            <InsertItemTemplate>
                Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                Password:
                <asp:TextBox ID="PasswordTextBox" runat="server" 
                    Text='<%# Bind("Password") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table cellpadding="5" cellspacing="5">
                    <tr>
                        <td>
                            ID</td>
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password</td>
                        <td>
                            <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
            DeleteCommand="DELETE FROM [Department] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Department] ([Id], [Password], [Name]) VALUES (@Id, @Password, @Name)" 
            SelectCommand="SELECT * FROM [Department] WHERE ([Id] = @Id)" 
            UpdateCommand="UPDATE [Department] SET [Password] = @Password, [Name] = @Name WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Id" SessionField="DepartmentId" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </asp:Content>

