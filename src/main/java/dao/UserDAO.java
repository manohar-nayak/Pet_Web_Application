package dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import model.User;

public class UserDAO {

    public boolean registerUser(User user) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "INSERT INTO users(fullname,email,password,phone) VALUES(?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1,
                    user.getFullname());

            ps.setString(2,
                    user.getEmail());

            ps.setString(3,
                    user.getPassword());

            ps.setString(4,
                    user.getPhone());

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

    public boolean loginUser(String email,
                             String password) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                status = true;

            }

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;
    }
    
    public List<User> getAllUsers(){

        List<User> list =
        new ArrayList<>();

        try{

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM users";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()){

                User u =
                new User();

                u.setId(
                rs.getInt("id"));

                u.setFullname(
                rs.getString("fullname"));

                u.setEmail(
                rs.getString("email"));

                u.setPassword(
                rs.getString("password"));

                u.setPhone(
                rs.getString("phone"));

                list.add(u);
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return list;
    }
}