<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
                <link rel="stylesheet" type="text/css" href="Content/bootstrap.css" />
    <style>
        .box{
            position:absolute;
            top:40%;
            left:40%
        }
        .image-container {
    position: absolute;
    left: 0px;
    top: 0px;
}


        body{
            margin: 0px;
            padding: 0px;
            background-color: cornsilk;
        }
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
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h1>
        <asp:Image ID="Image1" Width="100%" Height="100px" runat="server"  ImageUrl="~/Images/banner2.jpg"  BorderWidth="0px"  CssClass="image-container"/>
       </h1>
        <br />
        <br />
        <br />
        <br />
        <div class="box">
            <asp:Label ID="Label1" runat="server" Text="User ID: "></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="26px" Width="263px"></asp:TextBox>
        <br />
        <br />
            <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        &nbsp;<asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="26px" Width="263px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login"  CssClass="btn-class" Font-Names="Century"/>
        </div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
         <div class="modal-header">
       <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel">Error</h4>
      </div> 
      <div id="alertcontent" class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
    </div>
  </div>
    </div>
            <script src="Scripts/jquery-2.2.4.min.js"></script>
<script src="Scripts/bootstrap.js"></script>
<script>
    function comp(str) {
        alertcontent.innerHTML = str;
        $('#myModal').modal('show')                // initializes and invokes show immediately
    }
</script>
    </form>
</body>

</html>
