using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class L1Admin_TimeTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void NewTemplateButton_Click(object sender, EventArgs e)
    {
        Wizard1.MoveTo(Wizard1.WizardSteps[0]);
        DetailsView1.ChangeMode(DetailsViewMode.Insert);
        ModalPopupExtender1.Show();
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        {
            DetailsView1.InsertItem(true);
        }
        else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            DetailsView1.UpdateItem(true);
        GridView1.DataBind();
        ModalPopupExtender1.Show();
    }
    protected void EditButton_Command(object sender, CommandEventArgs e)
    {
        Wizard1.MoveTo(Wizard1.WizardSteps[0]);
        Session.Add("Id", e.CommandArgument.ToString());
        DetailsView1.ChangeMode(DetailsViewMode.Edit);
        ModalPopupExtender1.Show();
    }
    protected void TemplateDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Session.Add("Id",e.Command.Parameters["@Id"].Value.ToString());
    }
    protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        ModalPopupExtender1.Show();
    }
    protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
    {
        ModalPopupExtender1.Show();
    }
}