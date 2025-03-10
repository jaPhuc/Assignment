/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author giaph
 */
public class Users {
//    UserID INT PRIMARY KEY IDENTITY(1,1),
//	RollNumber VARCHAR(8) UNIQUE NOT NULL,
//	Password VARCHAR(255) NOT NULL,
//    FullName VARCHAR(255) NOT NULL,
//    PhoneNumber VARCHAR(20),
//    Address TEXT,
//    Email VARCHAR(255),
//	Role VARCHAR(10)

    private int userID;
    private String rollNumber;
    private String password;
    private String fullname;
    private String phonenumber;
    private String address;
    private String email;
    private int roleID;

    public Users() {
        this.userID = -1;
        this.rollNumber = "";
        this.password = "";
        this.fullname = "";
        this.roleID = 1;
    }

    public Users(String rollNumber, String password, String fullname, String phonenumber, String address, String email, int roleID) {
        this.rollNumber = rollNumber;
        this.password = password;
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
    }

    public Users(int userID, String rollNumber, String password, String fullname, String phonenumber, String address, String email, int roleID) {
        this.userID = userID;
        this.rollNumber = rollNumber;
        this.password = password;
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

}
