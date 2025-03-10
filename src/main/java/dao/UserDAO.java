/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Users;
import utils.DBContext;

/**
 *
 * @author giaph
 */
public class UserDAO extends DBContext {

    public String hashMD5(String pass) {
        try {
            MessageDigest mes = MessageDigest.getInstance("MD5");
            byte[] mesMD5 = mes.digest(pass.getBytes());
            StringBuilder str = new StringBuilder();
            for (byte b : mesMD5) {
                String ch = String.format("%02x", b);
                str.append(ch);
            }
            return str.toString();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

    public boolean registerUser(Users user) {
        String sql = "INSERT INTO Users (RollNumber, Password, FullName, PhoneNumber, Address, Email, RoleID) VALUES (?, ?, ?, ?, ?, ?, 1)";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getRollNumber());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getPhonenumber());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getEmail());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng được thêm vào
        } catch (Exception e) {
            System.out.println("Register error: " + e.getMessage());
            return false; // Trả về false nếu có lỗi
        }
    }

    public Users verifyMD5(String rollNumber, String password) {
        String sql = "SELECT * FROM Users WHERE RollNumber = ? AND Password = ?";
        try ( PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, rollNumber);
            ps.setString(2, hashMD5(password));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("RollNumber"),
                        rs.getString("Password"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getInt("RoleID")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isFullNameExists(String fullName) {
        String sql = "SELECT COUNT(*) FROM Users WHERE fullName = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, fullName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu tìm thấy fullName trong DB
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu tìm thấy email trong DB
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
