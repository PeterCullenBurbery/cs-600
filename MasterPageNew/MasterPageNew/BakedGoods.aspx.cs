using System;
using System.Collections.Generic;

public partial class BakedGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    private bool ValidateQuantity(string input, out int quantity, out string errorMessage)
    {
        errorMessage = "";
        if (!int.TryParse(input, out quantity))
        {
            errorMessage = "You did not enter a valid integer.";
            return false;
        }
        if (quantity <= 0)
        {
            errorMessage = "You must enter an integer that is 1 or greater.";
            return false;
        }
        return true;
    }

    // Method to add an item to the cart and display a message
    private void AddItemToCart(string itemName, double itemPrice, int quantity)
    {
        if (quantity > 0)
        {
            // Retrieve the cart from the session or create a new one
            List<CartItem> cart = (List<CartItem>)Session["CartItems"] ?? new List<CartItem>();

            // Add the item to the cart
            cart.Add(new CartItem(itemName, itemPrice, quantity));

            // Store the cart back in the session
            Session["CartItems"] = cart;

            // Display the message about the added item
            lblMessage.Text += $"{quantity} {itemName}(s) added for {itemPrice * quantity:0.00}$<br />";
        }
    }

    // Event Handlers for each "Submit" button (Cake, Cupcake, Muffin, Cookie, Croissant, Brownie, Donut)
    protected void btnSubmitCake_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCakeQty.Text, out quantity, out errorMessage))
        {
            lblCakeError.Text = "";
            AddItemToCart("Cake", 5.00, quantity);
        }
        else
        {
            lblCakeError.Text = errorMessage;
        }
    }

    protected void btnSubmitCupcake_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCupcakeQty.Text, out quantity, out errorMessage))
        {
            lblCupcakeError.Text = "";
            AddItemToCart("Cupcake", 2.50, quantity);
        }
        else
        {
            lblCupcakeError.Text = errorMessage;
        }
    }

    protected void btnSubmitMuffin_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtMuffinQty.Text, out quantity, out errorMessage))
        {
            lblMuffinError.Text = "";
            AddItemToCart("Muffin", 2.00, quantity);
        }
        else
        {
            lblMuffinError.Text = errorMessage;
        }
    }

    protected void btnSubmitCookie_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCookieQty.Text, out quantity, out errorMessage))
        {
            lblCookieError.Text = "";
            AddItemToCart("Cookie", 1.00, quantity);
        }
        else
        {
            lblCookieError.Text = errorMessage;
        }
    }

    protected void btnSubmitCroissant_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCroissantQty.Text, out quantity, out errorMessage))
        {
            lblCroissantError.Text = "";
            AddItemToCart("Croissant", 1.75, quantity);
        }
        else
        {
            lblCroissantError.Text = errorMessage;
        }
    }

    protected void btnSubmitBrownie_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBrownieQty.Text, out quantity, out errorMessage))
        {
            lblBrownieError.Text = "";
            AddItemToCart("Brownie", 2.25, quantity);
        }
        else
        {
            lblBrownieError.Text = errorMessage;
        }
    }

    protected void btnSubmitDonut_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtDonutQty.Text, out quantity, out errorMessage))
        {
            lblDonutError.Text = "";
            AddItemToCart("Donut", 1.50, quantity);
        }
        else
        {
            lblDonutError.Text = errorMessage;
        }
    }

    // Submit All button logic
    protected void btnSubmitAll_Click(object sender, EventArgs e)
    {
        // Clear the message before adding
        lblMessage.Text = "";

        btnSubmitCake_Click(sender, e);
        btnSubmitCupcake_Click(sender, e);
        btnSubmitMuffin_Click(sender, e);
        btnSubmitCookie_Click(sender, e);
        btnSubmitCroissant_Click(sender, e);
        btnSubmitBrownie_Click(sender, e);
        btnSubmitDonut_Click(sender, e);
    }

    // Calculation Methods for each item
    protected void CalculateCake_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCakeQty.Text, out quantity, out errorMessage))
        {
            lblCakeError.Text = "";
            double pricePerItem = 5.00;
            lblCakePrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCakeError.Text = errorMessage;
        }
    }

    protected void CalculateCupcake_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCupcakeQty.Text, out quantity, out errorMessage))
        {
            lblCupcakeError.Text = "";
            double pricePerItem = 2.50;
            lblCupcakePrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCupcakeError.Text = errorMessage;
        }
    }

    protected void CalculateMuffin_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtMuffinQty.Text, out quantity, out errorMessage))
        {
            lblMuffinError.Text = "";
            double pricePerItem = 2.00;
            lblMuffinPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblMuffinError.Text = errorMessage;
        }
    }

    protected void CalculateCookie_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCookieQty.Text, out quantity, out errorMessage))
        {
            lblCookieError.Text = "";
            double pricePerItem = 1.00;
            lblCookiePrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCookieError.Text = errorMessage;
        }
    }

    protected void CalculateCroissant_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCroissantQty.Text, out quantity, out errorMessage))
        {
            lblCroissantError.Text = "";
            double pricePerItem = 1.75;
            lblCroissantPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCroissantError.Text = errorMessage;
        }
    }

    protected void CalculateBrownie_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBrownieQty.Text, out quantity, out errorMessage))
        {
            lblBrownieError.Text = "";
            double pricePerItem = 2.25;
            lblBrowniePrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblBrownieError.Text = errorMessage;
        }
    }

    protected void CalculateDonut_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtDonutQty.Text, out quantity, out errorMessage))
        {
            lblDonutError.Text = "";
            double pricePerItem = 1.50;
            lblDonutPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblDonutError.Text = errorMessage;
        }
    }
}