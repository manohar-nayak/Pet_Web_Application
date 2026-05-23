package controller;

import java.io.IOException;

import dao.CartDAO;
import dao.PetDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Pet;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
            Integer.parseInt(
            request.getParameter("id"));

            /* GET PET */

            PetDAO petDAO =
            new PetDAO();

            Pet p =
            petDAO.getPetById(id);

            /* ADD TO CART */

            CartDAO cartDAO =
            new CartDAO();

            boolean status =
            cartDAO.addToCart(
            p.getName(),
            p.getPrice(),
            p.getImage());

            /* REDIRECT */

            if(status){

                response.sendRedirect(
                "pages/cart.jsp");
            }
            else{

                response.getWriter().println(
                "Failed To Add Cart");
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }
    }
}