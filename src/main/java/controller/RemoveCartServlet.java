package controller;

import java.io.IOException;

import dao.CartDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeCart")

public class RemoveCartServlet
extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,
            IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        CartDAO dao =
                new CartDAO();

        dao.removeCartItem(id);

        response.sendRedirect(
                "pages/cart.jsp");
    }
}