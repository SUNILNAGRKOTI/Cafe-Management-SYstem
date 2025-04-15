package com.cafe.dao;

import com.cafe.model.Order;
import com.cafe.model.OrderItem;
import com.cafe.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    // Method to save an order (if you need it)
    public static boolean placeOrder(int userId, double totalAmount) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement pst = conn.prepareStatement("INSERT INTO orders (user_id, total_amount) VALUES (?, ?)");
            pst.setInt(1, userId);
            pst.setDouble(2, totalAmount);
            int rows = pst.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Method to retrieve all orders with customer information
    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            
            System.out.println("Retrieving orders from database...");
            
            String query = "SELECT o.order_id, o.user_id, o.customer_name, o.customer_phone, " +
                          "o.delivery_address, o.order_date, o.total_amount " +
                          "FROM orders o " +
                          "ORDER BY o.order_date DESC";
            
            pst = conn.prepareStatement(query);
            rs = pst.executeQuery();
            
            int count = 0;
            while (rs.next()) {
                count++;
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setCustomerName(rs.getString("customer_name"));
                order.setCustomerPhone(rs.getString("customer_phone"));
                order.setDeliveryAddress(rs.getString("delivery_address"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                
                // Get order items for this order
                order.setOrderItems(getOrderItemsByOrderId(rs.getInt("order_id")));
                
                orders.add(order);
            }
            
            System.out.println("Retrieved " + count + " orders from database");
            
        } catch (Exception e) {
            System.out.println("Error retrieving orders: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return orders;
    }
    
    // Helper method to get items for an order
    private static List<OrderItem> getOrderItemsByOrderId(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            conn = DBConnection.getConnection();
            
            String query = "SELECT oi.order_item_id, oi.item_id, m.name AS item_name, " +
                          "oi.quantity, oi.price " +
                          "FROM order_items oi " +
                          "JOIN menu m ON oi.item_id = m.item_id " +
                          "WHERE oi.order_id = ?";
            
            pst = conn.prepareStatement(query);
            pst.setInt(1, orderId);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                OrderItem item = new OrderItem();
                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setItemId(rs.getInt("item_id"));
                item.setItemName(rs.getString("item_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                
                items.add(item);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return items;
    }
}
