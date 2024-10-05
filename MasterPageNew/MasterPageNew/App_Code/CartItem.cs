using System;

/// <summary>
/// Represents an item in the shopping cart
/// </summary>
public class CartItem
{
    // Properties for the item name, price, and quantity
    public string Name { get; set; }
    public double Price { get; set; }
    public int Quantity { get; set; }

    // Default constructor (no arguments)
    public CartItem()
    {
        // Default constructor logic if needed
    }

    // Constructor with parameters to initialize the CartItem
    public CartItem(string name, double price, int quantity)
    {
        Name = name;
        Price = price;
        Quantity = quantity;
    }

    // Method to calculate total price for the item
    public double GetTotalPrice()
    {
        return Price * Quantity;
    }
}
