using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_Principal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Principal = (HyperLink)Master.FindControl("Principal");
        Principal.CssClass = "active";
    }

    protected void Update_Command(object sender, CommandEventArgs e)
    {
        Control c = ((Control)sender).Parent;
        String FacultyId = ((DropDownList)c.FindControl("FacultyId")).SelectedValue;
        int Priority = int.Parse(((TextBox)c.FindControl("Priority")).Text);

        Principal p = Principal.GetByFacultyId(e.CommandArgument.ToString());
        p.FacultyId = FacultyId;
        p.Priority = Priority;
        p.Update();
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }
    protected void FacultyId_Init(object sender, EventArgs e)
    {
        try
        {
            ((DropDownList)sender).SelectedValue = Session["EditingFacultyId"].ToString();
        }
        catch (Exception ee) { }
    }
    protected void Add_Command(object sender, CommandEventArgs e)
    {
        Control c = ((Control)sender).Parent;
        String FacultyId = ((DropDownList)c.FindControl("FacultyId")).SelectedValue;
        int Priority = int.Parse(((TextBox)c.FindControl("Priority")).Text);

        Principal p = new Principal();
        p.FacultyId = FacultyId;
        p.Priority = Priority;
        p.Save();
        GridView1.DataBind();
    }
    protected void Edit_Command(object sender, CommandEventArgs e)
    {
        Session.Add("EditingFacultyId", e.CommandArgument.ToString());
    }
}