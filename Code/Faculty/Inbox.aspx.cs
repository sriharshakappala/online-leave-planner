using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_Inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Inbox = (HyperLink)Master.FindControl("Inbox");
        Inbox.CssClass = "active";
    }
    protected void ApproveButton_Command(object sender, CommandEventArgs e)
    {
        Session.Add("AdjustmentId", e.CommandArgument);
        Session.Add("Status", "Approved");
    }
    protected void RejectButton_Command(object sender, CommandEventArgs e)
    {
        Session.Add("AdjustmentId", e.CommandArgument);
        Session.Add("Status", "Rejected");
    }
    protected void AdjustmentRequestViewDataSource_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            if (e.Command.Parameters["@Status"].Value.ToString() == "Approved")
            {
                int AdjustmentId = int.Parse(e.Command.Parameters["@AdjustmentId"].Value.ToString());
                Adjustment a = Adjustment.GetById(AdjustmentId);
                a.FacultyId = e.Command.Parameters["@FacultyId"].Value.ToString();
                a.Update();

                AdjustmentRequest.DeletePendingRequests(AdjustmentId);
            }
        }
    }
}