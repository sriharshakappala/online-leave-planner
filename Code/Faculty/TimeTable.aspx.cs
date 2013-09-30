using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_TimeTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink TimeTable = (HyperLink)Master.FindControl("TimeTable");
        TimeTable.CssClass = "active";
    }
    protected void ListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListView l = sender as ListView;

        String day = l.ID.Substring(l.ID.Length - 1);
        DateTime st = DateTime.Parse(DataBinder.Eval(e.Item.DataItem,"Start_Time","{0:HH:mm}"));
        DateTime et = DateTime.Parse(DataBinder.Eval(e.Item.DataItem, "End_Time", "{0:HH:mm}"));
        String Faculty_Id = Session["UserName"]+"";

        Label lbl = e.Item.FindControl("Class") as Label;
        lbl.Text = WorkingHours.GetClass(Faculty_Id, int.Parse(day), st, et);
    }
}