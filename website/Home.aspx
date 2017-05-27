<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="_Home" %>


    <asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
        <h2>Welcome</h2>
      </asp:Content>

<asp:Content ID="intro" ContentPlaceHolderID="MainContent" runat="server">
      <link rel="stylesheet" href="~/Styles/main.css" type="text/css" />
   
&nbsp;<asp:Label ID="Label3" runat="server" 
              style="z-index: 1; left: 539px; top: 494px; position: absolute; bottom: 339px;" 
              Text="Login"></asp:Label>
      <p>
      
<asp:TextBox ID="txtPwd" runat="server" Width="236px" Height="24px" 
            TextMode="Password" placeholder="Password" 
              style="z-index: 1; left: 438px; top: 554px; position: absolute"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
              ErrorMessage="*" ControlToValidate="txtMailid" 
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
              style="z-index: 1; left: 677px; top: 516px; position: absolute">
        </asp:RegularExpressionValidator>


          <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
              style="z-index: 1; left: 449px; top: 589px; position: absolute" 
              Text="Register" />


      </p>
           <asp:TextBox ID="txtMailid" runat="server" Width="236px" Height="24px" 
          placeholder="Username" 
          style="z-index: 1; left: 437px; top: 518px; position: absolute"></asp:TextBox>&nbsp;&nbsp;
            &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
          ErrorMessage="*" ControlToValidate="txtPwd" 
          style="z-index: 1; left: 676px; top: 555px; position: absolute">
        </asp:RequiredFieldValidator>     
		<asp:button ID="Login" runat="server" Text="Login" 
    onclick="Login_Click" 
    style="z-index: 1; left: 570px; top: 589px; position: absolute; width: 60px" />

		<br />

		<br />
      <br />
      <br />
      <br />
		<asp:Label ID="smsg" runat="server" Font-Size="Small" ForeColor="Black" 
          style="z-index: 1; left: 449px; top: 620px; position: absolute"></asp:Label>

</asp:Content>

    
     <asp:Content ID="Content1" runat="server" 
    contentplaceholderid="Stylesheet">
         <style type="text/css">
             .register
             {
                 z-index: 1;
                 left: 454px;
                 top: 597px;
                 position: absolute;
             }
             .button
             {
                 z-index: 1;
                 left: 570px;
                 top: 596px;
                 position: absolute;
                 width: 58px;
             }
         </style>
</asp:Content>


    
     