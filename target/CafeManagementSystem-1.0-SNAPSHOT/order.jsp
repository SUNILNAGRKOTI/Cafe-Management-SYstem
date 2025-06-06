<%@ page import="java.util.*, com.cafe.model.Order, com.cafe.model.OrderItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders - FOOD PLACE CAFE</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #a8e063, #56ab2f);
            color: white;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
        }
        
        .orders-container {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 30px;
            max-width: 800px;
            margin: 40px auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }
        
        .orders-title {
            text-align: center;
            margin-bottom: 30px;
            color: #ffcc00;
            font-size: 28px;
        }
        
        .order-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .order-header {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #444;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        
        .order-id {
            font-weight: bold;
            color: #ffcc00;
        }
        
        .order-date {
            color: #ccc;
        }
        
        .customer-info {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px dashed #444;
        }
        
        .order-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }
        
        .item-name {
            color: #fff;
        }
        
        .item-price {
            color: #ffcc00;
        }
        
        .order-total {
            margin-top: 15px;
            text-align: right;
            font-weight: bold;
            color: #ffcc00;
        }
        
        .no-orders {
            text-align: center;
            padding: 30px;
        }
        
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="orders-container">
        <h1 class="orders-title">📋 Your Orders</h1>
        
        <% 
            System.out.println("JSP: Processing orders attribute");
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            
            if (orders == null || orders.isEmpty()) {
                System.out.println("JSP: No orders found to display");
        %>
            <div class="no-orders">
                <div class="alert alert-info">You don't have any orders yet.</div>
            </div>
        <% 
            } else {
                System.out.println("JSP: Displaying " + orders.size() + " orders");
                for (Order order : orders) {
        %>
            <div class="order-card">
                <div class="order-header">
                    <span class="order-id">Order #<%= order.getOrderId() %></span>
                    <span class="order-date"><%= order.getOrderDate() %></span>
                </div>
                
                <div class="customer-info">
                    <p><strong>Customer:</strong> <%= order.getCustomerName() != null ? order.getCustomerName() : "N/A" %></p>
                    <p><strong>Phone:</strong> <%= order.getCustomerPhone() != null ? order.getCustomerPhone() : "N/A" %></p>
                    <p><strong>Address:</strong> <%= order.getDeliveryAddress() != null ? order.getDeliveryAddress() : "N/A" %></p>
                </div>
                
                <div class="order-items">
                    <h5>Items:</h5>
                    <% 
                        List<OrderItem> items = order.getOrderItems();
                        if (items != null && !items.isEmpty()) {
                            for (OrderItem item : items) { 
                    %>
                    <div class="order-item">
                        <span class="item-name"><%= item.getItemName() %> x <%= item.getQuantity() %></span>
                        <span class="item-price">Rs <%= String.format("%.2f", item.getPrice()) %></span>
                    </div>
                    <% 
                            }
                        } else {
                    %>
                    <p>No items found for this order.</p>
                    <% 
                        }
                    %>
                </div>
                
                <div class="order-total">
                    Total: Rs <%= String.format("%.2f", order.getTotalAmount()) %>
                </div>
            </div>
        <% 
                }
            }
        %>
        
        <div class="btn-container">
            <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
