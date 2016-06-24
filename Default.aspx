<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="demos_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .scnBtn {
            align-self: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <script src="webcam.js"></script>

    <div runat="server" id="my_camera" style="width:320px; height:240px;"></div>
                <a href="javascript:void(take_snapshot())">Take Snapshot</a>
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

        <asp:Button ID="Button1" runat="server" Text="Scan" OnClick="Button1_Click" BorderStyle="Ridge" Font-Names="SketchFlow Print" Height="37px" Width="89px" CssClass="scnBtn" />
        
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        
        <br />
        <br />
        
    </div>
    </form>
</body>
</html>
