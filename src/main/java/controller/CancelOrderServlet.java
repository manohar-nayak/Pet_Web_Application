package controller;

import java.io.IOException;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancelOrder")
public class CancelOrderServlet
extends HttpServlet {

    protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException,
    IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        OrderDAO dao =
        new OrderDAO();

        dao.deleteOrder(id);

        response.sendRedirect(
        "pages/orders.jsp");
    }
}