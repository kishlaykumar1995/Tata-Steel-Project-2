<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="childPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" Runat="Server">
    HomePage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeadCSS" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Content/HomePage.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" Runat="Server">

        <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="padding-left: 10px;padding-right: 10px;">
       <!--  <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4> 
      </div> -->
          
          <div class="form-group" style="margin-top: 12px;">
            <label for="recipient-name" class="control-label">Enter Safety ID:</label>
            <input type="text" class="form-control" id="safety-id" />
          </div>
            
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="report_click()">Check</button>
      </div>
    </div>
    </div>
  </div>

            <asp:Button ID="Button1" runat="server" Text="Sign Out"  BackColor="Transparent"  CssClass="myButton" OnClick="Button1_Click"/>
    <div class="centered">
            <div>
                <a id="Link1" href="In.aspx" class="myButton1">IN</a>
                <a href="Out.aspx" class="myButton1">OUT</a>
            </div>
            <a href="Reports.aspx" class="myButton2">View Reports</a>
        <br />
            <a onclick="comp('Enter Safety ID')" class="myButton2">View Reports</a>
        </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" Runat="Server">
    <script>
        function comp(str1) {
           // myModalLabel.innerHTML = str1;
            $('#myModal').modal('show')                // initializes and invokes show immediately
        }
        function report_click()
        {
            var tlink = document.getElementById('safety-id').value;
            window.location = "Report2.aspx?q=" + tlink
        }

    </script>

</asp:Content>

