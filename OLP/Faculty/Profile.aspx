<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Faculty_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="User_Name" 
        DataSourceID="FacultyDataSource">
        <EditItemTemplate>
            <table class="style1">
                <tr>
                    <td nowrap="nowrap">
                        User Name</td>
                    <td>
                        <asp:Label ID="User_NameLabel1" runat="server" 
                            Text='<%# Eval("User_Name") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password</td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" 
                            Text='<%# Bind("Password") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="PasswordTextBox" CssClass="errorNotification2" 
                            ErrorMessage="*" SetFocusOnError="True" ToolTip="Field Required" 
                            ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        Confirm Password</td>
                    <td nowrap="nowrap">
                        <asp:TextBox ID="PasswordTextBox0" runat="server" 
                            Text='<%# Bind("Password") %>' />
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="PasswordTextBox" ControlToValidate="PasswordTextBox0" 
                            CssClass="errorNotification2" ErrorMessage="Passwords must match" 
                            SetFocusOnError="True" ValidationGroup="UpdateProfile"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name</td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="NameTextBox" CssClass="errorNotification2" ErrorMessage="*" 
                            SetFocusOnError="True" ToolTip="Field Required" ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        Security Question</td>
                    <td>
                        <asp:TextBox ID="Security_QuestionTextBox" runat="server" 
                            Text='<%# Bind("Security_Question") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="Security_QuestionTextBox" CssClass="errorNotification2" 
                            ErrorMessage="*" SetFocusOnError="True" ToolTip="Field Required" 
                            ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Answer</td>
                    <td>
                        <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="AnswerTextBox" CssClass="errorNotification2" 
                            ErrorMessage="*" SetFocusOnError="True" ToolTip="Field Required" 
                            ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email ID</td>
                    <td nowrap="nowrap">
                        <asp:TextBox ID="Email_IdTextBox" runat="server" 
                            Text='<%# Bind("Email_Id") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="Email_IdTextBox" CssClass="errorNotification2" 
                            ErrorMessage="*" SetFocusOnError="True" ToolTip="Field Required" 
                            ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                            runat="server" ControlToValidate="Email_IdTextBox" 
                            CssClass="errorNotification2" Display="Dynamic" ErrorMessage="Invalid Email ID" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone Number</td>
                    <td nowrap="nowrap">
                        <asp:TextBox ID="Phone_NumberTextBox" runat="server" 
                            Text='<%# Bind("Phone_Number") %>' />
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="Phone_NumberTextBox" CssClass="errorNotification2" 
                            ErrorMessage="*" SetFocusOnError="True" ToolTip="Field Required" 
                            ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                            runat="server" ControlToValidate="Phone_NumberTextBox" 
                            ErrorMessage="Invalid Phone Number" SetFocusOnError="True" 
                            ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
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
                        <asp:Button ID="Button2" runat="server" CommandName="Update" Text="Update" 
                            ValidationGroup="UpdateProfile" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
            &nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
            Password:
            <asp:TextBox ID="PasswordTextBox" runat="server" 
                Text='<%# Bind("Password") %>' />
            <br />
            Security_Question:
            <asp:TextBox ID="Security_QuestionTextBox" runat="server" 
                Text='<%# Bind("Security_Question") %>' />
            <br />
            Answer:
            <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Phone_Number:
            <asp:TextBox ID="Phone_NumberTextBox" runat="server" 
                Text='<%# Bind("Phone_Number") %>' />
            <br />
            Email_Id:
            <asp:TextBox ID="Email_IdTextBox" runat="server" 
                Text='<%# Bind("Email_Id") %>' />
            <br />
            User_Name:
            <asp:TextBox ID="User_NameTextBox" runat="server" 
                Text='<%# Bind("User_Name") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        User Name</td>
                    <td>
                        <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("User_Name") %>' />
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
                    <td nowrap="nowrap">
                        Security Question</td>
                    <td>
                        <asp:Label ID="Security_QuestionLabel" runat="server" 
                            Text='<%# Bind("Security_Question") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Answer</td>
                    <td>
                        <asp:Label ID="AnswerLabel" runat="server" Text='<%# Bind("Answer") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Email ID</td>
                    <td>
                        <asp:Label ID="Email_IdLabel" runat="server" Text='<%# Bind("Email_Id") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone Number</td>
                    <td>
                        <asp:Label ID="Phone_NumberLabel" runat="server" 
                            Text='<%# Bind("Phone_Number") %>' />
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
            &nbsp;&nbsp;
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="FacultyDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        DeleteCommand="DELETE FROM [Faculty] WHERE [User_Name] = @User_Name" 
        InsertCommand="INSERT INTO [Faculty] ([Password], [Security_Question], [Answer], [Name], [Phone_Number], [Email_Id], [User_Name]) VALUES (@Password, @Security_Question, @Answer, @Name, @Phone_Number, @Email_Id, @User_Name)" 
        SelectCommand="SELECT [Password], [Security_Question], [Answer], [Name], [Phone_Number], [Email_Id], [User_Name] FROM [Faculty] WHERE ([User_Name] = @User_Name)" 
        UpdateCommand="UPDATE [Faculty] SET [Password] = @Password, [Security_Question] = @Security_Question, [Answer] = @Answer, [Name] = @Name, [Phone_Number] = @Phone_Number, [Email_Id] = @Email_Id WHERE [User_Name] = @User_Name">
        <DeleteParameters>
            <asp:Parameter Name="User_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Security_Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Email_Id" Type="String" />
            <asp:Parameter Name="User_Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="User_Name" SessionField="UserName" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Security_Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Email_Id" Type="String" />
            <asp:Parameter Name="User_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>