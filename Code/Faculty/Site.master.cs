using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class New : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
            Response.Redirect("~/Default.aspx");
        if (!IsPostBack)
        {
            Faculty f = Faculty.GetByUserName(Session["UserName"] + "");

            if (f.IsHOD() || f.IsPrincipal())
            {
                LeaveRequests.Visible = true;

               /* if (f.IsPrincipal())
                {
                    LeaveRequests.NavigateUrl = "LeaveRequests2.aspx";      // By Default It is LeaveRequest.aspx <-- HOD

                    if (f.IsHOD())
                        LeaveRequests.NavigateUrl = "LeaveRequests3.aspx";
                }*/

            }
        } 
    }
}
