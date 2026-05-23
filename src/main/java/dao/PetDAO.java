package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import model.Pet;

public class PetDAO {

    // ================= GET ALL PETS =================

    public List<Pet> getAllPets() {

        List<Pet> list =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM pets";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Pet p = new Pet();

                p.setId(
                rs.getInt("id"));

                p.setName(
                rs.getString("name"));

                p.setBreed(
                rs.getString("breed"));

                p.setCategory(
                rs.getString("category"));

                p.setAge(
                rs.getInt("age"));

                p.setPrice(
                rs.getDouble("price"));

                p.setImage(
                rs.getString("image"));

                list.add(p);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // ================= GET PET BY ID =================

    public Pet getPetById(int id) {

        Pet p = null;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM pets WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                p = new Pet();

                p.setId(
                rs.getInt("id"));

                p.setName(
                rs.getString("name"));

                p.setBreed(
                rs.getString("breed"));

                p.setCategory(
                rs.getString("category"));

                p.setAge(
                rs.getInt("age"));

                p.setPrice(
                rs.getDouble("price"));

                p.setImage(
                rs.getString("image"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return p;
    }

    // ================= GET PET IMAGE BY NAME =================

    public String getPetImageByName(String name){

        String image = "";

        try{

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT image FROM pets WHERE name=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1, name);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()){

                image =
                rs.getString("image");
            }

        }catch(Exception e){

            e.printStackTrace();
        }

        return image;
    }

    // ================= SEARCH PETS =================

    public List<Pet> searchPets(
    String keyword,
    String category) {

        List<Pet> list =
        new ArrayList<>();

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "SELECT * FROM pets WHERE name LIKE ?";

            if(category != null &&
            !category.equals("")) {

                sql +=
                " AND category=?";
            }

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(
            1,
            "%" + keyword + "%");

            if(category != null &&
            !category.equals("")) {

                ps.setString(
                2,
                category);
            }

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Pet p = new Pet();

                p.setId(
                rs.getInt("id"));

                p.setName(
                rs.getString("name"));

                p.setBreed(
                rs.getString("breed"));

                p.setCategory(
                rs.getString("category"));

                p.setAge(
                rs.getInt("age"));

                p.setPrice(
                rs.getDouble("price"));

                p.setImage(
                rs.getString("image"));

                list.add(p);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // ================= ADD PET =================

    public boolean addPet(Pet pet) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "INSERT INTO pets(name,breed,category,age,price,image) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1,
            pet.getName());

            ps.setString(2,
            pet.getBreed());

            ps.setString(3,
            pet.getCategory());

            ps.setInt(4,
            pet.getAge());

            ps.setDouble(5,
            pet.getPrice());

            ps.setString(6,
            pet.getImage());

            int rows =
            ps.executeUpdate();

            if(rows > 0) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // ================= DELETE PET =================

    public boolean deletePet(int id) {

        boolean status = false;

        try {

            Connection con =
            DBConnection.getConnection();

            String sql =
            "DELETE FROM pets WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows =
            ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }

    // ================= UPDATE PET =================

    public boolean updatePet(Pet p){

        boolean status = false;

        try{

            Connection con =
            DBConnection.getConnection();

            String sql =
            "UPDATE pets SET name=?,breed=?,category=?,age=?,price=?,image=? WHERE id=?";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ps.setString(1,
            p.getName());

            ps.setString(2,
            p.getBreed());

            ps.setString(3,
            p.getCategory());

            ps.setInt(4,
            p.getAge());

            ps.setDouble(5,
            p.getPrice());

            ps.setString(6,
            p.getImage());

            ps.setInt(7,
            p.getId());

            int rows =
            ps.executeUpdate();

            if(rows > 0){

                status = true;
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }
}