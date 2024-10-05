<%@ Page Title="Dinner" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dinner.aspx.cs" Inherits="Dinner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Dinner Special</h2>
    <img src="dinner.jpg" alt="Dinner" style="width:300px;" />
    <label>Price: $10.00</label>
    <br /><br />
    <asp:DropDownList ID="ddlQuantity" runat="server">
        <asp:ListItem Text="0" Value="0" />
        <asp:ListItem Text="1" Value="10" />
        <asp:ListItem Text="2" Value="20" />
        <asp:ListItem Text="3" Value="30" />
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
