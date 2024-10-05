<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Basket.aspx.cs" Inherits="Basket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Your Cart</h2>
    <asp:PlaceHolder ID="phCart" runat="server">
        <table border="1">
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <asp:Repeater ID="rptCartItems" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Price") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("Total") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>

        <p>Total Price: <asp:Label ID="lblTotalPrice" runat="server"></asp:Label></p>
        <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" OnClick="btnSubmitOrder_Click" />
    </asp:PlaceHolder>

    <asp:Label ID="lblEmptyCart" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>