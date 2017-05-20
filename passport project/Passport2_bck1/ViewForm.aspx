<%@ Page Title="Admin - View Form Details" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="ViewForm.aspx.cs" Inherits="ViewForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<br />
<center>

<table width="100%">

<tr>
<th colspan="2" align="left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="Button1" runat="server" ForeColor="Green" Font-Size="Large" 
        Text="Accept & Verify" onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="smsg" runat="server" ForeColor="Red" Font-Size="Large" Text=""></asp:Label>     
 </th>
</tr>

<tr>
<td colspan="2">&nbsp;</td>
</tr>


<tr>
<td width="70%" align="center">
<asp:DetailsView ID="DetailsView1" runat="server" Height="113px" Width="552px" 
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" GridLines="Horizontal">
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:DetailsView>
</td>

<td width="30%" valign="middle" align="center">    
    <asp:Image ID="Image1" runat="server" Width="250" Height="300" />
</td>
</tr>
</table>
    
</center>
<br /><br /><br /><br />
</asp:Content>

