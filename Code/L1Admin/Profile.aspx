﻿<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site2.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="L1Admin_Profile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
    <p>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Admin_Name" 
            DataSourceID="CollegeDataSource" HorizontalAlign="Center">
            <EditItemTemplate>
                <table class="style1" cellpadding="5" cellspacing="5">
                    <tr>
                        <td>
                            Admin_Name:
                        </td>
                        <td>
                            <asp:Label ID="Admin_NameLabel1" runat="server" 
                                Text='<%# Eval("Admin_Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name</td>
                        <td>
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="*" 
                                SetFocusOnError="True" ValidationGroup="UpdateProfile" 
                                CssClass="errorNotification2" ToolTip="Name Mandatory"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password</td>
                        <td>
                            <asp:TextBox ID="PasswordTextBox" runat="server" 
                                Text='<%# Bind("Password") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
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
                                Text='<%# Eval("Password") %>' />
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="PasswordTextBox" ControlToValidate="PasswordTextBox0" 
                                CssClass="errorNotification2" ErrorMessage="Passwords must match" 
                                ValidationGroup="UpdateProfile"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap="nowrap">
                            Security Question</td>
                        <td>
                            <asp:TextBox ID="Security_QuestionTextBox" runat="server" 
                                Text='<%# Bind("Security_Question") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="Security_QuestionTextBox" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Answer</td>
                        <td>
                            <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="AnswerTextBox" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email ID</td>
                        <td nowrap="nowrap">
                            <asp:TextBox ID="Email_IdTextBox" runat="server" 
                                Text='<%# Bind("Email_Id") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="Email_IdTextBox" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ControlToValidate="Email_IdTextBox" 
                                CssClass="errorNotification2" Display="Dynamic" ErrorMessage="Invalid Email ID" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="UpdateProfile"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone Number</td>
                        <td nowrap="nowrap">
                            <asp:TextBox ID="Phone_NumberTextBox" runat="server" 
                                Text='<%# Bind("Phone_Number") %>' />
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="Phone_NumberTextBox" CssClass="errorNotification2" 
                                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" 
                                ValidationGroup="UpdateProfile"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                runat="server" ControlToValidate="Phone_NumberTextBox" 
                                CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="Invalid Phone Number" ValidationExpression="\d{10}" 
                                ValidationGroup="UpdateProfile"></asp:RegularExpressionValidator>
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
                <br />
                &nbsp;
            </EditItemTemplate>
            <InsertItemTemplate>
                Admin_Name:
                <asp:TextBox ID="Admin_NameTextBox" runat="server" 
                    Text='<%# Bind("Admin_Name") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Password:
                <asp:TextBox ID="PasswordTextBox" runat="server" 
                    Text='<%# Bind("Password") %>' />
                <br />
                Answer:
                <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
                <br />
                Security_Question:
                <asp:TextBox ID="Security_QuestionTextBox" runat="server" 
                    Text='<%# Bind("Security_Question") %>' />
                <br />
                Email_Id:
                <asp:TextBox ID="Email_IdTextBox" runat="server" 
                    Text='<%# Bind("Email_Id") %>' />
                <br />
                Phone_Number:
                <asp:TextBox ID="Phone_NumberTextBox" runat="server" 
                    Text='<%# Bind("Phone_Number") %>' />
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
                            Name</td>
                        <td>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password</td>
                        <td>
                            ***********</td>
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
                            &nbsp;<asp:Label ID="AnswerLabel" runat="server" Text='<%# Bind("Answer") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email Id</td>
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
                            <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="Edit" 
                                UseSubmitBehavior="False" />
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;&nbsp;
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="CollegeDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
            DeleteCommand="DELETE FROM [College] WHERE [Admin_Name] = @Admin_Name" 
            InsertCommand="INSERT INTO [College] ([Admin_Name], [Name], [Password], [Answer], [Security_Question], [Email_Id], [Phone_Number]) VALUES (@Admin_Name, @Name, @Password, @Answer, @Security_Question, @Email_Id, @Phone_Number)" 
            SelectCommand="SELECT [Admin_Name], [Name], [Password], [Answer], [Security_Question], [Email_Id], [Phone_Number] FROM [College] WHERE ([Admin_Name] = @Admin_Name)" 
            UpdateCommand="UPDATE [College] SET [Name] = @Name, [Password] = @Password, [Answer] = @Answer, [Security_Question] = @Security_Question, [Email_Id] = @Email_Id, [Phone_Number] = @Phone_Number WHERE [Admin_Name] = @Admin_Name">
            <DeleteParameters>
                <asp:Parameter Name="Admin_Name" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Admin_Name" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Answer" Type="String" />
                <asp:Parameter Name="Security_Question" Type="String" />
                <asp:Parameter Name="Email_Id" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Admin_Name" SessionField="AdminName" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Answer" Type="String" />
                <asp:Parameter Name="Security_Question" Type="String" />
                <asp:Parameter Name="Email_Id" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="String" />
                <asp:Parameter Name="Admin_Name" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    </asp:Content>

