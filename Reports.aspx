<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" Runat="Server">
    Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeadCSS" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/Reports.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" Runat="Server">

    <asp:ImageButton  ImageUrl="~/Images/homebutton.png" runat="server" CssClass="homebutton" OnClick="Unnamed1_Click" />
            
    <div class="DetailsPane">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva"  Text="Employee ID:"></asp:Label>
        <asp:TextBox ID="TextBox1" Padding="20px" Enabled="false" Text='<%#Session["eid"] %>' CssClass="idbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva" Text="Department Code:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" OnPreRender="DropDownList1_PreRender" DataTextField="deptcode" CssClass="combobox" DataSourceID="SqlDataSource1"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva" Text="From:"></asp:Label>
        <input runat="server" class="datep1" type="text" id="datepicker"/>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva" Text="To:"></asp:Label>
        <input runat="server" class="datep2" type="text" id="datepicker1"/>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="View Reports" OnClick="Button1_Click" />
        <br />
        <br />
    </div>


    <div class="grid">
        <asp:DataGrid runat="server" Width="100%" DataSourceID="SqlDataSource2" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundColumn HeaderText="ID" DataField="gp_id" />
                <asp:TemplateColumn HeaderText="InDate">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("indate").ToString().Substring(0,10) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateColumn>
                <asp:BoundColumn HeaderText="InTime" DataField="intime" />
                <asp:BoundColumn HeaderText="InPerson" DataField="inperson" />
                <asp:BoundColumn HeaderText="OutTime" DataField="outtime" />
                <asp:BoundColumn HeaderText="OutPerson" DataField="outperson" />
                <asp:BoundColumn HeaderText="Deptcode" DataField="deptcode" />
                <asp:BoundColumn HeaderText="Visitor_Out" DataField="visitor_out" />
            </Columns>
        </asp:DataGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="<%# string.Format(&quot;select deptcode from emp_roles where role='VR' and e_id={0}&quot; , Session[&quot;eid&quot;]) %>" ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" Runat="Server">
                <script>
        $(function() {
    $( ".datep1" ).datepicker();
  });
  </script>
        <script>
  $(function() {
    $( ".datep2" ).datepicker();
  });
    </script>
</asp:Content>

