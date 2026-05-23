package controller;

import java.io.IOException;

import dao.PetDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pet;

@WebServlet("/updatePet")
public class UpdatePetServlet extends HttpServlet {

    protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException,
    IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        String name =
        request.getParameter("name");

        String breed =
        request.getParameter("breed");

        String category =
        request.getParameter("category");

        int age =
        Integer.parseInt(
        request.getParameter("age"));

        double price =
        Double.parseDouble(
        request.getParameter("price"));

        String image =
        request.getParameter("image");

        Pet p = new Pet();

        p.setId(id);

        p.setName(name);

        p.setBreed(breed);

        p.setCategory(category);

        p.setAge(age);

        p.setPrice(price);

        p.setImage(image);

        PetDAO dao =
        new PetDAO();

        boolean status =
        dao.updatePet(p);

        if(status){

            response.sendRedirect(
            "pages/managePets.jsp");
        }
        else{

            response.sendRedirect(
            "pages/editPet.jsp?id=" + id);
        }
    }
}