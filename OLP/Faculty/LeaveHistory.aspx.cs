using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_LeaveHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // HyperLink History = Master.FindControl("History") as HyperLink;
       // History.CssClass = "active";
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            String LeaveId = DataBinder.Eval(e.Row.DataItem, "Id").ToString();
            String url = ResolveUrl("~/Faculty/NewLeave.aspx") + "?LeaveId=" + LeaveId;
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].Attributes["onClick"] = string.Format("javascript:window.location='{0}';", url);
            }
            e.Row.Style["cursor"] = "pointer";
        }
    }
}