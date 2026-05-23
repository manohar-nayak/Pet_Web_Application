package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import model.Wishlist;

public class WishlistDAO {

    public boolean addWishlist(Wishlist w) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "INSERT INTO wishlist(username,petId,petname,price,image) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1,
            w.getUsername());

            ps.setInt(2,
            w.getPetId());

            ps.setString(3,
            w.getPetname());

            ps.setDouble(4,
            w.getPrice());

            ps.setString(5,
            w.getImage());

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

    public List<Wishlist> getWishlistItems(
    String username) {

        List<Wishlist> list =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM wishlist WHERE username=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Wishlist w =
                new Wishlist();

                w.setId(
                rs.getInt("id"));

                w.setUsername(
                rs.getString("username"));

                w.setPetId(
                rs.getInt("petId"));

                w.setPetname(
                rs.getString("petname"));

                w.setPrice(
                rs.getDouble("price"));

                w.setImage(
                rs.getString("image"));

                list.add(w);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    public boolean removeWishlist(int id) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "DELETE FROM wishlist WHERE id=?";

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
}