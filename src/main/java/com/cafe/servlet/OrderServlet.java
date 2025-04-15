package com.cafe.servlet;

import com.cafe.dao.OrderDAO;
import com.cafe.model.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("OrderServlet: Fetching all orders");
        
        try {
            // Get orders from database
            List<Order> orders = OrderDAO.getAllOrders();
            
            System.out.println("OrderServlet: Found " + orders.size() + " orders");
            
            // Set orders as request attribute
            request.setAttribute("orders", orders);
            
            // Forward to order.jsp
            RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in OrderServlet: " + e.getMessage());
            request.setAttribute("error", "Error retrieving orders: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
            rd.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests by calling doGet
        doGet(request, response);
    }
}
