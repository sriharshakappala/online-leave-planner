using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_HODs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink HOD = (HyperLink)Master.FindControl("HOD");
        HOD.CssClass = "active";
    }
    protected void Add_Command(object sender, CommandEventArgs e)
    {
        Control p = ((Control)sender).Parent;

        String FacultyId = ((DropDownList)p.FindControl("Faculty")).SelectedValue;
        int Priority = int.Parse(((TextBox)p.FindControl("Priority")).Text);

        new HOD(FacultyId, Priority).Save();
        GridView1.DataBind();
    }
    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        Session.Add("EditingFacultyId", e.CommandArgument.ToString());
    }
    protected void Update_Command(object sender, CommandEventArgs e)
    {
        Control p = ((Control)sender).Parent;

        String FacultyId = ((DropDownList)p.FindControl("Faculty")).SelectedValue;
        int Priority = int.Parse(((TextBox)p.FindControl("Priority")).Text);
        
        HOD h = HOD.GetByFacultyId(e.CommandArgument.ToString());
        h.FacultyId = FacultyId;
        h.Priority = Priority;
        h.Update();
        GridView1.EditIndex = -1;
    }
    protected void FacultyDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
    bool Flag = true;
    protected void Faculty_PreRender(object sender, EventArgs e)
    {
        if (Flag)
        {
            ListItem l = ((DropDownList)sender).Items.FindByValue(Session["EditingFacultyId"].ToString());
            if (l != null)
                ((DropDownList)sender).SelectedValue = Session["EditingFacultyId"].ToString();
        }
    }
    protected void Priority_TextChanged(object sender, EventArgs e)
    {
        Flag = false;
        TextBox pt = sender as TextBox;
        DropDownList dept = pt.Parent.FindControl("Department") as DropDownList;
        Label err = pt.Parent.FindControl("ErrorLabel2") as Label;
        Button b = pt.Parent.FindControl("CommandButton") as Button;

        if (HOD.GetByPriority(dept.SelectedValue, int.Parse(pt.Text)) != null)
        {
            err.Text = "Priority Not Available";
            b.Enabled = false;
        }
        else
        {
            err.Text = "";
            b.Enabled = true;
        }
    }
    protected void Faculty_SelectedIndexChanged(object sender, EventArgs e)
    {
        Flag = false;
        DropDownList f = sender as DropDownList;
        Label err = f.Parent.FindControl("ErrorLabel1") as Label;
        Button b = f.Parent.FindControl("CommandButton") as Button;

        if (HOD.GetByFacultyId(f.SelectedValue) != null)
        {
            err.Text = "Faculty Not Available";
            b.Enabled = false;
        }
        else
        {
            err.Text = "";
            b.Enabled = true;
        }
    }
}