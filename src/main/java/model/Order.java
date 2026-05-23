package model;

public class Order {

    private int id;

    private String username;

    private String fullname;

    private String petname;

    private double total;

    private String payment;
    
    private String status;

    private String phone;

    private String address;
    

    // ID

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    // USERNAME

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {

        this.username = username;
    }

    // FULL NAME

    public String getFullname() {

        return fullname;
    }

    public void setFullname(String fullname) {

        this.fullname = fullname;
    }

    // PET NAME

    public String getPetname() {

        return petname;
    }

    public void setPetname(String petname) {

        this.petname = petname;
    }

    // TOTAL

    public double getTotal() {

        return total;
    }

    public void setTotal(double total) {

        this.total = total;
    }

    // PAYMENT

    public String getPayment() {

        return payment;
    }

    public void setPayment(String payment) {

        this.payment = payment;
    }
    
    public String getStatus() {

        return status;
    }

    public void setStatus(String status) {

        this.status = status;
    }

    // PHONE

    public String getPhone() {

        return phone;
    }

    public void setPhone(String phone) {

        this.phone = phone;
    }

    // ADDRESS

    public String getAddress() {

        return address;
    }

    public void setAddress(String address) {

        this.address = address;
    }
}