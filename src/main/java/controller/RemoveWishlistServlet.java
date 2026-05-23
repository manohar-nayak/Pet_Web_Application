package controller;

import java.io.IOException;

import dao.WishlistDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeWishlist")
public class RemoveWishlistServlet
extends HttpServlet {

    protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException, IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        WishlistDAO dao =
        new WishlistDAO();

        dao.removeWishlist(id);

        response.sendRedirect(
        "pages/wishlist.jsp");
    }
}