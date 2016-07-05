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
            Label1.Visible = false;
            ListView1.Visible = false;
            Button2.Visible = false;
            IBarcodeReader reader1 = new BarcodeReader();
            // load a bitmap            
            var barcodeBitmap = (Bitmap)Bitmap.FromFile(@"C:\a.jpg");
         
           /* 
            barcodeBitmap.RotateFlip(RotateFlipType.RotateNoneFlipX);
            barcodeBitmap.Save("c:\\a.jpg");
            barcodeBitmap.Dispose();
            barcodeBitmap = (Bitmap)Bitmap.FromFile(@"C:\a.jpg");
          */

            // detect and decode the barcode inside the bitmap
            var result = reader1.Decode(barcodeBitmap);
            // do something with the result
            if (result != null)
            {
                System.Windows.Forms.MessageBox.Show(result.Text);
                Session["gp_id"] = result.Text;
                //txtDecoderType.Text = result.BarcodeFormat.ToString();

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
                con.Open();

                SqlDataAdapter ad = new SqlDataAdapter("select * from visitor where gp_id='" + result.Text + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds, "person");
                ad.Dispose();
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
                                    if(s[1].Equals('-'))
                                    {
                                        i = Int32.Parse(s.Substring(0, 1));
                                        j = Int32.Parse(s.Substring(2));
                                    }
                                    else if (s[2].Equals('-'))
                                    {
                                        i = Int32.Parse(s.Substring(0, 2));
                                        j = Int32.Parse(s.Substring(3));
                                    }
                                    else if (s[3].Equals('-'))
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
                                    {
                                        if(!notOut(con,result.Text))
                                        {
                                            Button2.Visible = true;
                                        }
                                        
                                        else
                                        {
                                            Label l = new Label();
                                            l.Attributes.Add("style", "font-size:30px; color:Red;");
                                            l.Text = "You have not checked out previously.";
                                            this.Controls.Add(l);
                                        }
                                    }
                                        
                                    else
                                    {
                                        Label l = new Label();
                                        l.Attributes.Add("style", "font-size:30px; color:Red;");
                                        l.Text = "Sorry!!Your visit hours are between " + s + " Hrs only.";
                                        this.Controls.Add(l);
                                    }

                                }

                            }
                        }
                        else
                        {
                            Label l = new Label();
                            l.Attributes.Add("style", "font-size:30px; color:Red;");
                            l.Text = "Sorry!!Your gatepass has expired on " +t.Text;
                            this.Controls.Add(l);
                        }
                    }

                }
            }
            else
            {
                Label l = new Label();
                l.Attributes.Add("style", "font-size:30px; color:Red;");
                l.Text = "Scanning Error!!Try Again.";
                this.Controls.Add(l);
            }

        barcodeBitmap.Dispose();
        File.Delete(@"C:\a.jpg");
            
    }
catch (FileNotFoundException)
    {
            Label1.Visible = false;
            ListView1.Visible = false;
            Button2.Visible = false;
            Label l = new Label();
            l.Text = "No Snapshot exists";
            this.Controls.Add(l);
    }

        }

    private bool notOut(SqlConnection con,string id)
    {
        SqlDataAdapter ad = new SqlDataAdapter("select * from log_records where gp_id='" + id + "'", con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        DataTable dt = ds.Tables[0];
        int x = 0;
        if (dt.Rows.Count == 0)
            return false;
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (!(bool)dt.Rows[i]["visitor_out"])
                    x++;
            }
            if (x == 0)
                return false;
            else
                return true;
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int dpt = 0;
        foreach (var v in ListView1.Items)
        {
            TextBox t = (TextBox)v.FindControl("TextBox3");
            if (t != null)
            {
                dpt = Int32.Parse(t.Text);
            }
        }


        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr1"].ConnectionString);
        con.Open();
        string s = "select valid_till from emp_roles where role='I/O' and e_id = " + Session["eid"] + " and deptcode=" + dpt;
        //Response.Write(s);
        SqlDataAdapter ad = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        ad.Dispose();
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            Label l = new Label();
            l.Attributes.Add("style", "font-size:30px; color:Red;");
            l.Text = "Dept Inaccessible by the current employee";
            this.Controls.Add(l);
        }
        else
        {
            if (DateTime.Now.CompareTo(Convert.ToDateTime(dt.Rows[0]["valid_till"])) < 0)
            {
                //DateTime d = (DateTime)dt.Rows[0]["valid_till"];
                //Response.Write(d);
                //Response.Redirect("Default.aspx");
                int time = DateTime.Now.Hour * 100 + DateTime.Now.Minute;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into log_records values('" + Session["gp_id"] + "','" + DateTime.Now.TimeOfDay.ToString() + "'," + Session["eid"] + ",null,null," + dpt + ",1,0)";
                Response.Write(cmd.CommandText);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You have successfully Checked-In'); window.location = 'HomePage.aspx'", true);
               // Response.Redirect("HomePage.aspx");
            }
            else
            {
                Label l = new Label();
                l.Attributes.Add("style", "font-size:30px; color:Red;");
                l.Text = "Access for current employee has expired";
                this.Controls.Add(l);
            }
        }
        
    }
}