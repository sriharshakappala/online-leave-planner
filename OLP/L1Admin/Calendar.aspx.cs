using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_Calendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Calendar = (HyperLink)Master.FindControl("Calendar");
        Calendar.CssClass = "active";
    }
    protected void New_Click(object sender, EventArgs e)
    {
        CalendarDetailsView.ChangeMode(DetailsViewMode.Insert);
    }
    protected void CalendarDetailsView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        CalendarGridView.DataBind();
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        Session.Add("SelectedDate", e.CommandArgument);
        CalendarDetailsView.ChangeMode(DetailsViewMode.Edit);
        CalendarGridView.DataBind();
    }
}