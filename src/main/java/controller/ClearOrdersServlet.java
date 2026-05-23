package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clearOrders")
public class ClearOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/petshop",
                    "root",
                    "Manu@181103"
            );

            // Delete all orders
            ps = con.prepareStatement(
                    "DELETE FROM orders"
            );

            ps.executeUpdate();

            // Redirect back to orders page
            response.sendRedirect(
                    request.getContextPath() + "/pages/orders.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error while clearing orders."
            );

        } finally {

            try {

                if (ps != null) {
                    ps.close();
                }

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}