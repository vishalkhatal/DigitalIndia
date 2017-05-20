<%@ Page Title="Admin - Create Card" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="CreateCard.aspx.cs" Inherits="CreateCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<center>
<br /><br />

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

<br /><br />

    <asp:Button ID="Button1" runat="server" Font-Size="Large" Text="Create Card" 
        onclick="Button1_Click" />

<br /><br />

    <asp:Label ID="smsg" runat="server" Font-Size="Large" ForeColor="Red" Text=""></asp:Label>

<br /><br />
</center>
</asp:Content>

