<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Out.aspx.cs" Inherits="Out" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" Runat="Server">
    OutPage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeadCSS" Runat="Server">
        <link rel="stylesheet" type="text/css" href="Content/Bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Content/Out.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" Runat="Server">
     <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
         <div class="modal-header">
       <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel">Modal title</h4> 
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
      <asp:ImageButton  ImageUrl="~/Images/homebutton.png" runat="server" CssClass="homebutton" OnClick="Unnamed1_Click" />

    <div id="my_camera" class="cam"></div>
        <div id="apple"></div>
        <asp:Button ID="Button1" runat="server" Text="Snap" CssClass="btn-class" OnClientClick="take_snapshot()"/>
        <asp:Button ID="Button2" runat="server" Text="Scan" CssClass="btn-class" OnClick="Button2_Click"/>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" Runat="Server">
    <script type="text/javascript" src="webcam.js"></script>
	
	<!-- Configure a few settings and attach camera -->
	<script type="text/javascript">
		Webcam.set({
			width: 1280,
			height: 720,
			image_format: 'jpeg',
			jpeg_quality: 90,
			force_flash: false,
			flip_horiz: true,
			fps: 45
		});
		Webcam.attach('.cam');

		function take_snapshot() {
		    // take snapshot and get image data
		    Webcam.snap(function (data_uri) {
		        // display results in page
		        document.getElementById('apple').innerHTML =
					'<a id="result" download="a.jpg" href="' + data_uri + '"/>';
		        document.getElementById('result').click();
		    });
		}

		function comp(str, str1) {
		    myModalLabel.innerHTML = str1;
		    alertcontent.innerHTML = str;
		    $('#myModal').modal('show')                // initializes and invokes show immediately
		}

	</script>
</asp:Content>

