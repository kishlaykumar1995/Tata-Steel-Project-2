using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = 0;
        if(x == 0)
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp()", true);
    }
}