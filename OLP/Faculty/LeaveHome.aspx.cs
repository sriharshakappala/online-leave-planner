using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Faculty_LeaveHome : System.Web.UI.Page
{
    class LeaveBalance
    {
        String _leaveType;

        public String LeaveType
        {
            get { return _leaveType; }
            set { _leaveType = value; }
        }
        float _applied;

        public float Applied
        {
            get { return _applied; }
            set { _applied = value; }
        }
        float _remaining;

        public float Remaining
        {
            get { return _remaining; }
            set { _remaining = value; }
        }
        float _lossOfPay;

        public float LossOfPay
        {
            get { return _lossOfPay; }
            set { _lossOfPay = value; }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //HyperLink LeaveHome = Master.FindControl("LeaveHome") as HyperLink;
        //LeaveHome.CssClass = "active";
        BindGrid(1);
    }

    private void BindGrid(int Month)
    {
        String ApplierId = Session["UserName"] as String;
        List<LeaveBalance> l = new List<LeaveBalance>();

        LeaveType[] lts = LeaveType.GetAll();
        foreach (LeaveType lt in lts)
        {
            LeaveBalance lb = new LeaveBalance();

            float LeaveCountUptoSelectedMonth = 0;
            for (int i = 1; i < Month; i++)
                LeaveCountUptoSelectedMonth += Leave.LeaveCount(ApplierId, i, lt.Id);

            float SelectedMonthLeaveCount = Leave.LeaveCount(ApplierId, Month, lt.Id);

            lb.LeaveType = lt.Name;
            //if (LeaveCountUptoSelectedMonth + SelectedMonthLeaveCount <= lt.MaxLeavesYear)
            //{
            if (SelectedMonthLeaveCount <= lt.MaxLeavesMonth)
            {
                lb.Applied = SelectedMonthLeaveCount;
                lb.Remaining = lt.MaxLeavesMonth - SelectedMonthLeaveCount;
                lb.LossOfPay = 0;
            }
            else
            {
                lb.Applied = lt.MaxLeavesMonth;
                lb.Remaining = 0;
                lb.LossOfPay = SelectedMonthLeaveCount - lt.MaxLeavesMonth;
            }
            l.Add(lb);
            //    }
        }
        GridView1.DataSource = l;
        GridView1.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid(int.Parse(DropDownList1.SelectedValue));
    }
}