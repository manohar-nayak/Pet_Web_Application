package controller;

import java.io.IOException;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(
    HttpServletRequest request,
    HttpServletResponse response)

    throws ServletException, IOException {

        try {

            HttpSession session =
            request.getSession();

            String username =
            (String)session.getAttribute("username");

            String fullname =
            request.getParameter("fullname");

            String petname =
            request.getParameter("petname");

            double total =
            Double.parseDouble(
            request.getParameter("total"));

            String payment =
            request.getParameter("payment");

            String phone =
            request.getParameter("phone");

            String address =
            request.getParameter("address");

            Order o =
            new Order();

            o.setUsername(username);

            o.setFullname(fullname);

            o.setPetname(petname);

            o.setTotal(total);

            o.setPayment(payment);

            o.setPhone(phone);

            o.setAddress(address);
            
            o.setStatus("Pending");

            OrderDAO dao =
            new OrderDAO();

            boolean status =
            dao.placeOrder(o);

            if(status){

                response.sendRedirect(
                "pages/orders.jsp");
            }
            else{

                response.getWriter().println(
                "Order Failed");
            }

        }
        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);
        }
    }
}