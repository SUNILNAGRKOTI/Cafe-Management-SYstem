<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<%
    // Retrieve the cart from the session
    List<String> cart = (List<String>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }
    
    // Calculate total amount
    double totalAmount = 0.0;
    for (String item : cart) {
        String priceStr = item.substring(item.lastIndexOf("Rs") + 3);
        try {
            double price = Double.parseDouble(priceStr);
            totalAmount += price;
        } catch (NumberFormatException e) {
            // Skip if price can't be parsed
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - FOOD PLACE CAFE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #a8e063, #56ab2f);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }
        
        .checkout-container {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 30px;
            max-width: 800px;
            margin: 40px auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }
        
        .checkout-title {
            text-align: center;
            margin-bottom: 30px;
            color: #ffcc00;
            font-size: 28px;
        }
        
        .cart-item {
            padding: 12px;
            border-bottom: 1px solid #444;
            display: flex;
            justify-content: space-between;
        }
        
        .cart-item:last-child {
            border-bottom: none;
        }
        
        .item-name {
            color: #fff;
        }
        
        .item-price {
            color: #ffcc00;
            font-weight: bold;
        }
        
        .total-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px dashed #444;
        }
        
        .total-amount {
            font-size: 24px;
            color: #ffcc00;
            text-align: right;
            margin-bottom: 20px;
        }
        
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn-container a {
            padding: 12px 24px;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h1 class="checkout-title">🧾 Checkout</h1>
        
        <% if (cart.isEmpty()) { %>
            <div class="alert alert-warning">Your cart is empty. Please add items before checking out.</div>
            <div class="text-center mt-4">
                <a href="menu" class="btn btn-primary">Back to Menu</a>
            </div>
        <% } else { %>
            <div class="order-summary">
                <h3>Order Summary</h3>
                
                <% for (String item : cart) { 
                    String itemName = item.substring(0, item.lastIndexOf("-")).trim();
                    String itemPrice = item.substring(item.lastIndexOf("-") + 1).trim();
                %>
                <div class="cart-item">
                    <span class="item-name"><%= itemName %></span>
                    <span class="item-price"><%= itemPrice %></span>
                </div>
                <% } %>
                
                <div class="total-section">
                    <div class="total-amount">
                        Total: Rs <%= String.format("%.2f", totalAmount) %>
                    </div>
                    
                    <form action="placeOrder" method="post">
                        <div class="mb-3">
                            <label for="customerName" class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="customerName" name="customerName" required>
                        </div>
                        <div class="mb-3">
                            <label for="customerPhone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="customerPhone" name="customerPhone" required>
                        </div>
                        <div class="mb-3">
                            <label for="deliveryAddress" class="form-label">Delivery Address</label>
                            <textarea class="form-control" id="deliveryAddress" name="deliveryAddress" rows="3" required></textarea>
                        </div>
                        
                        <div class="btn-container">
                            <a href="menu" class="btn btn-outline-light">Back to Menu</a>
                            <button type="submit" class="btn btn-success">Place Order</button>
                        </div>
                    </form>
                </div>
            </div>
        <% } %>
    </div>
</body>
</html>
