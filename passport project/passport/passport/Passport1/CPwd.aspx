<%@ Page Title="User - Change Password" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="CPwd.aspx.cs" Inherits="CPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br /><br /><br />

<table border="1" align="center" width="50%">
    <tr>
    <td>


<table align="center" width="100%">
<tr>
<td>
<div class="form-box">

<table align="center" width="100%">    
    
    <tr>
    <td align="left" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    
        <asp:Label ID="Label3" runat="server" Text="New Password" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 25px;">
    &nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="220px" Height="24px" TextMode="Password" 
            BorderColor="#333333" BorderStyle="Solid"></asp:TextBox> 
        
    </td>    
    </tr>
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>   
    </td>    
    </tr>
    
    <tr>
    <td align="left" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    
        <asp:Label ID="Label1" runat="server" Text="Re-type Password" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 25px;">
    &nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="220px" Height="24px" TextMode="Password" 
            BorderColor="#333333" BorderStyle="Solid"></asp:TextBox> 
        
    </td>    
    </tr>
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>   
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both should be same" ControlToCompare="TextBox1" ControlToValidate="TextBox2"></asp:CompareValidator>
    </td>    
    </tr>
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <div align="left">
        &nbsp;<asp:Button ID="Button1" runat="server" Text="   Change Password   " 
            OnClick="Button1_Click" Width="151px" BorderColor="#333333" 
            BorderStyle="Solid" Height="32px" />
        </div>
    </td>    
    </tr>
    
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
        <br />
        <asp:Label ID="smsg" runat="server" Font-Size="Medium" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
 </table>

  </div>
</td>
</tr>
</table>

</td>
</tr>
</table>

</asp:Content>

