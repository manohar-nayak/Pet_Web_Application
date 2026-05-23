package controller;

import java.io.IOException;

import dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email =
            request.getParameter("email");

            String password =
            request.getParameter("password");

            /* ADMIN LOGIN */

            if(email.equals("admin@gmail.com")
            && password.equals("admin123")) {

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "username",
                "Admin");

                response.sendRedirect(
                "pages/adminDashboard.jsp");

                return;
            }

            /* USER LOGIN */

            UserDAO dao =
            new UserDAO();

            boolean status =
            dao.loginUser(
            email,
            password);

            if(status) {

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "username",
                email);

                response.sendRedirect(
                "pages/pets.jsp");
            }
            else {

                response.sendRedirect(
                "pages/login.jsp");
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }
    }
}