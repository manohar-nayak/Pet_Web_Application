package model;

public class Pet {

    private int id;
    private String name;
    private String breed;
    private String category;
    private int age;
    private double price;
    private String image;

    public Pet() {

    }

    public Pet(int id,
               String name,
               String breed,
               String category,
               int age,
               double price,
               String image) {

        this.id = id;
        this.name = name;
        this.breed = breed;
        this.category = category;
        this.age = age;
        this.price = price;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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
}