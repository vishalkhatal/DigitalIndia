<%@ Page Title="User - Profile Submission" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SubmitProfile.aspx.cs" Inherits="SubmitProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<br /><br />

<table align="left" width="80%">
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="App Id" Font-Size="Small" 
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
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Mail Id" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtMail" runat="server" Width="286px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtUN"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    

    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Proof Image" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" Width="365px" />
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
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Verify Image" 
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
        <asp:Label ID="smsg" runat="server" Font-Size="Large" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
 </table>



</asp:Content>

