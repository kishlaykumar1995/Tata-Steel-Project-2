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

        
        if(ds.Tables[0].Rows.Count == 0)
        {
            Label l = new Label();
            l.Text = "Invalid ID!!";
            this.Controls.Add(l);
        }
        else
        {
            dr = ds.Tables[0].Rows[0];
            if(dr["password"].Equals(TextBox2.Text))
            {
                Session["ename"] = dr["name"];
                Session["eid"] = dr["e_id"];
                Response.Redirect("Default.aspx");
            }
            else
            {
                Label l = new Label();
                l.Text = "Wrong Password!!";
                this.Controls.Add(l);
            }
        }
    }
}