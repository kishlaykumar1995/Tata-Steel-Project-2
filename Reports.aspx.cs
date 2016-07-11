using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        datepicker.Attributes.Add("readonly", "readonly");
        datepicker1.Attributes.Add("readonly", "readonly");
        DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string to = datepicker1.Value.Substring(6) + "-" + datepicker1.Value.Substring(3,2) + "-" +datepicker1.Value.Substring(0,2);
        string from = datepicker.Value.Substring(6) + "-" + datepicker.Value.Substring(3, 2) + "-" + datepicker.Value.Substring(0, 2);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + SqlDataSource1.SelectCommand + "')", true);
        SqlDataSource2.SelectCommand = "select * from log_records where deptcode=" + DropDownList1.SelectedItem + " and indate between '" + from + "' and '" + to + "'";
        //System.Windows.Forms.MessageBox.Show(SqlDataSource2.SelectCommand);
    }

    protected void Unnamed1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }



    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        if (DropDownList1.Items.Count == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You do not have access to reports of any department'); window.location = 'Home.aspx'", true);
        }
    }

}