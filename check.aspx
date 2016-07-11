<%@ Page Language="C#" AutoEventWireup="true" CodeFile="check.aspx.cs" Inherits="check" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>abc</title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>asdasdasd</h1>
        <br />
        <br />
                <asp:ImageButton ID="ImageButton1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
        <asp:RadioButton ID="RadioButton1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <!-- <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div> -->
      <div class="modal-body">
        Wrong Password
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
    function comp() {
        $('#myModal').modal('show')                // initializes and invokes show immediately
    }
</script>
    </form>
</body>
</html>
