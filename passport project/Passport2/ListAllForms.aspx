<%@ Page Title="User - Listing All Form(s)" Language="C#" MasterPageFile="~/Site3.master" AutoEventWireup="true" CodeFile="ListAllForms.aspx.cs" Inherits="ListAllForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<table width="100%" border="0" cellpadding="10" cellspacing="10">

<tr>
<td>
<div>
    <asp:Label ID="errmsg" runat="server" Font-Size="Large" Text="Message" ForeColor="Red"></asp:Label>
</div>
</td>
</tr>

<tr>
<td>
<table align="left" width="100%">
    
        
    <tr>
    <td colspan="2" width="100%" align="left" bgcolor="#ffffff"> 
    
        <asp:GridView ID="GridView1" runat="server" Height="100%" Width="100%" 
            AutoGenerateColumns="False" EnableModelValidation="True" 
            onrowdeleting="GridView1_RowDeleting" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" CellPadding="4" 
            ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
        
            <asp:CommandField DeleteText="   Delete   " 
                ShowDeleteButton="True" ButtonType="Button" />
        
        
                
        <asp:TemplateField HeaderText="App Id" Visible="true">        
        <ItemTemplate>
            <a href='ViewDetails.aspx?appid=<%# Eval("appid") %>'><asp:Label ID="appid" runat="server" Text='<%# Eval("appid") %>'></asp:Label></a>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="App Type">        
        <ItemTemplate>         
            <%# Eval("apptype") %>
        </ItemTemplate>
        </asp:TemplateField>               

        <asp:TemplateField HeaderText="Applicant Name">        
        <ItemTemplate>         
            <%# Eval("fname") %> &nbsp; <%# Eval("lname") %>
        </ItemTemplate>
        </asp:TemplateField>               
        
        <asp:TemplateField HeaderText="Sub.Date">        
        <ItemTemplate>
        <%# Eval("appsdt").ToString().Replace("12.00.00 AM","") %>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Status">        
        <ItemTemplate>
        <%# Eval("appstatus") %>
        </ItemTemplate>
        </asp:TemplateField>               

        <asp:TemplateField HeaderText="">        
        <ItemTemplate>
        <a href='<%# Eval("dwn") %>'>Download</a>
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

