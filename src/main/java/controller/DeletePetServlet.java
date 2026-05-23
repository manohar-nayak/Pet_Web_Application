package controller;

import java.io.IOException;

import dao.PetDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletePet")
public class DeletePetServlet
extends HttpServlet {

    protected void doGet(
    HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException,
    IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id"));

        PetDAO dao =
        new PetDAO();

        dao.deletePet(id);

        response.sendRedirect(
        "pages/managePets.jsp");
    }
}