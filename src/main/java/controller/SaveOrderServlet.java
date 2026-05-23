package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/saveOrder")
public class SaveOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
                response.getWriter();

        String username =
                request.getParameter("username");

        String pet =
                request.getParameter("pet");

        String amount =
                request.getParameter("amount");

        String address =
                request.getParameter("address");

        String phone =
                request.getParameter("phone");

        try {

            // MYSQL DRIVER

            Class.forName(
                    "com.mysql.cj.jdbc.Driver");

            // DATABASE CONNECTION

            Connection con =
                    DriverManager.getConnection(

                            "jdbc:mysql://localhost:3306/petshop",
                            "root",
                            "Manu@181103"
                    );

            // INSERT QUERY

            PreparedStatement ps =
                    con.prepareStatement(

                            "INSERT INTO orders(username,petname,quantity,total,address,phone,payment,fullname,status) VALUES(?,?,?,?,?,?,?,?,?)"
                    );

            ps.setString(1, username);

            ps.setString(2, pet);

            ps.setInt(3, 1);

            ps.setDouble(4,
                    Double.parseDouble(amount));

            ps.setString(5, address);

            ps.setString(6, phone);

            ps.setString(7, "Razorpay");

            ps.setString(8, username);

            ps.setString(9, "Pending");

            int result =
                    ps.executeUpdate();

            if(result > 0){

                response.sendRedirect(

                        "pages/paymentSuccess.jsp?pet=" +

                                pet +

                                "&amount=" +

                                amount
                );

            }else{

                out.println(

                        "<h1>Order Save Failed</h1>"
                );
            }

            con.close();

        }

        catch (Exception e) {

            out.println(

                    "<h2>ERROR:</h2>"
            );

            e.printStackTrace(out);
        }
    }
}