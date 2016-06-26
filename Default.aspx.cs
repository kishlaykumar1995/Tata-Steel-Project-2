using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;

public partial class demos_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

try
    { 
        IBarcodeReader reader1 = new BarcodeReader();
        // load a bitmap

        var barcodeBitmap = (Bitmap)Bitmap.FromFile(@"C:\a.jpg");
        // detect and decode the barcode inside the bitmap
        var result = reader1.Decode(barcodeBitmap);
            // do something with the result
            if (result != null)
            {
                //txtDecoderType.Text = result.BarcodeFormat.ToString();

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
                con.Open();

                SqlDataAdapter ad = new SqlDataAdapter("select * from person where p_id='" + result.Text + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds, "person");
                ListView1.DataSource = ds.Tables["person"];
                ListView1.DataBind();
                Label1.Visible = true;
                ListView1.Visible = true;

                foreach (var v in ListView1.Items)
                {
                    TextBox t = (TextBox)v.FindControl("TextBox5");
                    if (t != null)
                    {
                        //Response.Write(DateTime.Now.Date.ToShortDateString());
                        if (DateTime.Now.Date.CompareTo(Convert.ToDateTime(t.Text)) <= 0)
                        {
                            foreach (var v1 in ListView1.Items)
                            {
                                TextBox t1 = (TextBox)v1.FindControl("TextBox6");
                                if (t1 != null)
                                {
                                    string s = t1.Text;
                                    int i, j;
                                    if (s[3].Equals('-'))
                                    {
                                        i = Int32.Parse(s.Substring(0, 3));
                                        j = Int32.Parse(s.Substring(4));
                                    }
                                    else
                                    {
                                        i = Int32.Parse(s.Substring(0, 4));
                                        j = Int32.Parse(s.Substring(5));
                                    }
                                    int time = DateTime.Now.Hour * 100 + DateTime.Now.Minute;
                                    //Response.Write(i + "     " + j + "     " + DateTime.Now.TimeOfDay);
                                    if ((time >= i) && (time <= j))
                                        Button2.Visible = true;
                                    else
                                    {
                                        Label l = new Label();
                                        l.Text = "Sorry!!Your visit hours are between " + s + " Hrs only.";
                                        this.Controls.Add(l);
                                    }

                                }

                            }
                        }
                        else
                        {
                            Label l = new Label();
                            l.Text = "Sorry!!Your gatepass has expired on " +t.Text;
                            this.Controls.Add(l);
                        }
                    }

                }
            }
            else
            {
                Label1.Visible = false;
                ListView1.Visible = false;
                Button2.Visible = false;
                Label l = new Label();
                l.Text = "Scanning Error!!Try Again.";
                this.Controls.Add(l);
            }

        barcodeBitmap.Dispose();
        File.Delete(@"C:\a.jpg");
    }
catch (FileNotFoundException ex)
    {
            Label1.Visible = false;
            ListView1.Visible = false;
            Button2.Visible = false;
            Label l = new Label();
            l.Text = "No Snapshot exists";
            this.Controls.Add(l);
    }

        }
}