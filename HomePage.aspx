<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

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
        .image-container {
    position: absolute;
    left: 0px;
    top: 0px;
}


.myButton {
    
    position: absolute;
    left: 87%;
    	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #579e33), color-stop(1, #72b352));
	background:-moz-linear-gradient(top, #579e33 5%, #72b352 100%);
	background:-webkit-linear-gradient(top, #579e33 5%, #72b352 100%);
	background:-o-linear-gradient(top, #579e33 5%, #72b352 100%);
	background:-ms-linear-gradient(top, #579e33 5%, #72b352 100%);
	background:linear-gradient(to bottom, #579e33 5%, #72b352 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#579e33', endColorstr='#72b352',GradientType=0);
	background-color:#579e33;
	-moz-border-radius:12px;
	-webkit-border-radius:12px;
	border-radius:12px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:11px 23px;
	text-decoration:none;
	text-shadow:0px -1px 0px #70cc33;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #72b352), color-stop(1, #579e33));
	background:-moz-linear-gradient(top, #72b352 5%, #579e33 100%);
	background:-webkit-linear-gradient(top, #72b352 5%, #579e33 100%);
	background:-o-linear-gradient(top, #72b352 5%, #579e33 100%);
	background:-ms-linear-gradient(top, #72b352 5%, #579e33 100%);
	background:linear-gradient(to bottom, #72b352 5%, #579e33 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#72b352', endColorstr='#579e33',GradientType=0);
	background-color:#72b352;
}

.myButton1 {
	-moz-box-shadow: 3px 4px 0px 0px #baa60f;
	-webkit-box-shadow: 3px 4px 0px 0px #baa60f;
	box-shadow: 3px 4px 0px 0px #baa60f;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffdd00), color-stop(1, #f0cd1d));
	background:-moz-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-webkit-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-o-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-ms-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:linear-gradient(to bottom, #ffdd00 5%, #f0cd1d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd00', endColorstr='#f0cd1d',GradientType=0);
	background-color:#ffdd00;
	-moz-border-radius:14px;
	-webkit-border-radius:14px;
	border-radius:14px;
	display:inline-block;
	cursor:pointer;
	color:#665f66;
	font-family:'Monotype Corsiva';
	font-size:24px;
	padding:12px 44px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e0ca26;
}
.myButton1:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f0cd1d), color-stop(1, #ffdd00));
	background:-moz-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-webkit-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-o-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-ms-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:linear-gradient(to bottom, #f0cd1d 5%, #ffdd00 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f0cd1d', endColorstr='#ffdd00',GradientType=0);
	background-color:#f0cd1d;
}
.myButton1:active {
	position:relative;
	top:1px;
}


.myButton2 {
    margin-top:8px;
	-moz-box-shadow: 3px 4px 0px 0px #baa60f;
	-webkit-box-shadow: 3px 4px 0px 0px #baa60f;
	box-shadow: 3px 4px 0px 0px #baa60f;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffdd00), color-stop(1, #f0cd1d));
	background:-moz-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-webkit-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-o-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:-ms-linear-gradient(top, #ffdd00 5%, #f0cd1d 100%);
	background:linear-gradient(to bottom, #ffdd00 5%, #f0cd1d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd00', endColorstr='#f0cd1d',GradientType=0);
	background-color:#ffdd00;
	-moz-border-radius:14px;
	-webkit-border-radius:14px;
	border-radius:14px;
	display:inline-block;
	cursor:pointer;
	color:#665f66;
	font-family:'Monotype Corsiva';
	font-size:24px;
	padding:12px 67px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e0ca26;
}
.myButton2:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f0cd1d), color-stop(1, #ffdd00));
	background:-moz-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-webkit-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-o-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:-ms-linear-gradient(top, #f0cd1d 5%, #ffdd00 100%);
	background:linear-gradient(to bottom, #f0cd1d 5%, #ffdd00 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f0cd1d', endColorstr='#ffdd00',GradientType=0);
	background-color:#f0cd1d;
}
.myButton2:active {
	position:relative;
	top:1px;
}



.centered {
    position:absolute;
    top:45%;
    left:45%
}


        .auto-style1 {
            margin-top: 6px;
            -moz-box-shadow: 3px 4px 0px 0px #baa60f;
            -webkit-box-shadow: 3px 4px 0px 0px #baa60f;
            box-shadow: 3px 4px 0px 0px #baa60f;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdd00', endColorstr='#f0cd1d',GradientType=0);
            background-color: #ffdd00;
            -moz-border-radius: 14px;
            -webkit-border-radius: 14px;
            border-radius: 14px;
            display: inline-block;
            cursor: pointer;
            color: #665f66;
            font-family: 'Monotype Corsiva';
            font-size: 24px;
            padding: 12px 68px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #e0ca26;
            width: 163px;
        }


    </style>
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h1>
        <asp:Image ID="Image1" Width="100%" Height="100px" runat="server"  ImageUrl="~/Images/banner2.jpg"  BorderWidth="0px"  CssClass="image-container"/>
        <asp:Button ID="Button1" runat="server" Text="Sign Out"  BackColor="Transparent"  CssClass="myButton" OnClick="Button1_Click"/>
     </h1>
        <div class="centered">
            <div>
                <a id="Link1" href="InPage.aspx" class="myButton1">IN</a>
                <a href="OutPage.aspx" class="myButton1">OUT</a>
            </div>
            <a href="ReportsPage.aspx" class="myButton2">View Reports</a>
        </div>
    </div>
    </form>
</body>
</html>
