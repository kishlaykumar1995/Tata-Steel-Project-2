using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

public partial class LoginPage : System.Web.UI.Page
{
    DataSet ds;
    DataTable dt;
    DataRow dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBox1.Text.Equals(""))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp('Empty ID field!')", true);
                return;
            }

            if (TextBox2.Text.Equals(""))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp('Empty Password Field!')", true);
                return;
            }

            int x = Int32.Parse(TextBox1.Text);


            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conStr1"].ConnectionString);
            con.Open();
            using (con)
            {
                SqlDataAdapter ad = new SqlDataAdapter("select * from emp_details where e_id='" + TextBox1.Text + "'", con);
                using (ad)
                {
                    ds = new DataSet();
                    ad.Fill(ds);
                }
            }


            if (ds.Tables[0].Rows.Count == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp('Invalid ID!')", true);
                // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid ID')", true);
            }
            else
            {
                dr = ds.Tables[0].Rows[0];
                if (dr["password"].Equals(TextBox2.Text))
                {
                    Session["ename"] = dr["name"];
                    Session["eid"] = dr["e_id"];
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp('Wrong Password')", true);
                }
            }

        }
        catch (FormatException)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "comp('Invalid ID!!ID must be a number')", true);
        }
    }

}