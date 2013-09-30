using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_Departments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Departments = (HyperLink)Master.FindControl("Departments");
        Departments.CssClass = "active";
    }
    protected void Insert_Command(object sender, CommandEventArgs e)
    {
        String Id = ((TextBox)GridView1.FooterRow.FindControl("Id")).Text;
        String Password = ((TextBox)GridView1.FooterRow.FindControl("Password")).Text;
        String Name = ((TextBox)GridView1.FooterRow.FindControl("Name")).Text;

        new Department(Id, Password, Name).Save();
        GridView1.DataBind();
    }
    protected void Update_Command(object sender, CommandEventArgs e)
    {
        String Id = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Id")).Text;
        String Password = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Password")).Text;
        String Name = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Name")).Text;

        Department d = Department.GetById(e.CommandArgument.ToString());    // Command Argument --> Old Id
        d.Id = Id;  // Id --> New Id
        d.Password = Password;
        d.Name = Name;
        d.Update();
        GridView1.DataBind();
        GridView1.SetEditRow(-1);
    }
    protected void Id_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = sender as TextBox;
        Button b = tb.Parent.FindControl("CommandButton") as Button;
        Label l = tb.Parent.FindControl("ErrorLabel") as Label;

        if (Department.GetById(tb.Text) != null)
        {
            l.Text = "Id not availabe";
            b.Enabled = false;
        }
        else
        {
            l.Text = "";
            b.Enabled = true;
        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorLabel.Text = "First delete all the sections and faculty of department";
        }
    }
}