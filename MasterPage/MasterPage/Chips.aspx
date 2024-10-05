<%@ Page Title="Chips" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Chips.aspx.cs" Inherits="Chips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Chips</h2>
    <img src="potato-chips.jpg" alt="Chips" style="width:300px;" />
    <label>Price: $2.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="2" />
        <asp:ListItem Text="2" Value="4" />
        <asp:ListItem Text="3" Value="6" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
