using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Collections.Generic;

public partial class FruitsAndVeggies : System.Web.UI.Page
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

    // Event Handlers for each "Submit" button (Apples, Oranges, Bananas, Carrots, Broccoli, Tomatoes)
    protected void btnSubmitApples_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtApplesQty.Text, out quantity, out errorMessage))
        {
            lblApplesError.Text = "";
            AddItemToCart("Apples", 1.20, quantity);
        }
        else
        {
            lblApplesError.Text = errorMessage;
        }
    }

    protected void btnSubmitOranges_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtOrangesQty.Text, out quantity, out errorMessage))
        {
            lblOrangesError.Text = "";
            AddItemToCart("Oranges", 1.50, quantity);
        }
        else
        {
            lblOrangesError.Text = errorMessage;
        }
    }

    protected void btnSubmitBananas_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBananasQty.Text, out quantity, out errorMessage))
        {
            lblBananasError.Text = "";
            AddItemToCart("Bananas", 1.00, quantity);
        }
        else
        {
            lblBananasError.Text = errorMessage;
        }
    }

    protected void btnSubmitCarrots_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCarrotsQty.Text, out quantity, out errorMessage))
        {
            lblCarrotsError.Text = "";
            AddItemToCart("Carrots", 0.80, quantity);
        }
        else
        {
            lblCarrotsError.Text = errorMessage;
        }
    }

    protected void btnSubmitBroccoli_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBroccoliQty.Text, out quantity, out errorMessage))
        {
            lblBroccoliError.Text = "";
            AddItemToCart("Broccoli", 1.75, quantity);
        }
        else
        {
            lblBroccoliError.Text = errorMessage;
        }
    }

    protected void btnSubmitTomatoes_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtTomatoesQty.Text, out quantity, out errorMessage))
        {
            lblTomatoesError.Text = "";
            AddItemToCart("Tomatoes", 1.25, quantity);
        }
        else
        {
            lblTomatoesError.Text = errorMessage;
        }
    }

    // Submit All button logic
    protected void btnSubmitAll_Click(object sender, EventArgs e)
    {
        // Clear the message before adding
        lblMessage.Text = "";

        btnSubmitApples_Click(sender, e);
        btnSubmitOranges_Click(sender, e);
        btnSubmitBananas_Click(sender, e);
        btnSubmitCarrots_Click(sender, e);
        btnSubmitBroccoli_Click(sender, e);
        btnSubmitTomatoes_Click(sender, e);
    }

    // Calculation Methods for each item
    protected void CalculateApples_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtApplesQty.Text, out quantity, out errorMessage))
        {
            lblApplesError.Text = "";
            double pricePerItem = 1.20;
            lblApplesPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblApplesError.Text = errorMessage;
        }
    }

    protected void CalculateOranges_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtOrangesQty.Text, out quantity, out errorMessage))
        {
            lblOrangesError.Text = "";
            double pricePerItem = 1.50;
            lblOrangesPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblOrangesError.Text = errorMessage;
        }
    }

    protected void CalculateBananas_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBananasQty.Text, out quantity, out errorMessage))
        {
            lblBananasError.Text = "";
            double pricePerItem = 1.00;
            lblBananasPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblBananasError.Text = errorMessage;
        }
    }

    protected void CalculateCarrots_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtCarrotsQty.Text, out quantity, out errorMessage))
        {
            lblCarrotsError.Text = "";
            double pricePerItem = 0.80;
            lblCarrotsPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblCarrotsError.Text = errorMessage;
        }
    }

    protected void CalculateBroccoli_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtBroccoliQty.Text, out quantity, out errorMessage))
        {
            lblBroccoliError.Text = "";
            double pricePerItem = 1.75;
            lblBroccoliPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblBroccoliError.Text = errorMessage;
        }
    }

    protected void CalculateTomatoes_Click(object sender, EventArgs e)
    {
        int quantity;
        string errorMessage;
        if (ValidateQuantity(txtTomatoesQty.Text, out quantity, out errorMessage))
        {
            lblTomatoesError.Text = "";
            double pricePerItem = 1.25;
            lblTomatoesPrice.Text = (quantity * pricePerItem).ToString("0.00$");
        }
        else
        {
            lblTomatoesError.Text = errorMessage;
        }
    }
}