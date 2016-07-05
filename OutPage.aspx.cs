using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;

public partial class OutPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        { 
        IBarcodeReader reader = new BarcodeReader();
        var barcodeBitmap = (Bitmap) Bitmap.FromFile(@"C:\a.jpg");
        var result = reader.Decode(barcodeBitmap);
            if (result != null)
            {
                System.Windows.Forms.MessageBox.Show(result.Text);
                Session["gp_id"] = result.Text;
                //txtDecoderType.Text = result.BarcodeFormat.ToString();

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
                con.Open();
                SqlDataAdapter ad = new SqlDataAdapter("select * from log_records where gp_id='" + result.Text + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                //Get the records table
                DataTable dt = ds.Tables[0];
                int x = dt.Rows.Count; 
                //Check if records for the particular gatepassID exist
                if(x == 0)
                {
                    LiteralControl control = new LiteralControl();
                    control.Text = "<br /><br />";
                    this.Controls.Add(control);
                    Label l = new Label();
                    l.Attributes.Add("style", "font-size:30px; color:Red;");
                    l.Text = "No entry records present for this gatepassID.";
                    this.Controls.Add(l);
                }

                else if(!(bool)dt.Rows[x-1]["visitor_out"])
                {
                    if(accessible(con,(int)dt.Rows[x-1]["deptcode"]))
                    {
                        SqlCommand com = new SqlCommand();
                        com.CommandText = "update log_records set visitor_out=1,outperson=" + Session["eid"]
                                            + ",outtime='" + DateTime.Now.TimeOfDay + "' where gp_id='"
                                            + result.Text + "' and intime='" + dt.Rows[x - 1]["intime"] + "'";
                        Response.Write(com.CommandText);
                        com.Connection = con;
                        com.ExecuteNonQuery();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have successfully checked out'); window.location = 'HomePage.aspx'", true);
                        //Response.Redirect("HomePage.aspx");
                    }
                }
                else
                {
                    LiteralControl control = new LiteralControl();
                    control.Text = "<br /><br />";
                    this.Controls.Add(control);
                    Label l = new Label();
                    l.Attributes.Add("style", "font-size:30px; color:Red;");
                    l.Text = "No pending Check-Outs";
                    this.Controls.Add(l);
                }
                ad.Dispose();
            }
            else
            {
                LiteralControl control = new LiteralControl();
                control.Text = "<br /><br />";
                this.Controls.Add(control);
                Label l = new Label();
                l.Attributes.Add("style", "font-size:30px; color:Red;");
                l.Text = "Scanning Error!!Try Again";
                this.Controls.Add(l);
            }
            barcodeBitmap.Dispose();
        File.Delete(@"C:\a.jpg");
        }
        catch(FileNotFoundException)
        {
            LiteralControl control = new LiteralControl();
            control.Text = "<br /><br />";
            this.Controls.Add(control);
            Label l = new Label();
            l.Attributes.Add("style", "font-size:30px; color:Red;");
            l.Text = "No Snapshot Exists";
            this.Controls.Add(l);
        }        
    }

    private bool accessible(SqlConnection con, int v)
    {
        string s = "select valid_till from emp_roles where role='I/O' and e_id = " + Session["eid"] + " and deptcode=" + v;
        //Response.Write(s);
        SqlDataAdapter ad = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        ad.Dispose();
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            LiteralControl control = new LiteralControl();
            control.Text = "<br /><br />";
            this.Controls.Add(control);
            Label l = new Label();
            l.Attributes.Add("style", "font-size:30px; color:Red;");
            l.Text = "Dept Inaccessible by the current employee";
            this.Controls.Add(l);
            return false;
        }
        else
        {
            if (DateTime.Now.CompareTo(Convert.ToDateTime(dt.Rows[0]["valid_till"])) < 0)
            {
                return true;
            }
            else
            {
                LiteralControl control = new LiteralControl();
                control.Text = "<br /><br />";
                this.Controls.Add(control);
                Label l = new Label();
                l.Attributes.Add("style", "font-size:30px; color:Red;");
                l.Text = "Access for current employee has expired";
                this.Controls.Add(l);
                return false;
            }
        }

            }
}