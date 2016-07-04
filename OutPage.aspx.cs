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
                ad.Dispose();

                //Get the records table
                DataTable dt = ds.Tables[0];
                int x = dt.Rows.Count; 
                //Check if records for the particular gatepassID exist
                if(x == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Entry records for this gatepass')", true);
                }

                else if(!(bool)dt.Rows[x-1]["visitor_out"])
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have successfully checked out')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have no pending check outs')", true);
                }
            }
        barcodeBitmap.Dispose();
        File.Delete(@"C:\a.jpg");
        }
        catch(FileNotFoundException)
        {
            Label l = new Label();
            l.Attributes.Add("style", "font-size:30px; color:Red;");
            l.Text = "No Snapshot Exists";
            this.Controls.Add(l);
        }        
    }
}