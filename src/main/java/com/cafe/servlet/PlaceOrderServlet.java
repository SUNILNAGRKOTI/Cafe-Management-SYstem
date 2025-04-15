package com.cafe.servlet;

import com.cafe.util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get form data
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String deliveryAddress = request.getParameter("deliveryAddress");
        
        System.out.println("Processing order for: " + customerName);
        
        // Get cart items from session
        List<String> cart = (List<String>) session.getAttribute("cart");
        
        if (cart != null && !cart.isEmpty()) {
            Connection conn = null;
            try {
                // Calculate total amount
                double totalAmount = 0.0;
                for (String item : cart) {
                    String priceStr = item.substring(item.lastIndexOf("Rs") + 3).trim();
                    try {
                        totalAmount += Double.parseDouble(priceStr);
                    } catch (Exception e) {
                        System.out.println("Error parsing price: " + priceStr);
                    }
                }
                
                System.out.println("Order total amount: " + totalAmount);
                
                // Get database connection
                conn = DBConnection.getConnection();
                conn.setAutoCommit(false); // Start transaction
                
                // Save order with customer information
                PreparedStatement pst = conn.prepareStatement(
                    "INSERT INTO orders (user_id, customer_name, customer_phone, delivery_address, total_amount) VALUES (?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
                );
                pst.setInt(1, 2); // Default user ID 
                pst.setString(2, customerName);
                pst.setString(3, customerPhone);
                pst.setString(4, deliveryAddress);
                pst.setDouble(5, totalAmount);
                
                int rows = pst.executeUpdate();
                int orderId = -1;
                
                if (rows > 0) {
                    ResultSet rs = pst.getGeneratedKeys();
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                        System.out.println("Order created with ID: " + orderId);
                    }
                    rs.close();
                }
                pst.close();
                
                if (orderId > 0) {
                    // Save order items
                    for (String item : cart) {
                        String itemName = item.substring(0, item.lastIndexOf("-")).trim();
                        String priceStr = item.substring(item.lastIndexOf("Rs") + 3).trim();
                        double price = Double.parseDouble(priceStr);
                        
                        // Find menu item ID
                        PreparedStatement menuPst = conn.prepareStatement(
                            "SELECT item_id FROM menu WHERE name = ?"
                        );
                        menuPst.setString(1, itemName);
                        ResultSet menuRs = menuPst.executeQuery();
                        
                        int itemId = 1; // Default if not found
                        if (menuRs.next()) {
                            itemId = menuRs.getInt("item_id");
                        }
                        menuRs.close();
                        menuPst.close();
                        
                        // Insert order item
                        PreparedStatement itemPst = conn.prepareStatement(
                            "INSERT INTO order_items (order_id, item_id, quantity, price) VALUES (?, ?, ?, ?)"
                        );
                        itemPst.setInt(1, orderId);
                        itemPst.setInt(2, itemId);
                        itemPst.setInt(3, 1); // Default quantity
                        itemPst.setDouble(4, price);
                        itemPst.executeUpdate();
                        itemPst.close();
                        
                        System.out.println("Added item to order: " + itemName);
                    }
                    
                    // Commit transaction
                    conn.commit();
                    System.out.println("Order transaction committed successfully");
                    
                    // Clear the cart
                    session.setAttribute("cart", null);
                    
                    // Redirect to success page
                    response.sendRedirect("orderSuccess.jsp");
                } else {
                    conn.rollback();
                    request.setAttribute("error", "Failed to create order");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
            } catch (Exception e) {
                try {
                    if (conn != null) conn.rollback();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                
                e.printStackTrace();
                System.out.println("Error processing order: " + e.getMessage());
                request.setAttribute("error", "Error processing order: " + e.getMessage());
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } finally {
                try {
                    if (conn != null) {
                        conn.setAutoCommit(true);
                        conn.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            // Cart is empty, redirect to menu
            response.sendRedirect("menu");
        }
    }
}
