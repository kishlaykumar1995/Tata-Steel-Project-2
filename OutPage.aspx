<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OutPage.aspx.cs" Inherits="OutPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                body{
            margin: 0px;
            padding: 0px;
            background-color: cornsilk;
        }


                .btn-class{
                    margin-top:20px;
                    margin-left: 130px;
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


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    	<div id="my_camera"></div>
        <div id="apple"></div>
        <asp:Button ID="Button1" runat="server" Text="Snap" CssClass="btn-class" OnClientClick="take_snapshot()"/>
        <asp:Button ID="Button2" runat="server" Text="Scan" CssClass="btn-class" OnClick="Button2_Click"/>
        
        	<!-- First, include the Webcam.js JavaScript Library -->
	<script type="text/javascript" src="webcam.js"></script>
	
	<!-- Configure a few settings and attach camera -->
	<script type="text/javascript">
		Webcam.set({
			width: 1280,
			height: 720,
			image_format: 'jpeg',
			jpeg_quality: 90
		});
		Webcam.attach('#my_camera');
	</script>
 




        	<script type="text/javascript">

		function take_snapshot() {
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				// display results in page
				document.getElementById('apple').innerHTML = 
					'<a id="result" download="a.jpg" href="' + data_uri + '"/>';
				document.getElementById('result').click();
			});
		}
	</script>
    </div>
    </form>
</body>
</html>
