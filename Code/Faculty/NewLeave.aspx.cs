using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Collections;
using System.Data.SqlClient;
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
            FormView1.DefaultMode = FormViewMode.Edit;
        }
    }

    protected void LeaveDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        object a = e.Command.Parameters["@Id"];
        Session.Add("LeaveId", e.Command.Parameters["@Id"].Value);
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            int LeaveId = int.Parse(Session["LeaveId"].ToString());
            BindAccordion(LeaveId, true);
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

    protected void FilterDropDownList_DataBinding(object sender, EventArgs e)
    {
        DropDownList dl = sender as DropDownList;

        //RepeaterItem ri = dl.Parent as RepeaterItem;
        RepeaterItem ri = (dl.Parent as Panel).NamingContainer as RepeaterItem;
        ListItem li1 = new ListItem(DataBinder.Eval(ri.DataItem, "Department_Id")+""+DataBinder.Eval(ri.DataItem, "Section_Name"),"SectionFacultyDataSource");
        ListItem li2 = new ListItem(DataBinder.Eval(ri.DataItem, "Department_Id") + "", "DepartmentFacultyDataSource");
        ListItem li3 = new ListItem("All", "AllFacultyDataSource");

        dl.Items.Add(li1);
        dl.Items.Add(li2);
        dl.Items.Add(li3);
    }

    protected void FilterDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dl1 = sender as DropDownList;
        Control c = dl1.Parent;
        SqlDataSource sds = c.FindControl(dl1.SelectedValue) as SqlDataSource;
        DropDownList dl2 = c.FindControl("FacultyDropDownList") as DropDownList;
        ModalPopupExtender mpe = c.FindControl("ModalPopupExtender1") as ModalPopupExtender;
        dl2.DataSourceID = "";
        dl2.DataSource = sds;
        dl2.DataBind();
        mpe.Show();
    }

    protected void SendRequestButton_Command(object sender, CommandEventArgs e)
    {
        String Adjustment_Id = e.CommandArgument.ToString();
        
        Control c = (sender as Control).Parent;
        DropDownList dl = c.FindControl("FacultyDropDownList") as DropDownList;
        DropDownList dl2 = c.FindControl("FilterDropDownList") as DropDownList;
        String FacultyId = HttpContext.Current.Request.Form[dl.UniqueID];
       
        AdjustmentRequest a = new AdjustmentRequest();
        a.AdjustmentId = int.Parse(Adjustment_Id+"");
        a.FacultyId = FacultyId;
        a.Status = "Pending";
        a.Save();
        DataBind();
    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        String LeaveBalanceInfo = "";
        bool flag = false;
        DropDownList dl = FormView1.FindControl("LeaveType") as DropDownList;
        DateTime fd = DateTime.Parse((FormView1.FindControl("From_Date") as TextBox).Text);
        DateTime td = DateTime.Parse((FormView1.FindControl("To_Date") as TextBox).Text);
        String fs = (FormView1.FindControl("FromSession") as DropDownList).SelectedValue;
        String ts = (FormView1.FindControl("ToSession") as DropDownList).SelectedValue;
        
        String ApplierId = Session["UserName"].ToString();
        LeaveType lt = LeaveType.GetById(dl.SelectedValue);
        int Month ;
        for (Month = fd.Month; Month <= td.Month; Month++)
        {
            float c1 = Leave.LeaveCount(ApplierId, Month, lt.Id) + Leave.LeaveCount(Month,fd,fs,td,ts);
            if (c1 > lt.MaxLeavesMonth)
            {
                LeaveBalanceInfo = Month + " - " + (c1 - lt.MaxLeavesMonth) + "\r\n";
                flag = true;
            }
        }
        if (flag)
        {
          //  System.Windows.Forms.MessageBox.Show(LeaveBalanceInfo);
        }
    }
    protected void LeaveDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        Faculty f = Faculty.GetByUserName(Session["UserName"]+"");
        SqlParameter sp=new SqlParameter("@Status","");
        if (f.IsPrincipal())
            sp = new SqlParameter("@Status", "Approved by HOD");
        e.Command.Parameters.Add(sp);
    }
    protected void FromDateCompareValidator_Init(object sender, EventArgs e)
    {
        CompareValidator cv = sender as CompareValidator;
        cv.ValueToCompare = DateTime.Now.ToShortDateString();
    }
}