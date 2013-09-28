using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_LeaveRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink Inbox = (HyperLink)Master.FindControl("LeaveRequests");
        Inbox.CssClass = "active";
        Faculty f = Faculty.GetByUserName(Session["UserName"] + "");

        Session.Add("StatusToCheck", "");
        if (f.IsPrincipal())
        {
            Session.Add("StatusToCheck", "Approved by HOD");
            LeavesDataSource.SelectCommand = "SELECT Leave.Id, Leave.Leave_Type_Id, Leave_Type.Name AS Leave_Type, Leave.Applier_Id, Leave.From_Date, Leave.From_Session, Leave.To_Date, Leave.To_Session, Leave.Reason, Leave.Phone_Number, Leave.Status, Leave.Comment FROM Leave INNER JOIN Leave_Type ON Leave.Leave_Type_Id = Leave_Type.Id WHERE (Leave.Status <> @Status)";      // By Default It is LeaveRequest.aspx <-- HOD
            if (!IsPostBack)
                LeavesDataSource.SelectParameters.Add("Status", System.Data.DbType.String, "Dummy Status");
            if (f.IsHOD())
            {
                Session.Add("Status2ToCheck", "");
                LeavesDataSource.SelectCommand = "(SELECT Completed_Leaves_View.Id,Completed_Leaves_View.Leave_Type_Id,Leave_Type.Name AS Leave_Type,Completed_Leaves_View.Applier_Id, Completed_Leaves_View.From_Date, Completed_Leaves_View.From_Session,Completed_Leaves_View.To_Date, Completed_Leaves_View.To_Session,Completed_Leaves_View.Reason,Completed_Leaves_View.Phone_Number, Completed_Leaves_View.Status, Completed_Leaves_View.Comment "
                                                   + "FROM Completed_Leaves_View INNER JOIN Faculty ON Completed_Leaves_View.Applier_Id = Faculty.User_Name INNER JOIN [Current_HODs_View] ON Faculty.Department_Id = [Current_HODs_View].Department_Id INNER JOIN Leave_Type ON Completed_Leaves_View.Leave_Type_Id = Leave_Type.Id WHERE ([Current_HODs_View].User_Name = @UserName)) "
                                                   + "union "
                                                   + "((SELECT Leave.Id,Leave.Leave_Type_Id,Leave_Type.Name AS Leave_Type,Leave.Applier_Id,Leave.From_Date,Leave.From_Session,Leave.To_Date,Leave.To_Session,Leave.Reason, Leave.Phone_Number, Leave.Status, Leave.Comment "
                                                   + "FROM Leave INNER JOIN "
                                                   + "Leave_Type ON Leave.Leave_Type_Id = Leave_Type.Id "
                                                   + "WHERE  (Leave.Status <> @Status)))";
                if (!IsPostBack)
                    LeavesDataSource.SelectParameters.Add(new SessionParameter("UserName", System.Data.DbType.String, "UserName"));
            }
        }

    }
    protected void ApproveButton_Command(object sender, CommandEventArgs e)
    {
        Faculty f = Faculty.GetByUserName(Session["UserName"] + "");
        if (f.IsPrincipal())
            Session.Add("Status", "Approved");
        else if (f.IsHOD())
            Session.Add("Status", "Approved by HOD");
    }
    protected void RejectButton_Command(object sender, CommandEventArgs e)
    {
        Session.Add("Status", "Rejected");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String LeaveId = DataBinder.Eval(e.Row.DataItem, "Id").ToString();
            String url = ResolveUrl("~/Faculty/LeaveView.aspx") + "?LeaveId=" + LeaveId;
            for (int i = 0; i < e.Row.Cells.Count-1; i++)  // -1 --> Excluding Approve / Reject Button field
            {
                e.Row.Cells[i].Attributes["onClick"] = string.Format("javascript:window.location='{0}';", url);
            }
            e.Row.Style["cursor"] = "pointer";
        }
    }
}