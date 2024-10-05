<%@ Page Title="Candy" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Candy.aspx.cs" Inherits="Candy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Candy</h2>
    <img src="candy.jpg" alt="Candy" style="width:300px;" />
    <label>Price: $3.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="3" />
        <asp:ListItem Text="2" Value="6" />
        <asp:ListItem Text="3" Value="9" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
