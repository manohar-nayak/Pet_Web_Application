package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import db.DBConnection;

import model.Cart;

public class CartDAO {

    /* ADD TO CART */

    public boolean addToCart(String name,
                             double price,
                             String image) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            /* CHECK ITEM EXISTS */

            String checkSql =
            "SELECT * FROM cart WHERE name=?";

            PreparedStatement checkPs =
            con.prepareStatement(checkSql);

            checkPs.setString(1, name);

            ResultSet rs =
            checkPs.executeQuery();

            /* UPDATE QUANTITY */

            if(rs.next()) {

                int quantity =
                rs.getInt("quantity");

                quantity++;

                String updateSql =
                "UPDATE cart SET quantity=? WHERE name=?";

                PreparedStatement updatePs =
                con.prepareStatement(updateSql);

                updatePs.setInt(1, quantity);

                updatePs.setString(2, name);

                int rows =
                updatePs.executeUpdate();

                if(rows > 0){

                    status = true;
                }

            }
            else {

                /* INSERT NEW ITEM */

                String insertSql =
                "INSERT INTO cart(name,price,image,quantity) VALUES(?,?,?,?)";

                PreparedStatement insertPs =
                con.prepareStatement(insertSql);

                insertPs.setString(1, name);

                insertPs.setDouble(2, price);

                insertPs.setString(3, image);

                insertPs.setInt(4, 1);

                int rows =
                insertPs.executeUpdate();

                if(rows > 0) {

                    status = true;
                }
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    /* GET CART ITEMS */

    public List<Cart> getCartItems() {

        List<Cart> list =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM cart";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Cart c =
                new Cart();

                c.setId(
                rs.getInt("id"));

                c.setName(
                rs.getString("name"));

                c.setPrice(
                rs.getDouble("price"));

                c.setImage(
                rs.getString("image"));

                c.setQuantity(
                rs.getInt("quantity"));

                list.add(c);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    /* REMOVE CART ITEM */

    public boolean removeCartItem(int id) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "DELETE FROM cart WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows =
            ps.executeUpdate();

            if(rows > 0) {

                status = true;
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    /* TOTAL PRICE */

    public double getTotalPrice() {

        double total = 0;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT SUM(price * quantity) AS total FROM cart";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                total =
                rs.getDouble("total");
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return total;
    }

    /* CLEAR CART */

    public boolean clearCart() {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "DELETE FROM cart";

            PreparedStatement ps =
            con.prepareStatement(sql);

            int rows =
            ps.executeUpdate();

            if(rows >= 0){

                status = true;
            }

        }
        catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }
}