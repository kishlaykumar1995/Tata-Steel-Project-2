<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportsPage.aspx.cs" Inherits="ReportsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
             margin: 0px;
            padding: 0px;
            background-color: blanchedalmond;
        }
                .image-container {
    position: absolute;
    left: 0px;
    top: 0px;
}
                .DetailsPane {
                    position: absolute;
                    top: 30%;
                    left :40%;
                }
                .combobox{
                    padding: 10px;
                    margin-left: 20px;

                }
                .idbox{
                    padding: 6px;
                    margin-left: 58px;
                }
                .grid{
                    position: absolute;
                    top: 55%;
                    width: 100%;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div runat="server">
        <h1>
        <asp:Image ID="Image1" Width="100%" Height="100px" runat="server"  ImageUrl="~/Images/banner2.jpg"  BorderWidth="0px"  CssClass="image-container"/>
       </h1>
    <div class="DetailsPane">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva"  Text="Employee ID:"></asp:Label>
        <asp:TextBox ID="TextBox1" Padding="20px" Enabled="false" Text='<%#Session["eid"] %>' CssClass="idbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva" Text="Department Code:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="deptcode" CssClass="combobox" DataSourceID="SqlDataSource1"></asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="View Reports" OnClick="Button1_Click" />
        <br />
        <br />
    </div>
        <div class="grid">
        <asp:DataGrid runat="server" Width="100%" DataSourceID="SqlDataSource2" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundColumn HeaderText="gp_id" DataField="gp_id" />
                <asp:BoundColumn HeaderText="intime" DataField="intime" />
                <asp:BoundColumn HeaderText="inperson" DataField="inperson" />
                <asp:BoundColumn HeaderText="outtime" DataField="outtime" />
                <asp:BoundColumn HeaderText="outperson" DataField="outperson" />
                <asp:BoundColumn HeaderText="deptcode" DataField="deptcode" />
                <asp:BoundColumn HeaderText="visitor_out" DataField="visitor_out" />
            </Columns>
        </asp:DataGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand='<%# string.Format("select deptcode from emp_roles where e_id={0}" , Session["eid"]) %>' ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>

    </div>
    </form>
</body>
</html>
