<%@ Page Title="Peanuts" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Peanuts.aspx.cs" Inherits="Peanuts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Peanuts</h2>
    <img src="peanuts.jpg" alt="Peanuts" style="width:300px;" />
    <label>Price: $4.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="4" />
        <asp:ListItem Text="2" Value="8" />
        <asp:ListItem Text="3" Value="12" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <br /><br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
