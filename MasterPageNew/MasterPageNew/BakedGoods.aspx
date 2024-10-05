<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BakedGoods.aspx.cs" Inherits="BakedGoods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Baked Goods</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Image</th>
            <th>Price per Item</th>
            <th>Specify Quantity</th>
            <th>Calculated Price</th>
            <th>Calculate</th>
            <th>Submit</th>
            <th>Error Message</th>
        </tr>
        <tr>
            <td>Cake</td>
            <td><img src="cake.jpg" alt="Cake" width="100" /></td>
            <td>5.00$</td>
            <td><asp:TextBox ID="txtCakeQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCakePrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCake" runat="server" Text="Calculate" OnClick="CalculateCake_Click" /></td>
            <td><asp:Button ID="btnSubmitCake" runat="server" Text="Submit" OnClick="btnSubmitCake_Click" /></td>
            <td><asp:Label ID="lblCakeError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Cupcake</td>
            <td><img src="cupcake.jpg" alt="Cupcake" width="100" /></td>
            <td>2.50$</td>
            <td><asp:TextBox ID="txtCupcakeQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCupcakePrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCupcake" runat="server" Text="Calculate" OnClick="CalculateCupcake_Click" /></td>
            <td><asp:Button ID="btnSubmitCupcake" runat="server" Text="Submit" OnClick="btnSubmitCupcake_Click" /></td>
            <td><asp:Label ID="lblCupcakeError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Muffin</td>
            <td><img src="muffin.jpg" alt="Muffin" width="100" /></td>
            <td>2.00$</td>
            <td><asp:TextBox ID="txtMuffinQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblMuffinPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateMuffin" runat="server" Text="Calculate" OnClick="CalculateMuffin_Click" /></td>
            <td><asp:Button ID="btnSubmitMuffin" runat="server" Text="Submit" OnClick="btnSubmitMuffin_Click" /></td>
            <td><asp:Label ID="lblMuffinError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Cookie</td>
            <td><img src="cookie.jpg" alt="Cookie" width="100" /></td>
            <td>1.00$</td>
            <td><asp:TextBox ID="txtCookieQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCookiePrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCookie" runat="server" Text="Calculate" OnClick="CalculateCookie_Click" /></td>
            <td><asp:Button ID="btnSubmitCookie" runat="server" Text="Submit" OnClick="btnSubmitCookie_Click" /></td>
            <td><asp:Label ID="lblCookieError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Croissant</td>
            <td><img src="croissant.jpg" alt="Croissant" width="100" /></td>
            <td>1.75$</td>
            <td><asp:TextBox ID="txtCroissantQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCroissantPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCroissant" runat="server" Text="Calculate" OnClick="CalculateCroissant_Click" /></td>
            <td><asp:Button ID="btnSubmitCroissant" runat="server" Text="Submit" OnClick="btnSubmitCroissant_Click" /></td>
            <td><asp:Label ID="lblCroissantError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Brownie</td>
            <td><img src="brownie.jpg" alt="Brownie" width="100" /></td>
            <td>2.25$</td>
            <td><asp:TextBox ID="txtBrownieQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblBrowniePrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateBrownie" runat="server" Text="Calculate" OnClick="CalculateBrownie_Click" /></td>
            <td><asp:Button ID="btnSubmitBrownie" runat="server" Text="Submit" OnClick="btnSubmitBrownie_Click" /></td>
            <td><asp:Label ID="lblBrownieError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Donut</td>
            <td><img src="donut.jpg" alt="Donut" width="100" /></td>
            <td>1.50$</td>
            <td><asp:TextBox ID="txtDonutQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblDonutPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateDonut" runat="server" Text="Calculate" OnClick="CalculateDonut_Click" /></td>
            <td><asp:Button ID="btnSubmitDonut" runat="server" Text="Submit" OnClick="btnSubmitDonut_Click" /></td>
            <td><asp:Label ID="lblDonutError" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmitAll" runat="server" Text="Submit All" OnClick="btnSubmitAll_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>