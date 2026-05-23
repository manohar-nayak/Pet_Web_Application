package controller;

import java.io.IOException;

import dao.PetDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Pet;

@WebServlet("/addPet")

public class AddPetServlet
extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,
            IOException {

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

        Pet pet = new Pet();

        pet.setName(name);

        pet.setBreed(breed);

        pet.setCategory(category);

        pet.setAge(age);

        pet.setPrice(price);

        pet.setImage(image);

        PetDAO dao =
                new PetDAO();

        boolean status =
                dao.addPet(pet);

        if(status) {

            response.sendRedirect(
                    "pages/pets.jsp");
        }
    }
}