using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Collections;

public class DaySession
{
    DateTime _date;

    public DateTime Date
    {
        get { return _date; }
        set { _date = value; }
    }
    String _session;

    public String Session
    {
        get { return _session; }
        set { _session = value; }
    }
}

public partial class Faculty_NewLeave : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //HyperLink NewLeave = Master.FindControl("New") as HyperLink;
        //NewLeave.CssClass = "active";
        String LeaveId;
        if ((LeaveId = Request.Params["LeaveId"]) != null)
        {
            Session.Add("LeaveId", LeaveId);
            BindAccordion(int.Parse(LeaveId), false);
        }
    }

    public void BindAccordion(int LeaveId, bool CreateAdjustments)
    {
        Leave l = Leave.GetById(LeaveId);
        int NoOfDays = (l.ToDate - l.FromDate).Days + 1;
        DaySession[] dsa = new DaySession[NoOfDays];
        for (int i = 0; i < NoOfDays; i++)
        {
            dsa[i] = new DaySession();
            dsa[i].Date = l.FromDate.AddDays(i);
            if (i == 0)
                dsa[i].Session = (l.FromSession == "Morning") ? "Afternoon" : "Morning";
            else if (i == NoOfDays - 1)
                dsa[i].Session = (l.ToSession == "Afternoon") ? "Morning" : "Afternoon";
            else
                dsa[i].Session = "";
            if (CreateAdjustments)
            {
                string FacultyId = Session["UserName"].ToString();
                Adjustment.CreateAdjustments(LeaveId, dsa[i].Date,dsa[i].Session, FacultyId);
            }
        }
        Accordion2.DataSource = dsa;
        Accordion2.DataBind();
    }

    protected void Accordion2_ItemDataBound(object sender, AccordionItemEventArgs e)
    {
        if (e.ItemType == AccordionItemType.Content)
        {
              Repeater r1 = e.AccordionItem.FindControl("Repeater1") as Repeater;
              Repeater r2 = e.AccordionItem.FindControl("Repeater2") as Repeater;

              SqlDataSource sd1 = e.AccordionItem.FindControl("AdjustmentViewDataSource1") as SqlDataSource;
              SqlDataSource sd2 = e.AccordionItem.FindControl("AdjustmentViewDataSource2") as SqlDataSource;

              r1.DataSource = sd1;
              r2.DataSource = sd2;

              r1.DataBind();
              r2.DataBind();
        }
    }
}   