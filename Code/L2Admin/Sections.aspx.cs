using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L2Admin_Sections : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Sections = (HyperLink)Master.FindControl("Sections");
        Sections.CssClass = "active";
    }

    protected void Insert_Command(object sender, CommandEventArgs e)
    {
        Button b = (Button)sender;  // Current Button
        Control c = b.Parent;       // Parent which holds all the controls of empty data template

        String DepartmentId = Session["DepartmentId"].ToString();     // DepartmentId from Session
        String Year = ((DropDownList)c.FindControl("Year")).SelectedValue;
        String Name = ((TextBox)c.FindControl("Name")).Text;

        new Section(DepartmentId, int.Parse(Year), Name).Save();
        GridView1.DataBind();
    }

    protected void Update_Command(object sender, CommandEventArgs e)
    {
        String DepartmentId = Session["DepartmentId"].ToString();     // DepartmentId from Session
        String Year = ((DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("Year")).SelectedValue;
        String Name = ((TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("Name")).Text;

        Section s = Section.GetById(int.Parse(e.CommandArgument.ToString()));
        s.DepartmentId = DepartmentId;
        s.Year = int.Parse(Year);
        s.Name = Name;
        s.Update();
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }

    protected void ViewTimeTable_Command(object sender, CommandEventArgs e)
    {
        int SectionId = int.Parse(e.CommandArgument.ToString());
        Session.Add("SectionId", SectionId);
        Object TemplateId = Section.GetTemplateId(SectionId);
        if (TemplateId != null)
            TemplateDropDownList.SelectedValue = TemplateId.ToString();
        Wizard1.MoveTo(Wizard1.WizardSteps[0]);
        ModalPopupExtender1.Show();
    }
    bool EmptyCellsCreated = false;

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        string a = Session[0].ToString();
        int SectionId = int.Parse(Session["SectionId"].ToString());
        WorkingHours[] wh = WorkingHours.GetBySectionId(SectionId);

        int TemplateId = int.Parse(TemplateDropDownList.SelectedValue);
        TimeTableListView.GroupItemCount = TimeTableTemplate.GetNoOfPeriods(TemplateId);

        if (wh == null || wh.Length != (6 * TimeTableTemplate.GetNoOfPeriods((int)Section.GetTemplateId(SectionId))))
        {
            WorkingHours.CreateEmptyCells(SectionId, TemplateId);
            EmptyCellsCreated = true;
        }
        ModalPopupExtender1.Show();
    }

    protected void TimeTableListView_DataBound(object sender, EventArgs e)
    {
        if(EmptyCellsCreated)
        {
            int SectionId = int.Parse(Session["SectionId"].ToString());
            int i = WorkingHours.DeleteEmptyCells(SectionId);
            foreach (ListViewItem l in TimeTableListView.Items)
                l.DataBind(); 
        }
    }

    protected void ModalPopupShow(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
}