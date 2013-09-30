<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site.master" AutoEventWireup="true"
    CodeFile="HODs.aspx.cs" Inherits="L1Admin_HODs" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="Faculty_Id" 
        DataSourceID="HODDataSource" 
        EmptyDataText="There are no data records to display." 
    ShowFooter="True" HorizontalAlign="Center"
        ShowHeaderWhenEmpty="True" CssClass="mGrid" GridLines="None">
                <AlternatingRowStyle CssClass="mGridAlternateRow" />
                <Columns>
                    <asp:TemplateField HeaderText="Faculty_Id" SortExpression="Faculty_Id">
                        <EditItemTemplate>
                            <asp:DropDownList ID="Department" runat="server" AutoPostBack="True" DataSourceID="DepartmentDataSource"
                        DataTextField="Id" DataValueField="Id" SelectedValue='<%# Bind("Id") %>'>
                            </asp:DropDownList>
                            <asp:DropDownList ID="Faculty" runat="server" DataSourceID="FacultyDataSource" DataTextField="Name"
                        DataValueField="User_Name" OnPreRender="Faculty_PreRender" AutoPostBack="True" 
                                onselectedindexchanged="Faculty_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="ErrorLabel1" runat="server" CssClass="errorNotification2"></asp:Label>
                            <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                        
                        
                                SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Department" Name="Department_Id" PropertyName="SelectedValue"
                                Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                        SelectCommand="SELECT [Id] FROM [Department]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="Department" runat="server" AutoPostBack="True" DataSourceID="DepartmentDataSource"
                        DataTextField="Id" DataValueField="Id">
                            </asp:DropDownList>
                            <asp:DropDownList ID="Faculty" runat="server" DataSourceID="FacultyDataSource" DataTextField="Name"
                        DataValueField="User_Name" AutoPostBack="True" 
                                onselectedindexchanged="Faculty_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="ErrorLabel1" runat="server" CssClass="errorNotification"></asp:Label>
                            <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                        
                        
                                SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Department" Name="Department_Id" PropertyName="SelectedValue"
                                Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                        SelectCommand="SELECT [Id] FROM [Department]"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Faculty_Id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Priority" SortExpression="Priority">
                        <EditItemTemplate>
                            <asp:TextBox ID="Priority" runat="server" Text='<%# Bind("Priority") %>' 
                        ValidationGroup="UpdateHOD" AutoPostBack="True" 
                                ontextchanged="Priority_TextChanged"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="Priority_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="Priority">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification2" Display="Dynamic" 
                        ErrorMessage="*" ValidationGroup="UpdateHOD"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="ErrorLabel2" runat="server" CssClass="errorNotification2"></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Priority" runat="server" ValidationGroup="AddHOD" 
                                AutoPostBack="True" ontextchanged="Priority_TextChanged"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="Priority_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="Priority">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Priority" CssClass="errorNotification" Display="Dynamic" 
                        ErrorMessage="*" ValidationGroup="AddHOD"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="ErrorLabel2" runat="server" CssClass="errorNotification"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Priority") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="CommandButton" runat="server" CommandArgument='<%# Eval("Faculty_Id") %>'
                        CommandName="Update" OnCommand="Update_Command" Text="Update" 
                        ValidationGroup="UpdateHOD" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="CommandButton" runat="server" CommandName="Add" OnCommand="Add_Command" 
                        Text="Add" ValidationGroup="AddHOD" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Faculty_Id") %>'
                        CommandName="Edit" OnCommand="Button1_Command" Text="Edit" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:DropDownList ID="Department" runat="server" AutoPostBack="True" DataSourceID="DepartmentDataSource"
                            DataTextField="Id" DataValueField="Id">
                                </asp:DropDownList>
                                <asp:DropDownList ID="Faculty" runat="server" DataSourceID="FacultyDataSource" DataTextField="Name"
                            DataValueField="User_Name">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="FacultyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                            
                            
                                    SelectCommand="SELECT [User_Name], [Name] FROM [Faculty] WHERE ([Department_Id] = @Department_Id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Department" Name="Department_Id" PropertyName="SelectedValue"
                                    Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
                            SelectCommand="SELECT [Id] FROM [Department]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:TextBox ID="Priority" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="Add" runat="server" CommandName="Add" OnCommand="Add_Command" 
                            Text="Add" />
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <FooterStyle CssClass="mGridFooter" />
                <HeaderStyle CssClass="mGridHeader" />
                <RowStyle CssClass="mGridRow" />
            </asp:GridView>
            <asp:SqlDataSource ID="HODDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
                DeleteCommand="DELETE FROM [HOD] WHERE [Faculty_Id] = @Faculty_Id" 
                InsertCommand="INSERT INTO [HOD] ([Faculty_Id], [Priority]) VALUES (@Faculty_Id, @Priority)" 
                ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" 
                SelectCommand="SELECT HOD.Faculty_Id, HOD.Priority, Department.Id FROM Department INNER JOIN Faculty ON Department.Id = Faculty.Department_Id RIGHT OUTER JOIN HOD ON Faculty.User_Name = HOD.Faculty_Id" 
                UpdateCommand="UPDATE [HOD] SET [Faculty_Id] = @Faculty_Id, [Priority] = @Priority WHERE [Faculty_Id] = @Old_Faculty_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Faculty_Id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Faculty_Id" Type="String" />
                    <asp:Parameter Name="Priority" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Priority" Type="Int32" />
                    <asp:Parameter Name="Faculty_Id" Type="String" />
                    <asp:SessionParameter Name="Old_Faculty_Id" SessionField="EditingFacultyId" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    &nbsp;
    <br />
</asp:Content>
