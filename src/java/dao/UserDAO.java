/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Models.Users;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public UserDAO() {
        connectDB();
    }

    //Khai báo các thành phần xử lý DB
    Connection cnn; //Kết nối DB
    PreparedStatement stm; //Thực hiện các câu lệnh sql
    ResultSet rs; //Lưu trữ và xử lý dữ liệu

    private void connectDB() {
        cnn = connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public boolean checkUser(String account, String password) {
        try {
            String strSQL = "SELECT * FROM Users WHERE account = ? and password = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    public String getUserByAccount(String account) {
        try {
            String strSQL = "SELECT * FROM Users WHERE account = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(3);
            }
        } catch (SQLException e) {
            System.out.println("getUserByAccount:" + e.getMessage());
        }
        return "";
    }

    public String insertUser(String account, String password, String name) {
        try {
            String strSQL = "INSERT INTO Users(account, password, name, gender, address, phone, dateofbirth, [group]) VALUES (?, ?, ?, null, null, null, null, 'user')";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return "Tài khoản đã tồn tại hoặc có lỗi xảy ra với Database";
        }
        return "Tạo tài khoản thành công, xin mời đăng nhập";
    }

    public Users getUsersByAccount(String account) {
        Users u = new Users();

        try {
            String strSQL = "SELECT * FROM Users WHERE account = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            rs = stm.executeQuery();
            while (rs.next()) {
                String password = rs.getString(2);
                String name = rs.getString(3);
                String gender = String.valueOf(rs.getBoolean(4));
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String dob = String.valueOf(rs.getDate(7));
                String group = rs.getString(8);
                System.out.println(account + ", " + password + ", " + name + ", " + gender + ", " + address + ", " + phone + ", " + dob + ", " + group);
                u = new Users(account, password, name, gender, address, phone, dob, group);
            }
        } catch (SQLException e) {
            System.out.println("getUsersByAccount:" + e.getMessage());
        }
        return u;
    }

    public String updateUser(String account, String password, String name, String gender, String address, String phone, String dob) {
        try {
            if (account == "" | password == "" | name == "") {
                throw new SQLException();
            }
            String strSQL = "UPDATE Users SET [password] = ?, [name] = ?, [gender] = ?, [address] = ?, phone = ?, dateofbirth = ? WHERE account = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, password);
            stm.setString(2, name);
            stm.setInt(3, Integer.parseInt(gender));
            stm.setString(4, address);
            stm.setString(5, phone);
            stm.setString(6, dob);
            stm.setString(7, account);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateUser:" + e);
            return "Cập nhật thông tin thất bại";
        }
        return "Cập nhật thông tin thành công";
    }

    public ArrayList<Users> getUsers() {
        ArrayList<Users> data = new ArrayList<Users>();

        try {
            String strSQL = "SELECT * FROM Users";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String account = rs.getString(1);
                String password = rs.getString(2);
                String name = rs.getString(3);
                String gender = "male";
                if (rs.getBoolean(4) == false) {
                    gender = "female";
                }
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String dob = rs.getString(7);
                String group = rs.getString(8);
                Users u = new Users(account, password, name, gender, address, phone, dob, group);
                data.add(u);
            }
        } catch (SQLException e) {
            System.out.println("getUser:" + e.getMessage());
        }
        return data;
    }

    public boolean checkAdmin(String account) {
        try {
            String strSQL = "SELECT * FROM Users WHERE account = ? AND [group] = 'admin'";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkAdmin:" + e.getMessage());
        }
        return false;
    }
    
    public void insertUserAsAdmin (String account, String password, String name, String gender, String address, String phone, String dob, String group) {
        try {
            String strSQL = "INSERT INTO Users(account, password, name, gender, address, phone, dateofbirth, [group]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.setInt(4, Integer.parseInt(gender));
            stm.setString(5, address);
            stm.setString(6, phone);
            stm.setString(7, dob);
            stm.setString(8, group);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteUser (String account) {
        try {
            String strSQL = "DELETE FROM Users WHERE account = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateUserAsAdmin (String account, String password, String name, String gender, String address, String phone, String dob, String group, String acc) {
        try {
            String strSQL = "UPDATE Users SET account = ?, [password] = ?, [name] = ?, gender = ?, address = ?, phone = ?, dateofbirth = ?, [group] = ? WHERE account = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            stm.setString(3, name);
            stm.setInt(4, Integer.parseInt(gender));
            stm.setString(5, address);
            stm.setString(6, phone);
            stm.setString(7, dob);
            stm.setString(8, group);
            stm.setString(9, acc);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
