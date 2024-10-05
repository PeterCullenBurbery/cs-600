<%@ Page Title="Instructions & Rules" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Instructions.aspx.cs" Inherits="Instructions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Instructions</h2>
    <p>The order system consists of three product categories: <strong>Dairy</strong>, <strong>Fruits and Vegetables</strong>, and <strong>Baked Goods/Sweets</strong>.</p>
    <p>Each category page contains a <strong>table</strong> that displays the following details for each product:</p>
    <ul style="padding-left: 30px;">
        <li><strong>Product Name</strong></li>
        <li><strong>Image of the product</strong></li>
        <li><strong>Price per Item</strong></li>
        <li><strong>Quantity Field:</strong> where you can enter the number of items you wish to purchase</li>
        <li><strong>Calculate Price Button:</strong> click this button to calculate the total cost based on the quantity entered for that specific product</li>
        <li><strong>Submit Button:</strong> submit the selected quantity for that product only</li>
    </ul>
    <p>At the <strong>bottom of the table</strong>, there is a <strong>Submit All</strong> button, which allows you to submit the quantities for all products in the table at once.</p>

    <h3>Key Points:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>Submit Buttons:</strong>
            <ul style="padding-left: 50px;">
                <li><strong>Row Submit Button:</strong> This button submits the quantity for the product in that row only.</li>
                <li><strong>Submit All Button:</strong> This button submits the quantities for all products in the table.</li>
            </ul>
        </li>
        <li><strong>Error Handling:</strong>
            <ul style="padding-left: 50px;">
                <li><strong>Error Messages</strong> will be displayed in the "Error" column of the table if there are issues with the entered quantity.</li>
                <li>Quantity must be a <strong>positive integer</strong> (e.g., 1, 2, 3) – meaning no negative values (like -1 or -2) and no decimal values (like 2.5 or 3.7).</li>
                <li>The quantity <strong>cannot be zero</strong> – you need to order at least 1 item.</li>
                <li>The input must be a <strong>valid number</strong> – text inputs like "one" or "five" are not allowed.</li>
            </ul>
        </li>
    </ul>

    <h3>After Submitting:</h3>
    <p>Once you have selected your items, proceed to the <strong>Basket</strong> page. On the Basket page, you can review your order and then click <strong>Submit Order</strong> to finalize your purchase.</p>
    <p>You will be directed to the <strong>Order Confirmation</strong> page to confirm that your order has been successfully submitted.</p>

    <h3>Interaction Details:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>Submit Button (Per Row):</strong>
            <ul style="padding-left: 50px;">
                <li>When you click the Submit button in any row, a message will be displayed below the Submit All button. For example:</li>
                <ul style="padding-left: 70px;">
                    <li>"1 Milk(s) added for 1.50$"</li>
                    <li>"3 Apple(s) added for 3.60$"</li>
                </ul>
            </ul>
        </li>
        <li><strong>Submit All Button:</strong>
            <ul style="padding-left: 50px;">
                <li>When you click the Submit All button, multiple messages will be displayed for each item you've added. For example:</li>
                <ul style="padding-left: 70px;">
                    <li>"4 Cake(s) added for 20.00$"</li>
                    <li>"5 Cupcake(s) added for 12.50$"</li>
                    <li>"7 Muffin(s) added for 14.00$"</li>
                    <li>"9 Cookie(s) added for 9.00$"</li>
                </ul>
            </ul>
        </li>
    </ul>

    <h3>Clearing Messages:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>Automatic Clearing:</strong>
            <ul style="padding-left: 50px;">
                <li>Each time you submit an item (or click the Submit All button), any previously displayed messages will be cleared. For instance, if you submit "1 Milk(s)" and later submit "12 Butter(s)," the milk message will be removed, and only the butter message will be shown.</li>
            </ul>
        </li>
    </ul>

    <h3>Scrolling and Large Tables:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>Large Tables:</strong>
            <ul style="padding-left: 50px;">
                <li>If the product table contains many items, you may need to scroll down to reach the Submit All button and the message display area beneath it.</li>
            </ul>
        </li>
    </ul>

    <h3>Cart Limitations:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>No Real-Time Tracking of Cart:</strong>
            <ul style="padding-left: 50px;">
                <li>There is no real-time tracking of how many items are in your cart. For example, if you add 1 milk to your cart, navigate away, and return later, the table will reset to display 0 for milk, even though you already added 1 milk earlier.</li>
            </ul>
        </li>
        <li><strong>No Quantity Reduction:</strong>
            <ul style="padding-left: 50px;">
                <li>Once you add items to the cart, you cannot decrease the quantity. For example, if you add 10 apples but later want to reduce it to 4, the system doesn’t currently allow you to remove items or adjust the quantity downward.</li>
            </ul>
        </li>
    </ul>

    <h3>Duplicate Items in the Cart:</h3>
    <ul style="padding-left: 30px;">
        <li><strong>Duplicate Rows:</strong>
            <ul style="padding-left: 50px;">
                <li>Depending on the order in which you add items, you may see duplicate rows for the same item in the cart. For example:</li>
                <ul style="padding-left: 70px;">
                    <li><strong>Your Cart:</strong></li>
                    <ul style="padding-left: 90px;">
                        <li>Milk 1.50 1 1.50</li>
                        <li>Oranges 1.50 2 3.00</li>
                        <li>Milk 1.50 1 1.50</li>
                        <li>Apples 1.20 3 3.60</li>
                        <li>Cake 5.00 4 20.00</li>
                        <li>Cupcake 2.50 5 12.50</li>
                        <li>Muffin 2.00 7 14.00</li>
                        <li>Cookie 1.00 9 9.00</li>
                        <li>Butter 2.50 12 30.00</li>
                    </ul>
                    <li><strong>Total Price: $95.10</strong></li>
                </ul>
                <li>Notice that milk appears twice in the cart instead of being combined into a single row. The current program does not automatically merge items and sum their quantities.</li>
            </ul>
        </li>
    </ul>
</asp:Content>