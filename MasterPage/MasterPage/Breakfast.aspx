<%@ Page Title="Breakfast" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Breakfast.aspx.cs" Inherits="Breakfast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Breakfast Special</h2>
    <img src="https://upload.wikimedia.org/wikipedia/commons/6/6f/Easter_breakfast_in_Serbia_%28close-up%29.jpg" alt="Breakfast" style="width:300px;" />
    <label>Price: $5.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="5" />
        <asp:ListItem Text="2" Value="10" />
        <asp:ListItem Text="3" Value="15" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
