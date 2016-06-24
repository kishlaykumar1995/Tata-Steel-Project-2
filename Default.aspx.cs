using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
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

        var barcodeBitmap = (Bitmap)Bitmap.FromFile(@"C:\Users\kishl_000\OneDrive\a.jpg");
        // detect and decode the barcode inside the bitmap
        var result = reader1.Decode(barcodeBitmap);
        // do something with the result
        if (result != null)
        {
            //txtDecoderType.Text = result.BarcodeFormat.ToString();
            Label1.Text = result.Text;
        }

        barcodeBitmap.Dispose();
        File.Delete(@"C:\Users\kishl_000\OneDrive\a.jpg");
    }
catch (FileNotFoundException ex)
    {
            Label l = new Label();
            l.Text = "No Snapshot exists";
            this.Controls.Add(l);
    }

        }
}