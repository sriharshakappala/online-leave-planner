using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class L2Admin_Faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Faculty = (HyperLink)Master.FindControl("Faculty");
        Faculty.CssClass = "active";
        try
        {
            ((TextBox)GridView1.FooterRow.FindControl("UserName")).Focus(); //Raises exception when there is no footer row <-- Empty data
        }
        catch (Exception ee) { }
    }

    protected void Update_Command(object sender, CommandEventArgs e)
    {
        Session.Add("OldUserName", e.CommandArgument);
    }

    protected void Insert_Command(object sender, CommandEventArgs e)
    {
        Control c = ((Control)sender).Parent;

        String DepartmentId = Session["DepartmentId"].ToString();

        String UserName = ((TextBox)c.FindControl("UserName")).Text;
        String Password = ((TextBox)c.FindControl("Password")).Text;
        String Name = ((TextBox)c.FindControl("Name")).Text;
        String PhoneNumber = ((TextBox)c.FindControl("PhoneNumber")).Text;
        String EmailId = ((TextBox)c.FindControl("EmailId")).Text;

        new Faculty(UserName, Password, DepartmentId, Name, PhoneNumber, EmailId).Save();
        GridView1.DataBind();
    }

    protected void Delete_Command(object sender, CommandEventArgs e)
    {
        Faculty.Delete(e.CommandArgument.ToString());
        GridView1.DataBind();
    }

    protected void UserName_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = sender as TextBox;
        Label l = tb.Parent.FindControl("ErrorLabel") as Label;
        Button b = tb.Parent.FindControl("CommandButton") as Button;
        
        if (Faculty.GetByUserName(tb.Text) != null)
        {
            l.Text = "Username is not available";
            b.Enabled = false;
        }
        else
        {
            l.Text = "";
            b.Enabled = true;
        }
    }
}