using System;
using System.Collections.Generic;

public partial class Dairy : System.Web.UI.Page
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

    // Event Handlers for each "Submit" button (Milk, Cheese, Yogurt, Butter, Cream)
    protected void btnSubmitMilk_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtMilkQty.Text, out quantity, out errorMessage))
        {
            lblMilkError.Text = "";
            AddItemToCart("Milk", 1.50, quantity);
        }
        else
        {
            lblMilkError.Text = errorMessage;
        }
    }

    protected void btnSubmitCheese_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCheeseQty.Text, out quantity, out errorMessage))
        {
            lblCheeseError.Text = "";
            AddItemToCart("Cheese", 3.25, quantity);
        }
        else
        {
            lblCheeseError.Text = errorMessage;
        }
    }

    protected void btnSubmitYogurt_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtYogurtQty.Text, out quantity, out errorMessage))
        {
            lblYogurtError.Text = "";
            AddItemToCart("Yogurt", 1.00, quantity);
        }
        else
        {
            lblYogurtError.Text = errorMessage;
        }
    }

    protected void btnSubmitButter_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtButterQty.Text, out quantity, out errorMessage))
        {
            lblButterError.Text = "";
            AddItemToCart("Butter", 2.50, quantity);
        }
        else
        {
            lblButterError.Text = errorMessage;
        }
    }

    protected void btnSubmitCream_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCreamQty.Text, out quantity, out errorMessage))
        {
            lblCreamError.Text = "";
            AddItemToCart("Whipped Cream", 1.80, quantity);
        }
        else
        {
            lblCreamError.Text = errorMessage;
        }
    }

    // Submit All button logic
    protected void btnSubmitAll_Click(object sender, EventArgs e)
    {
        // Clear the message before adding
        lblMessage.Text = "";

        btnSubmitMilk_Click(sender, e);
        btnSubmitCheese_Click(sender, e);
        btnSubmitYogurt_Click(sender, e);
        btnSubmitButter_Click(sender, e);
        btnSubmitCream_Click(sender, e);
    }

    // Calculation Methods for each item (kept the same)
    protected void CalculateMilk_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtMilkQty.Text, out quantity, out errorMessage))
        {
            lblMilkError.Text = "";
            double pricePerItem = 1.50;
            lblMilkPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblMilkError.Text = errorMessage;
        }
    }

    protected void CalculateCheese_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCheeseQty.Text, out quantity, out errorMessage))
        {
            lblCheeseError.Text = "";
            double pricePerItem = 3.25;
            lblCheesePrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCheeseError.Text = errorMessage;
        }
    }

    protected void CalculateYogurt_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtYogurtQty.Text, out quantity, out errorMessage))
        {
            lblYogurtError.Text = "";
            double pricePerItem = 1.00;
            lblYogurtPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblYogurtError.Text = errorMessage;
        }
    }

    protected void CalculateButter_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtButterQty.Text, out quantity, out errorMessage))
        {
            lblButterError.Text = "";
            double pricePerItem = 2.50;
            lblButterPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblButterError.Text = errorMessage;
        }
    }

    protected void CalculateCream_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCreamQty.Text, out quantity, out errorMessage))
        {
            lblCreamError.Text = "";
            double pricePerItem = 1.80;
            lblCreamPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCreamError.Text = errorMessage;
        }
    }
}