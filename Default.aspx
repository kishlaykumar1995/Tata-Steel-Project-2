<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="demos_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .btn-class{
 display: inline-block;
 border:1px solid #c9ae34;
 color: #705D07;
 border-radius: 3px 3px 3px 3px;
 -webkit-border-radius: 3px 3px 3px 3px;
 -moz-border-radius: 3px 3px 3px 3px;
 font-family: 'SketchFlow Print';
 width: auto;
 height: auto;
 font-size: 16px;
 padding: 10px 40px;
 box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
 -moz-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
 -webkit-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
 text-shadow: 0 1px 0 #fff;
 background-image: linear-gradient(to top, #fce374, #fcdf5b);
 background-color: #fce374;
}
.btn-class:hover, .btn-class:active{
 border:1px solid #967d09;
 color: #705D07;
 box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d;
 -moz-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d;
 -webkit-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d;
 background-color: #fcdf5b;
}

        .auto-style1 {
            display: inline-block;
            border: 1px solid #c9ae34;
            color: #705D07;
            border-radius: 3px 3px 3px 3px;
            -webkit-border-radius: 3px 3px 3px 3px;
            -moz-border-radius: 3px 3px 3px 3px;
            font-family: 'SketchFlow Print';
            font-size: 16px;
            padding: 10px 40px;
            box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
            -moz-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
            -webkit-box-shadow: inset 0 1px 0 0 #fff6ce,inset 0 -1px 0 0 #e3c852,inset 0 0 0 1px #fce88d,0 2px 4px 0 #D4D4D4;
            text-shadow: 0 1px 0 #fff;
            background-image: url('linear-gradient(to%20top,%20#fce374, #fcdf5b)');
            background-color: #fce374;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <script src="webcam.js"></script>

    <div runat="server" id="my_camera" style="width:1280px; height:720px;"></div>
    <div id="my_result"></div>

    <script type="text/javascript">

        Webcam.set({
            width: 1280,
            height: 720,
            dest_width: 1280,
            dest_height: 720,
            image_format: 'jpeg',
            jpeg_quality: 90,
            force_flash: false,
            flip_horiz: true,
            fps: 45
        });

        // Attach camera here
        Webcam.attach( '#my_camera' );

        

        function take_snapshot() {            
            Webcam.snap(function (data_uri) {
                document.getElementById('my_result').innerHTML = '<a id="apple" download=\'a.jpg\' href=\'' + data_uri + '\'></a>';
                document.getElementById('apple').click();
             //   document.getElementById("my_camera").hidden = true;
            });
        }
     

        


    </script>

        <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="captBtn" runat="server"  Text="Snap"  OnClientClick="javascript:void(take_snapshot())" Height="44px" Width="137px" CssClass="btn-class" Font-Bold="True" />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Scan" OnClick="Button1_Click" Height="44px" Width="137px" CssClass="btn-class" Font-Size="Medium" Font-Bold="True" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Person Details" Font-Names="Georgia" Font-Size="X-Large" ForeColor="Red" Visible="False"></asp:Label>
        
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <asp:Table BorderWidth="20px" runat="server" CellPadding="10" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell Font-Size="X-Large">Gatepass ID:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox1" Font-Size="X-Large" runat="server" Enabled="false" Text='<%# Bind("p_id") %>'></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Font-Size="X-Large">Name:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox2" Font-Size="X-Large" runat="server" Enabled="false" Text='<%# Bind("name") %>'></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="table">
                        <asp:TableCell Font-Size="X-Large">DeptCode:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox3" Font-Size="X-Large" runat="server" Enabled="false" Text='<%# Bind("deptcode") %>'></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="table">
                        <asp:TableCell Font-Size="X-Large">Issued On:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox4" Font-Size="X-Large" runat="server" Text='<%# Eval("issued_on").ToString().Substring(0,10) %>' Enabled="false"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="table">
                        <asp:TableCell Font-Size="X-Large">Valid Till:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("valid_till").ToString().Substring(0,10) %>' Enabled="false" Font-Size="X-Large"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="table">
                        <asp:TableCell Font-Size="X-Large">Visit Hours:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox6" Font-Size="X-Large" Text='<%# string.Format("{0}-{1}", Eval("perm_intime"), Eval("perm_outtime")) %>' runat="server" Enabled="false"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>

                </asp:Table>
            </ItemTemplate>
        </asp:ListView>
        <br />
        <br />
        
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" CssClass="auto-style1" Font-Names="Algerian" Height="43px" Text="IN" Visible="False" Width="109px" />
        
        <br />
        <br />
        
    </div>
    </form>
</body>
</html>
