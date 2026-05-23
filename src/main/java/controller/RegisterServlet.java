package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullname =
                request.getParameter("fullname");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String phone =
                request.getParameter("phone");

        User user =
                new User(fullname,
                         email,
                         password,
                         phone);

        UserDAO dao =
                new UserDAO();

        boolean status =
                dao.registerUser(user);

        if(status) {

            response.sendRedirect(
                    "pages/login.jsp"
            );

        }
        else {

            response.getWriter().println(
                    "Registration Failed"
            );

        }
    }
}