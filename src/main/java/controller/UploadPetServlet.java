package controller;

import java.io.File;
import java.io.IOException;

import dao.PetDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Pet;

@WebServlet("/uploadPet")

@MultipartConfig

public class UploadPetServlet
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

        Part filePart =
        request.getPart("image");

        String fileName =
        filePart.getSubmittedFileName();

        String uploadPath =
        getServletContext()
        .getRealPath("")
        + "uploads";

        File uploadDir =
        new File(uploadPath);

        if(!uploadDir.exists()){

            uploadDir.mkdir();
        }

        filePart.write(
        uploadPath +
        File.separator +
        fileName);

        String imagePath =
        		request.getContextPath()
        		+ "/uploads/" + fileName;

        Pet p = new Pet();

        p.setName(name);

        p.setBreed(breed);

        p.setCategory(category);

        p.setAge(age);

        p.setPrice(price);

        p.setImage(imagePath);

        PetDAO dao =
        new PetDAO();

        boolean status =
        dao.addPet(p);

        if(status){

            response.sendRedirect(
            "pages/managePets.jsp");
        }
        else{

            response.getWriter()
            .println("Pet Upload Failed");
        }
    }
}