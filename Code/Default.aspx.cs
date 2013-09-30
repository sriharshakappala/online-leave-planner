using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserName.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Faculty f;
        Department d;
        College c;
        if ((f = Faculty.GetByUserName(UserName.Text)) != null && f.Password == Password.Text)
        { 
            Session.Add("UserName", f.UserName);
            Response.Redirect("~/Faculty/Default.aspx");
        }
        else if ((d = Department.GetById(UserName.Text)) != null && d.Password == Password.Text)
        {
            Session.Add("DepartmentId", d.Id);
            Response.Redirect("~/L2Admin/Default.aspx");
        }
        else if ((c = College.GetByName(UserName.Text)) != null && c.Password == Password.Text)
        {
            Session.Add("AdminName", c.Name);
            Response.Redirect("~/L1Admin/Default.aspx");
        }
        else
            ErrorLabel.Text = "Invalid Username or Password";
    }
}