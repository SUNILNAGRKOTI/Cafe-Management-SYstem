package com.cafe.servlet;

import com.cafe.dao.MenuDAO;
import com.cafe.model.MenuItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MenuItem> menuList = MenuDAO.getAllMenuItems();
        request.setAttribute("menuList", menuList);
        RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
        rd.forward(request, response);
    }
}
