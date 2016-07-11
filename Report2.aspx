<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report2.aspx.cs" Inherits="Report2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" Runat="Server">
    Individual Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeadCSS" Runat="Server">
        <link rel="stylesheet" type="text/css" href="Content/Report2.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpBody" Runat="Server">
    <asp:ImageButton  ImageUrl="~/Images/homebutton.png" runat="server" CssClass="homebutton" OnClick="Unnamed1_Click" />
            
    <div class="DetailsPane">
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva"  Text="Safety ID:"></asp:Label>
        <asp:TextBox ID="TextBox1" Padding="20px" Enabled="false" Text="" CssClass="idbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Font-Names="Monotype Corsiva" Text="Gatepass ID:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="gp_id" CssClass="combobox" DataSourceID="SqlDataSource1"></asp:DropDownList>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<% $ConnectionStrings:conStr1 %>'></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cpScripts" Runat="Server">
</asp:Content>

