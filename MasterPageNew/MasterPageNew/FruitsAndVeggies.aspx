<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FruitsAndVeggies.aspx.cs" Inherits="FruitsAndVeggies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Fruits and Vegetables</h2>
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
            <td>Apples</td>
            <td><img src="apple.jpg" alt="Apples" width="100" /></td>
            <td>1.20$</td>
            <td><asp:TextBox ID="txtApplesQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblApplesPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateApples" runat="server" Text="Calculate" OnClick="CalculateApples_Click" /></td>
            <td><asp:Button ID="btnSubmitApples" runat="server" Text="Submit" OnClick="btnSubmitApples_Click" /></td>
            <td><asp:Label ID="lblApplesError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Oranges</td>
            <td><img src="orange.jpg" alt="Oranges" width="100" /></td>
            <td>1.50$</td>
            <td><asp:TextBox ID="txtOrangesQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblOrangesPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateOranges" runat="server" Text="Calculate" OnClick="CalculateOranges_Click" /></td>
            <td><asp:Button ID="btnSubmitOranges" runat="server" Text="Submit" OnClick="btnSubmitOranges_Click" /></td>
            <td><asp:Label ID="lblOrangesError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Bananas</td>
            <td><img src="banana.jpg" alt="Bananas" width="100" /></td>
            <td>1.00$</td>
            <td><asp:TextBox ID="txtBananasQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblBananasPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateBananas" runat="server" Text="Calculate" OnClick="CalculateBananas_Click" /></td>
            <td><asp:Button ID="btnSubmitBananas" runat="server" Text="Submit" OnClick="btnSubmitBananas_Click" /></td>
            <td><asp:Label ID="lblBananasError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Carrots</td>
            <td><img src="carrot.jpg" alt="Carrots" width="100" /></td>
            <td>0.80$</td>
            <td><asp:TextBox ID="txtCarrotsQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblCarrotsPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateCarrots" runat="server" Text="Calculate" OnClick="CalculateCarrots_Click" /></td>
            <td><asp:Button ID="btnSubmitCarrots" runat="server" Text="Submit" OnClick="btnSubmitCarrots_Click" /></td>
            <td><asp:Label ID="lblCarrotsError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Broccoli</td>
            <td><img src="broccoli.jpg" alt="Broccoli" width="100" /></td>
            <td>1.75$</td>
            <td><asp:TextBox ID="txtBroccoliQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblBroccoliPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateBroccoli" runat="server" Text="Calculate" OnClick="CalculateBroccoli_Click" /></td>
            <td><asp:Button ID="btnSubmitBroccoli" runat="server" Text="Submit" OnClick="btnSubmitBroccoli_Click" /></td>
            <td><asp:Label ID="lblBroccoliError" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Tomatoes</td>
            <td><img src="tomato.jpg" alt="Tomatoes" width="100" /></td>
            <td>1.25$</td>
            <td><asp:TextBox ID="txtTomatoesQty" runat="server" Text="0" Width="50px"></asp:TextBox></td>
            <td><asp:Label ID="lblTomatoesPrice" runat="server" Text="0.00$"></asp:Label></td>
            <td><asp:Button ID="btnCalculateTomatoes" runat="server" Text="Calculate" OnClick="CalculateTomatoes_Click" /></td>
            <td><asp:Button ID="btnSubmitTomatoes" runat="server" Text="Submit" OnClick="btnSubmitTomatoes_Click" /></td>
            <td><asp:Label ID="lblTomatoesError" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmitAll" runat="server" Text="Submit All" OnClick="btnSubmitAll_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>