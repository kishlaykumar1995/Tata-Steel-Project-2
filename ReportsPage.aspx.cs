using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportsPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + SqlDataSource1.SelectCommand + "')", true);
        SqlDataSource2.SelectCommand = "select * from log_records where deptcode=" + DropDownList1.SelectedItem;
    }
}