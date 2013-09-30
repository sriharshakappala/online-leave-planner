using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_LeaveTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink LeavePolicy = (HyperLink)Master.FindControl("LeavePolicy");
        LeavePolicy.CssClass = "active";
    }
    protected void Insert_Command(object sender, CommandEventArgs e)
    {
        String Name = ((TextBox)GridView1.FooterRow.FindControl("Name")).Text;
        String MaxLeavsMonth = ((TextBox)GridView1.FooterRow.FindControl("MaxLeavesMonth")).Text;
        String MaxLeavesYear = ((TextBox)GridView1.FooterRow.FindControl("MaxLeavesYear")).Text;

        new LeaveType(Name, int.Parse(MaxLeavsMonth), int.Parse(MaxLeavesYear)).Save();
        GridView1.DataBind();
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}