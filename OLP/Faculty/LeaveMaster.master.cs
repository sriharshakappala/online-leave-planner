using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_LeaveMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink LeaveMaster = (HyperLink)Master.FindControl("Leaves");
        LeaveMaster.CssClass = "active";
    }
}
