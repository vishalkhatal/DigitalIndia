<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="NewUser.aspx.cs" Inherits="NewUser" Title="New User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<br /><br />

<table align="left" width="80%">
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Display Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtUN" runat="server" Width="286px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtUN"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    

    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="E-Mail Id<br>(This will be Username)" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtMailid" runat="server" Width="286px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtMailid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </td>    
    </tr>
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>
    

    <tr>
    <td align="right" width="20%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Password" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtPwd" runat="server" Width="286px" Height="24px" 
            TextMode="Password" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" ControlToCompare="txtPwd" ControlToValidate="txtRPwd"></asp:CompareValidator>
    </td>    
    </tr>
    
    <tr>
    <td width="40%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Re-Password" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtRPwd" runat="server" Width="286px" Height="24px" 
            TextMode="Password" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>    
    </tr>
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:30px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 30px;">  &nbsp;</td>    
    </tr>
    
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <div align="left">
        &nbsp;<asp:Button ID="Button1" runat="server" Text="   Create User   " 
            OnClick="Button1_Click" Height="30px" Width="146px" />
        </div>
    </td>    
    </tr>
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
        <asp:Label ID="smsg" runat="server" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
 </table>


</asp:Content>
