<%@ Page Title="User - Application Form" Language="C#" MasterPageFile="~/Site3.master" AutoEventWireup="true" CodeFile="AppForm1.aspx.cs" Inherits="AppForm1" %>

<asp:Content ID="intro" ContentPlaceHolderID="MainContent" Runat="Server">

<table align="left" style="width: 97%">       
    
    <tr>
    <td colspan="2" align="right" bgcolor="#ffffff" style="color:Blue; height: 20px;">
        <br /><asp:Label ID="smsg" runat="server" Font-Size="Large" ForeColor="Black"></asp:Label>
    </td>    
    </tr>
    
    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>
    
    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue;" class="style2">
    <asp:Label ID="Label11" runat="server" Text="Application Type" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
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
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    


    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue;" class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="First Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:TextBox ID="txtFN" runat="server" Width="164px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtFN" 
            
            style="z-index: 1; left: 588px; top: 615px; position: absolute; width: 5px;"></asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    


    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue;" class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label9" runat="server" Text="Middle Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:TextBox ID="txtFMN" runat="server" Width="165px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="*" ControlToValidate="txtFMN" 
            style="z-index: 1; left: 589px; top: 669px; position: absolute"></asp:RequiredFieldValidator>
    </td>    
    </tr>


     <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr> 

    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue;" class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="Last Name" Font-Size="Small" 
            ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:TextBox ID="txtLN" runat="server" Width="165px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="*" ControlToValidate="txtLN" 
            style="z-index: 1; left: 590px; top: 723px; position: absolute"></asp:RequiredFieldValidator>
    </td>    
    </tr>

       

    
    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    


    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue;" class="style2">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Gender" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
    <asp:RadioButtonList ID="ddlGender" runat="server" RepeatDirection="Horizontal" 
            Width="163px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>

        
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
        
    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label10" runat="server" Text="Date Of Birth" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
            Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar>
        <asp:DropDownList ID="ddlDay" runat="server" Height="27px" Width="60px" 
            Visible="False">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:DropDownList ID="ddlMon" runat="server" Height="27px" Width="80px" 
            Visible="False">
        </asp:DropDownList>&nbsp;&nbsp;
        <asp:DropDownList ID="ddlYear" runat="server" Height="27px" Width="80px" 
            Visible="False">
        </asp:DropDownList>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> &nbsp;</td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Address" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:TextBox ID="txtAddr" runat="server" Width="238px" Height="78px" 
            BorderColor="Black" BorderStyle="Solid" TextMode="MultiLine"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="txtAddr" 
            style="z-index: 1; left: 499px; top: 1114px; position: absolute">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
    

    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="City" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:DropDownList ID="txtCity" runat="server">
            <asp:ListItem>Mumbai</asp:ListItem>
            <asp:ListItem>Nashik</asp:ListItem>
            <asp:ListItem>Nagpur</asp:ListItem>
            <asp:ListItem>Pune</asp:ListItem>
            <asp:ListItem>Delhi</asp:ListItem>
            <asp:ListItem>Bhopal</asp:ListItem>
            <asp:ListItem>Jaipur</asp:ListItem>
            <asp:ListItem>Banglore</asp:ListItem>
            <asp:ListItem>Akola</asp:ListItem>
            <asp:ListItem>Ahmednagar</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="txtCity">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Pincode" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:TextBox ID="txtPin" runat="server" Width="153px" Height="24px" 
            BorderColor="Black" BorderStyle="Solid"></asp:TextBox>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtPin">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    

    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="State" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:DropDownList ID="txtState" runat="server">
            <asp:ListItem>Madhya Pradesh</asp:ListItem>
            <asp:ListItem>Maharashtra</asp:ListItem>
            <asp:ListItem>Rajasthan</asp:ListItem>
            <asp:ListItem>Andhra Pradesh</asp:ListItem>
            <asp:ListItem>Uttar Pradesh</asp:ListItem>
            <asp:ListItem>Gujarat</asp:ListItem>
            <asp:ListItem>Goa</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="txtState">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
    
    <tr>
    <td align="right" bgcolor="#ffffff" style="color:Blue; " class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Select Photo" Font-Size="Small" ForeColor="Black"></asp:Label>
    </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    &nbsp;
        <asp:FileUpload ID="FileUpload1" runat="server" Width="326px" />&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="*" ControlToValidate="FileUpload1">
        </asp:RequiredFieldValidator>
    </td>    
    </tr>

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">  &nbsp;</td>    
    </tr>    
    

    <tr>
    <td bgcolor="#ffffff" style="color:Blue;" class="style2"> </td>    
    <td bgcolor="#ffffff" style="color:Blue; " class="style1">
    <div align="left">
        &nbsp;<asp:Button ID="Button1" runat="server" Text="   Create User   " 
            OnClick="Button1_Click" Height="30px" Width="146px" /><br /><br />
        </div>
    </td>    
    </tr>
        
 </table>



</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="Stylesheet">
    <style type="text/css">
        .style1
        {
            height: 20px;
            width: 91%;
        }
        .style2
        {
            height: 20px;
            width: 34%;
        }
    </style>
</asp:Content>


