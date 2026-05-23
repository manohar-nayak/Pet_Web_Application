package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import model.Order;

public class OrderDAO {

    // PLACE ORDER

    public boolean placeOrder(Order o) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            		"INSERT INTO orders(username,fullname,petname,total,payment,phone,address,status) VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1,
            o.getUsername());

            ps.setString(2,
            o.getFullname());

            ps.setString(3,
            o.getPetname());

            ps.setDouble(4,
            o.getTotal());

            ps.setString(5,
            o.getPayment());

            ps.setString(6,
            o.getPhone());

            ps.setString(7,
            o.getAddress());
            
            ps.setString(8,
            o.getStatus());

            int row =
            ps.executeUpdate();

            if(row > 0){

                status = true;
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }

    // GET ALL ORDERS

    public List<Order> getAllOrders() {

        List<Order> list =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM orders ORDER BY id DESC";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Order o =
                new Order();

                o.setId(
                rs.getInt("id"));

                o.setUsername(
                rs.getString("username"));

                o.setFullname(
                rs.getString("fullname"));

                o.setPetname(
                rs.getString("petname"));

                o.setTotal(
                rs.getDouble("total"));

                o.setPayment(
                rs.getString("payment"));

                o.setPhone(
                rs.getString("phone"));

                o.setAddress(
                rs.getString("address"));
                
                o.setStatus(
                rs.getString("status"));

                list.add(o);
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }

        return list;
    }

    // DELETE ORDER

    public boolean deleteOrder(int id) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "DELETE FROM orders WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, id);

            int row =
            ps.executeUpdate();

            if(row > 0){

                status = true;
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }

    // TOTAL REVENUE

    public double getTotalRevenue() {

        double total = 0;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT SUM(total) AS revenue FROM orders";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                total =
                rs.getDouble("revenue");
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }

        return total;
    }
    
    public void updateStatus(
    		int id,
    		String status) {

    		    try {

    		        Connection con =
    		        DBConnection.getConnection();

    		        String query =
    		        "UPDATE orders SET status=? WHERE id=?";

    		        PreparedStatement ps =
    		        con.prepareStatement(query);

    		        ps.setString(1,
    		        status);

    		        ps.setInt(2,
    		        id);

    		        ps.executeUpdate();

    		    }
    		    catch(Exception e){

    		        e.printStackTrace();
    		    }
    		}
    public void updateOrderStatus(
    		int id,
    		String status) {

    		    try {

    		        Connection con =
    		        DBConnection.getConnection();

    		        String sql =
    		        "update orders set status=? where id=?";

    		        PreparedStatement ps =
    		        con.prepareStatement(sql);

    		        ps.setString(1, status);

    		        ps.setInt(2, id);

    		        ps.executeUpdate();

    		    } catch(Exception e) {

    		        e.printStackTrace();
    		    }
    		}
}