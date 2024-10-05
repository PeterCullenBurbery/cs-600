<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dairy.aspx.cs" Inherits="Dairy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Dairy Products</h2>
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
            <td>Milk</td>
            <td><img src="milk.jpg" alt="Milk" width="100" /></td>
            <td>1.50$</td>
            <td><asp:TextBox ID="txtMilkQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblMilkPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateMilk" runat="server" Text="Calculate" OnClick="CalculateMilk_Click" /></td>
            <td><asp:Button ID="btnSubmitMilk" runat="server" Text="Submit" OnClick="btnSubmitMilk_Click" /></td>
            <td><asp:Label ID="lblMilkError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Cheese</td>
            <td><img src="cheese.jpg" alt="Cheese" width="100" /></td>
            <td>3.25$</td>
            <td><asp:TextBox ID="txtCheeseQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCheesePrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCheese" runat="server" Text="Calculate" OnClick="CalculateCheese_Click" /></td>
            <td><asp:Button ID="btnSubmitCheese" runat="server" Text="Submit" OnClick="btnSubmitCheese_Click" /></td>
            <td><asp:Label ID="lblCheeseError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Yogurt</td>
            <td><img src="yogurt.jpg" alt="Yogurt" width="100" /></td>
            <td>1.00$</td>
            <td><asp:TextBox ID="txtYogurtQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblYogurtPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateYogurt" runat="server" Text="Calculate" OnClick="CalculateYogurt_Click" /></td>
            <td><asp:Button ID="btnSubmitYogurt" runat="server" Text="Submit" OnClick="btnSubmitYogurt_Click" /></td>
            <td><asp:Label ID="lblYogurtError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Butter</td>
            <td><img src="butter.jpg" alt="Butter" width="100" /></td>
            <td>2.50$</td>
            <td><asp:TextBox ID="txtButterQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblButterPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateButter" runat="server" Text="Calculate" OnClick="CalculateButter_Click" /></td>
            <td><asp:Button ID="btnSubmitButter" runat="server" Text="Submit" OnClick="btnSubmitButter_Click" /></td>
            <td><asp:Label ID="lblButterError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Whipped Cream</td>
            <td><img src="whipped-cream.jpg" alt="Whipped Cream" width="100" /></td>
            <td>1.80$</td>
            <td><asp:TextBox ID="txtCreamQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCreamPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCream" runat="server" Text="Calculate" OnClick="CalculateCream_Click" /></td>
            <td><asp:Button ID="btnSubmitCream" runat="server" Text="Submit" OnClick="btnSubmitCream_Click" /></td>
            <td><asp:Label ID="lblCreamError" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmitAll" runat="server" Text="Submit All" OnClick="btnSubmitAll_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>