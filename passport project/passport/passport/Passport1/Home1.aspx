<%@ Page Title="Welcome to Passport Application Website" Language="C#" MasterPageFile="~/Main1.master" AutoEventWireup="true" CodeFile="Home1.aspx.cs" Inherits="Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table width="100%">
<tr>

<td width="60%" valign="middle">

<h3>Welcome to Passport Application Website</h3>
<br />

</td>

<td valign="middle" width="40%">
<br /><br /><br />
<table align="right" width="100%">
    
    
    <tr>
    <td align="right" width="30%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="E-Mail Id" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtMailid" runat="server" Width="236px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtMailid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
    </td>    
    </tr>
    
    
    <tr>
    <td width="30%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>
    

    <tr>
    <td align="right" width="30%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Password" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtPwd" runat="server" Width="236px" Height="24px" 
            TextMode="Password" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
            &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPwd">
        </asp:RequiredFieldValidator>        
    </td>    
    </tr>
    
    <tr>
    <td width="30%" bgcolor="#ffffff" style="color:Blue;height:30px"> </td>    
    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 30px;">  &nbsp;</td>    
    </tr>
            
    <tr>
    <td align="right" width="30%" bgcolor="#ffffff" style="color:Blue;height:20px"> 
        
    </td>    

    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <div align="left">
        &nbsp;<asp:Button ID="Button1" runat="server" Text="   Sign In   " 
            OnClick="Button1_Click" Height="30px" Width="120px" Font-Size="Large" />
            &nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Large" 
            NavigateUrl="~/NewUser.aspx">New User</asp:HyperLink>
        </div>
        
    </td>    
    </tr>
    
    <tr>
    <td width="30%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="70%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>
    
    
    <tr>
    <td colspan="2" width="100%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
        <asp:Label ID="smsg" runat="server" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
 </table>

</td>

</tr>
</table>

</asp:Content>

