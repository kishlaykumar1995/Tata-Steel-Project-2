<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="In.aspx.cs" Inherits="In" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" Runat="Server">
    InPage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeadCSS" Runat="Server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Content/In.css" />
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
    
    <div runat="server" class="cam" id="my_camera" style="width:1280px; height:720px;"></div>
    <div id="my_result"></div>

    <br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="captBtn" runat="server"  Text="Snap"  OnClientClick="javascript:void(take_snapshot())" Height="44px" Width="137px" CssClass="btn-class" Font-Bold="True" />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Scan" OnClick="Button1_Click" Height="44px" Width="137px" CssClass="btn-class" Font-Size="Medium" Font-Bold="True" />
        <br />        
        <br />
  <!--      <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="rbl" RepeatDirection="Horizontal" CellPadding="30" Font-Size="X-Large" >
            <asp:ListItem Text="QR Code" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Barcode"></asp:ListItem>
        </asp:RadioButtonList>
        <br /> -->
        <asp:Label ID="Label1" runat="server" Text="Person Details" Font-Names="Georgia" Font-Size="X-Large" ForeColor="Red" Visible="False"></asp:Label>
        
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <asp:Table BorderWidth="15px" BorderColor="#cc66ff" runat="server" CellPadding="10" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell Font-Size="X-Large">Gatepass ID:</asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox1" Font-Size="X-Large" runat="server" Enabled="false" Text='<%# Bind("gp_id") %>'></asp:TextBox>
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
        <asp:Button ID="Button2" runat="server" CssClass="auto-style1" Font-Names="Algerian" Height="43px" Text="IN" Visible="False" Width="109px" OnClick="Button2_Click" />
        
        <br />
        <br />
        

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" Runat="Server">


            <script src="webcam.js"></script>

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
        Webcam.attach( '.cam' );
   

        function take_snapshot() {            
            Webcam.snap(function (data_uri) {
                document.getElementById('my_result').innerHTML = '<a id="apple" download=\'a.jpg\' href=\'' + data_uri + '\'></a>';
                document.getElementById('apple').click();
             //   document.getElementById("my_camera").hidden = true;
            });
        }
     
        function comp(str, str1) {
            myModalLabel.innerHTML = str1;
            alertcontent.innerHTML = str;
            $('#myModal').modal('show')                // initializes and invokes show immediately
        }

    </script>


</asp:Content>

