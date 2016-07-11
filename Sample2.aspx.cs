using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sample2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>$('#btnShowPopup').click();</script>", false);
        //Label1.Text = "<script>openModal()</script>";
        //    <script type='text/javascript'>$('#btnShowPopup').click();</script>  
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "<script type='text/javascript'>$('#btnShowPopup').click();</script>", false);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp()", true);
    }
    protected void bt_Click(object sender,EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", "openModal()", true);
        Response.Write("abc");
    }
}