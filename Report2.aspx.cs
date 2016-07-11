using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string v = Request.QueryString["q"];
        TextBox1.Text = v;
        SqlDataSource1.SelectCommand = "select gp_id from visitor where sp_id ='" +v+ "'";
        DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + SqlDataSource1.SelectCommand + "')", true);
        SqlDataSource2.SelectCommand = "select * from log_records where gp_id='" + DropDownList1.SelectedItem + "'";
        //System.Windows.Forms.MessageBox.Show(SqlDataSource2.SelectCommand);
    }

    protected void Unnamed1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

}