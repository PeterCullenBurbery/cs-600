using System;
using System.Collections.Generic;
using System.Linq;

public partial class Basket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCart();
        }
    }

    private void LoadCart()
    {
        var cart = (List<CartItem>)Session["CartItems"] ?? new List<CartItem>();
        rptCartItems.DataSource = cart.Select(item => new
        {
            item.Name,
            item.Price,
            item.Quantity,
            Total = (item.Price * item.Quantity).ToString("0.00")
        });
        rptCartItems.DataBind();

        double totalPrice = cart.Sum(item => item.Price * item.Quantity);
        lblTotalPrice.Text = $"${totalPrice.ToString("0.00")}";
    }

    protected void btnSubmitOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderConfirmation.aspx");
    }
}
