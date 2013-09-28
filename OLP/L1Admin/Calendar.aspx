<%@ Page Title="" Language="C#" MasterPageFile="~/L1Admin/Site2.master" AutoEventWireup="true"
    CodeFile="Calendar.aspx.cs" Inherits="L1Admin_Calendar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <br />
        <asp:GridView ID="CalendarGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Date"
            DataSourceID="CalendarDataSource" EmptyDataText="There are no data records to display."
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Date") %>'
                            OnCommand="LinkButton1_Command">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:Button ID="New" runat="server" OnClick="New_Click" Text="New" />
        <asp:SqlDataSource ID="CalendarDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
            DeleteCommand="DELETE FROM [Calendar] WHERE [Date] = @Date" InsertCommand="INSERT INTO [Calendar] ([Date], [Description]) VALUES (@Date, @Description)"
            ProviderName="<%$ ConnectionStrings:OLPConnectionString.ProviderName %>" SelectCommand="SELECT [Date], [Description] FROM [Calendar]"
            UpdateCommand="UPDATE [Calendar] SET [Description] = @Description WHERE [Date] = @Date">
            <DeleteParameters>
                <asp:Parameter Name="Date" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Date" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <asp:DetailsView ID="CalendarDetailsView" runat="server" AutoGenerateRows="False"
        DataKeyNames="Date" DataSourceID="CalendarlDataSource2" Height="50px" Width="125px"
        OnItemInserted="CalendarDetailsView_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                        Format="dd/MMM/yyyy" TargetControlID="TextBox1">
                    </asp:CalendarExtender>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="CalendarlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OLPConnectionString %>"
        DeleteCommand="DELETE FROM [Calendar] WHERE [Date] = @Date" InsertCommand="INSERT INTO [Calendar] ([Date], [Description]) VALUES (@Date, @Description)"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Date], [Description] FROM [Calendar] WHERE ([Date] = @Date)"
        UpdateCommand="UPDATE [Calendar] SET [Description] = @Description WHERE [Date] = @Date">
        <DeleteParameters>
            <asp:Parameter Name="Date" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Date" SessionField="SelectedDate" Type="DateTime" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
