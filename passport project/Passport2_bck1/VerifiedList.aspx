﻿<%@ Page Title="Admin - Verified App List" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="VerifiedList.aspx.cs" Inherits="VerifiedList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<table width="100%" border="0" cellpadding="10" cellspacing="10">

<tr>
<td>
<div>
Select Type : &nbsp;&nbsp;
    <asp:DropDownList ID="ddlType" runat="server" Height="24px" Width="150px">
    <asp:ListItem>Passport</asp:ListItem>
    <asp:ListItem>Id Card</asp:ListItem>
    <asp:ListItem>Pan Card</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Filter" Font-Size="Large" Height="30px" 
        Width="121px" onclick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Show All" Font-Size="Large" Height="30px" 
        Width="135px" onclick="Button2_Click" />
    <br /><br />
    <asp:Label ID="errmsg" runat="server" Text="Message" Font-Size="Large" ForeColor="Red"></asp:Label>
</div>
</td>
</tr>

<tr>
<td>
<table align="left" width="100%">
    

        
    <tr>
    <td colspan="2" width="100%" align="left" bgcolor="#ffffff"> 
    
        <asp:GridView ID="GridView1" runat="server" Height="100%" Width="100%" 
            AutoGenerateColumns="False" 
            AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" CellPadding="4" 
            ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
        
        <asp:TemplateField HeaderText="App Id" Visible="true">        
        <ItemTemplate>
            <a href='CreateCard.aspx?appid=<%# Eval("appid") %>'><asp:Label ID="appid" runat="server" Text='<%# Eval("appid") %>'></asp:Label></a>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="App Type">        
        <ItemTemplate>
        <%# Eval("apptype") %>
        </ItemTemplate>
        </asp:TemplateField>               

        <asp:TemplateField HeaderText="Username">        
        <ItemTemplate>
        <%# Eval("mailid") %>
        </ItemTemplate>
        </asp:TemplateField>               

        <asp:TemplateField HeaderText="Verify Date">        
        <ItemTemplate>
        <%# Eval("appvdt") %>
        </ItemTemplate>
        </asp:TemplateField>               

        </Columns>

            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

            <PagerSettings Position="TopAndBottom" />
            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#284775" 
                ForeColor="White" />

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

        </asp:GridView>

    </td>    
    
    </tr>    
    
 </table>

</td>
 </tr>
</table>


</asp:Content>

