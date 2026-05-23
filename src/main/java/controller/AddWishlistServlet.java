package controller;

import java.io.IOException;

import dao.PetDAO;
import dao.WishlistDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Pet;
import model.Wishlist;

@WebServlet("/addWishlist")
public class AddWishlistServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
            request.getSession();

            String username =
            (String)session.getAttribute("username");

            int id =
            Integer.parseInt(
            request.getParameter("id"));

            PetDAO petDAO =
            new PetDAO();

            Pet p =
            petDAO.getPetById(id);

            Wishlist w =
            new Wishlist();

            w.setUsername(username);

            w.setPetId(
            p.getId());

            w.setPetname(
            p.getName());

            w.setPrice(
            p.getPrice());

            w.setImage(
            p.getImage());

            WishlistDAO dao =
            new WishlistDAO();

            dao.addWishlist(w);

            response.sendRedirect(
            "pages/wishlist.jsp");

        }
        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);
        }
    }
}