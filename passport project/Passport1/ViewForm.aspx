<%@ Page Title="Admin - View Form Details" Language="C#" MasterPageFile="~/Main3.master" AutoEventWireup="true" CodeFile="ViewForm.aspx.cs" Inherits="ViewForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br />
<center>
    <asp:Repeater ID="Repeater1" runat="server">
    
    <HeaderTemplate>
    <table border="0" cellpadding="5" cellspacing="5">
    <tr><th colspan="2">Application Details</th></tr>
    </HeaderTemplate>
    
    <ItemTemplate>
    <tr>
    <td><%# Eval("cn") %></td>
    <td><%# Eval("cv") %></td>
    </tr> 
    </ItemTemplate>

    <FooterTemplate>
    </table>
    </FooterTemplate>
    
    </asp:Repeater>

    <br /><br />

    <asp:Button ID="Button1" runat="server" Text="Verify Form" Font-Size="Large" 
        Height="32px" Width="163px" onclick="Button1_Click" />

    <br /><br />

    <asp:Label ID="smsg" runat="server" Text=""></asp:Label>

</center>

</asp:Content>

