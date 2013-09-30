using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L2Admin_temp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    int i = 0;
    protected void Label1_Init(object sender, EventArgs e)
    {
        Label l = (Label)sender;
        l.Text = (DayOfWeek)(i++) + "";
    }
}