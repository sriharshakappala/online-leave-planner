<%@ Page Title="" Language="C#" MasterPageFile="~/L2Admin/Site.master" AutoEventWireup="true"
    CodeFile="Faculty.aspx.cs" Inherits="L2Admin_Faculty" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display." GridLines="None" 
                HorizontalAlign="Center" ShowFooter="True" ShowHeaderWhenEmpty="True" 
                Width="100%">
                <AlternatingRowStyle CssClass="mGridAlternateRow" />
                <Columns>
                    <asp:TemplateField HeaderText="User Name" SortExpression="User_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="UserName" runat="server" AutoPostBack="True" 
                                OnTextChanged="UserName_TextChanged" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="UserName" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="ErrorLabel" runat="server" CssClass="errorNotification2"></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="UserName" runat="server" AutoPostBack="True" 
                                OnTextChanged="UserName_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="UserName" CssClass="errorNotification" ErrorMessage="*" 
                                SetFocusOnError="True" ToolTip="UserName Required" ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="ErrorLabel" runat="server" CssClass="errorNotification"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="TextBox1" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateFaculty"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Password" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ToolTip="User Name Required" 
                                ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="TextBox2" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateFaculty"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="Name" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ToolTip="Name Required" 
                                ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number" SortExpression="Phone_Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Phone_Number") %>' 
                                ValidationGroup="UpdateFaculty"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox3">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="TextBox3" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBox3" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="Invalid Phone Number" SetFocusOnError="True" 
                                ToolTip="Phone Number Required" ValidationExpression="\d{10}" 
                                ValidationGroup="UpdateFaculty"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="PhoneNumber" runat="server" ToolTip="Phone Number Required" 
                                ValidationGroup="AddFaculty"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="PhoneNumber_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" 
                                TargetControlID="PhoneNumber">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="PhoneNumber" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="PhoneNumber" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="Invalid Phone Number" SetFocusOnError="True" 
                                ToolTip="Phone Number Required" ValidationExpression="\d{10}" 
                                ValidationGroup="AddFaculty"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:Label>
                            <br />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email Id" SortExpression="Email_Id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email_Id") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="TextBox4" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="UpdateFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBox4" CssClass="errorNotification2" Display="Dynamic" 
                                ErrorMessage="Invalid Email ID" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="UpdateFaculty"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="EmailId" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="EmailId" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="AddFaculty"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="EmailId" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="Invalid Email ID" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="AddFaculty"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email_Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="CommandButton" runat="server" 
                                CommandArgument='<%# Eval("User_Name") %>' CommandName="Update" 
                                OnCommand="Update_Command" Text="Update" ValidationGroup="UpdateFaculty" 
                                Enabled="False" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="CommandButton" runat="server" CommandName="CommandButton" 
                                OnCommand="Insert_Command" Text="Add" 
                                ValidationGroup="AddFaculty" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:Button ID="Delete" runat="server" CausesValidation="False" 
                                CommandArgument='<%# Eval("User_Name") %>' CommandName="Delete" 
                                OnCommand="Delete_Command" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table cellpadding="6">
                        <tr>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="EmailId" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Add" runat="server" CommandName="Insert" 
                                    OnCommand="Insert_Command" Text="Add" />
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <FooterStyle CssClass="mGridFooter" />
                <HeaderStyle CssClass="mGridHeader" />
                <RowStyle CssClass="mGridRow" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
        DeleteCommand="DELETE FROM [Faculty] WHERE [User_Name] = @User_Name" InsertCommand="INSERT INTO [Faculty] ([User_Name], [Password], [Security_Question], [Answer], [Department_Id], [Name], [Phone_Number], [Email_Id], [CLC], [CCLC]) VALUES (@User_Name, @Password, @Security_Question, @Answer, @Department_Id, @Name, @Phone_Number, @Email_Id, @CLC, @CCLC)"
        ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" SelectCommand="SELECT [User_Name], [Password], [Security_Question], [Answer], [Department_Id], [Name], [Phone_Number], [Email_Id], [CCLC] FROM [Faculty] WHERE [Department_Id] = @DepartmentId"
        
        UpdateCommand="UPDATE [Faculty] SET [User_Name] = @User_Name, [Password] = @Password,  [Name] = @Name, [Phone_Number] = @Phone_Number, [Email_Id] = @Email_Id WHERE [User_Name] = @Old_User_Name">
        <DeleteParameters>
            <asp:Parameter Name="User_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Security_Question" Type="String" />
            <asp:Parameter Name="Answer" Type="String" />
            <asp:SessionParameter Name="Department_Id" SessionField="DepartmentId" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Email_Id" Type="String" />
            <asp:Parameter Name="CLC" Type="Int32" />
            <asp:Parameter Name="CCLC" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Email_Id" Type="String" />
            <asp:Parameter Name="User_Name" Type="String" />
            <asp:SessionParameter Name="Old_User_Name" SessionField="OldUserName" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
