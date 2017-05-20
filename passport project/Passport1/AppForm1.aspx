<%@ Page Title="User - Application Form" Language="C#" MasterPageFile="~/Main2.master" AutoEventWireup="true" CodeFile="AppForm1.aspx.cs" Inherits="AppForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table align="left" width="80%">       
    
    <tr>
    <td colspan="2" align="right" width="100%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
        <br /><asp:Label ID="smsg" runat="server" Font-Size="Large" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label11" runat="server" Text="Application Type" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:DropDownList ID="ddlType" runat="server" Height="24px" Width="139px">
        <asp:ListItem>Select Type</asp:ListItem>
        <asp:ListItem>Passport</asp:ListItem>
        <asp:ListItem>Id Card</asp:ListItem>
        <asp:ListItem>Pan Card</asp:ListItem>
        </asp:DropDownList>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    


    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="First Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtFN" runat="server" Width="318px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtFN"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    

    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="Last Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtLN" runat="server" Width="321px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="*" ControlToValidate="txtLN"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    

    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label9" runat="server" Text="Father or Mother Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtFMN" runat="server" Width="322px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtFMN"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    


    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue;height:20px">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Gender" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:DropDownList ID="ddlGender" runat="server" Height="24px" Width="139px">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList>  
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
        
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label10" runat="server" Text="Date Of Birth" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:DropDownList ID="ddlDay" runat="server" Height="27px" Width="60px">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:DropDownList ID="ddlMon" runat="server" Height="27px" Width="80px">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:DropDownList ID="ddlYear" runat="server" Height="27px" Width="80px">
        </asp:DropDownList>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Address" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtAddr" runat="server" Width="327px" Height="78px" 
            BorderColor="Black" BorderStyle="Solid" TextMode="MultiLine"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtAddr">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    

    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="City" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtCity" runat="server" Width="330px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCity">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Pincode" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtPin" runat="server" Width="330px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtPin">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    

    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="State" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:TextBox ID="txtState" runat="server" Width="330px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="txtState">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" width="40%" bgcolor="#ffffff" style="color:Blue; height:20px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Select Photo" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td width="60%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    &nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" Width="326px" />&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="*" ControlToValidate="FileUpload1">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">  &nbsp;</td>    
    </tr>    
    

    <tr>
    <td width="20%" bgcolor="#ffffff" style="color:Blue;height:20px"> </td>    
    <td width="80%" bgcolor="#ffffff" style="color:Blue; height: 20px;">
    <div align="left">
        &nbsp;<asp:Button ID="Button1" runat="server" Text="   Create User   " 
            OnClick="Button1_Click" Height="30px" Width="146px" /><br /><br />
        </div>
    </td>    
    </tr>
        
 </table>



</asp:Content>

