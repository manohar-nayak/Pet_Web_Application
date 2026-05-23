package model;

public class Wishlist {
	
	private int petId;

    private int id;

    private String username;

    private String petname;

    private double price;

    private String image;

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {

        this.username = username;
    }

    public String getPetname() {

        return petname;
    }

    public void setPetname(String petname) {

        this.petname = petname;
    }

    public double getPrice() {

        return price;
    }

    public void setPrice(double price) {

        this.price = price;
    }

    public String getImage() {

        return image;
    }

    public void setImage(String image) {

        this.image = image;
    }
    
    public int getPetId() {

        return petId;
    }

    public void setPetId(int petId) {

        this.petId = petId;
    }
}