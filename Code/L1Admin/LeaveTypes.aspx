<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site.master" AutoEventWireup="true" CodeFile="LeaveTypes.aspx.cs" Inherits="L1Admin_LeaveTypes" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Accordion ID="Accordion1" runat="server">
    </asp:Accordion>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="mGrid" DataKeyNames="Id" DataSourceID="LeaveTypeDataSource" 
                EmptyDataText="There are no data records to display." GridLines="None" 
                HorizontalAlign="Center" ShowFooter="True" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle CssClass="mGridAlternateRow" />
                <Columns>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' 
                                ValidationGroup="UpdateLeaveType"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TextBox1" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" ValidationGroup="UpdateLeaveType"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="Name" runat="server" ValidationGroup="AddLeaveType"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="Name" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" ToolTip="Name Required" ValidationGroup="AddLeaveType"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Max Leaves/Month" 
                        SortExpression="Max_Leaves_Month">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("Max_Leaves_Month") %>' ValidationGroup="UpdateLeaveType"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="TextBox2_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox2">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="TextBox2" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" ValidationGroup="UpdateLeaveType"></asp:RequiredFieldValidator>
                    <br />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="TextBox2" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="Out of range" MaximumValue="31" MinimumValue="0" Type="Integer" 
                                ValidationGroup="UpdateLeavePolicy"></asp:RangeValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="MaxLeavesMonth" runat="server" ValidationGroup="AddLeaveType"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="MaxLeavesMonth_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" 
                                TargetControlID="MaxLeavesMonth">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="MaxLeavesMonth" CssClass="errorNotification" 
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="AddLeaveType"></asp:RequiredFieldValidator>
                    <br />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                ControlToValidate="MaxLeavesMonth" CssClass="errorNotification" 
                                Display="Dynamic" ErrorMessage="Out of range" MaximumValue="31" 
                                MinimumValue="0" Type="Integer" ValidationGroup="AddLeaveType"></asp:RangeValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Max_Leaves_Month") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Max Leaves/Year" 
                        SortExpression="Max_Leaves_Year">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ontextchanged="TextBox3_TextChanged" 
                                Text='<%# Bind("Max_Leaves_Year") %>' ValidationGroup="UpdateLeaveType"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="TextBox3_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox3">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="TextBox3" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="*" ValidationGroup="UpdateLeaveType"></asp:RequiredFieldValidator>
                    <br />
                            <asp:RangeValidator ID="RangeValidator3" runat="server" 
                                ControlToValidate="TextBox3" CssClass="errorNotification" Display="Dynamic" 
                                ErrorMessage="Out of range" MaximumValue="255" MinimumValue="0" Type="Integer" 
                                ValidationGroup="UpdateLeaveType"></asp:RangeValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="MaxLeavesYear" runat="server" ValidationGroup="AddLeaveType"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="MaxLeavesYear_FilteredTextBoxExtender" 
                                runat="server" Enabled="True" FilterType="Numbers" 
                                TargetControlID="MaxLeavesYear">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="MaxLeavesYear" CssClass="errorNotification" 
                                Display="Dynamic" ErrorMessage="*" ValidationGroup="AddLeaveType"></asp:RequiredFieldValidator>
                    <br />
                            <asp:RangeValidator ID="RangeValidator4" runat="server" 
                                ControlToValidate="MaxLeavesYear" CssClass="errorNotification" 
                                Display="Dynamic" ErrorMessage="Out of range" MaximumValue="255" 
                                MinimumValue="0" Type="Integer" ValidationGroup="AddLeaveType"></asp:RangeValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Max_Leaves_Year") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" ValidationGroup="UpdateLeaveType" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="Button3" runat="server" CommandName="Insert" 
                                oncommand="Insert_Command" Text="Add" ValidationGroup="AddLeaveType" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" 
                        DataSourceID="LeaveTypeDataSource" DefaultMode="Insert">
                        <EditItemTemplate>
                            Id:
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                            Name:
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                            Max_Leaves_Month:
                            <asp:TextBox ID="Max_Leaves_MonthTextBox" runat="server" 
                                Text='<%# Bind("Max_Leaves_Month") %>' />
                    <br />
                            Max_Leaves_Year:
                            <asp:TextBox ID="Max_Leaves_YearTextBox" runat="server" 
                                Text='<%# Bind("Max_Leaves_Year") %>' />
                    <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Max_Leaves_MonthTextBox" runat="server" 
                                            Text='<%# Bind("Max_Leaves_Month") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Max_Leaves_YearTextBox" runat="server" 
                                            Text='<%# Bind("Max_Leaves_Year") %>' />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button4" runat="server" CommandName="Insert" Text="Add" />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button5" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <InsertRowStyle BackColor="Black" />
                        <ItemTemplate>
                            Id:
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                            Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                            Max_Leaves_Month:
                            <asp:Label ID="Max_Leaves_MonthLabel" runat="server" 
                                Text='<%# Bind("Max_Leaves_Month") %>' />
                    <br />
                            Max_Leaves_Year:
                            <asp:Label ID="Max_Leaves_YearLabel" runat="server" 
                                Text='<%# Bind("Max_Leaves_Year") %>' />
                    <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                </EmptyDataTemplate>
                <FooterStyle CssClass="mGridFooter" />
                <HeaderStyle CssClass="mGridHeader" />
                <RowStyle CssClass="mGridRow" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <asp:SqlDataSource ID="LeaveTypeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>" 
        DeleteCommand="DELETE FROM [Leave_Type] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Leave_Type] ([Name], [Max_Leaves_Month], [Max_Leaves_Year]) VALUES (@Name, @Max_Leaves_Month, @Max_Leaves_Year)" 
        ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" 
        SelectCommand="SELECT [Id], [Name], [Max_Leaves_Month], [Max_Leaves_Year] FROM [Leave_Type]" 
        UpdateCommand="UPDATE [Leave_Type] SET [Name] = @Name, [Max_Leaves_Month] = @Max_Leaves_Month, [Max_Leaves_Year] = @Max_Leaves_Year WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Byte" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Max_Leaves_Month" Type="Byte" />
            <asp:Parameter Name="Max_Leaves_Year" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Max_Leaves_Month" Type="Byte" />
            <asp:Parameter Name="Max_Leaves_Year" Type="Byte" />
            <asp:Parameter Name="Id" Type="Byte" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

