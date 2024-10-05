<%@ Page Title="Lunch" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lunch.aspx.cs" Inherits="Lunch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Lunch Special</h2>
    <img src="lunch.jpg" alt="Lunch" style="width:300px;" />
    <label>Price: $7.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="7" />
        <asp:ListItem Text="2" Value="14" />
        <asp:ListItem Text="3" Value="21" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
