/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Models.CartProducts;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CartDAO extends DBContext {

    public CartDAO() {
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

    public void updateCart(String user, String productid, String ammount) {
        try {
            String strSQL = "EXEC updateCart @user = ?, @id = ?, @amount = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            stm.setString(2, productid);
            stm.setString(3, ammount);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getAmount(String user, String id) {
        int count = 0;
        int amount = -1;
        try {
            String strSQL = "SELECT c.amount FROM Cart c join Products p ON c.productid = p.id WHERE c.[user] = ? AND c.productid = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            stm.setString(2, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                amount = rs.getInt(1);
                count = count++;
                if (count > 1) {
                    throw new SQLException("Có nhiều hơn 1 sản phẩm cùng id trong database");
                }
            }
        } catch (SQLException e) {
            System.out.println("getCartProduct:" + e.getMessage());
            return -1;
        }
        return amount;
    }

    public ArrayList<CartProducts> getCartProduct(String user) {
        ArrayList<CartProducts> data = new ArrayList<CartProducts>();

        try {
            String strSQL = "SELECT p.id, p.name, p.price, p.image, p.description, ct.name, c.amount FROM Cart c join Products p ON c.productid = p.id join Categories ct ON p.categoryid = ct.id WHERE c.[user] = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            rs = stm.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                String amount = String.valueOf(rs.getInt(7));
                String cost = String.valueOf(rs.getFloat(7) * rs.getFloat(3)) + "$";
                CartProducts pc = new CartProducts(Id, name, price, image, description, category, amount, cost);
                data.add(pc);
            }
        } catch (SQLException e) {
            System.out.println("getCartProduct:" + e.getMessage());
        }
        return data;
    }

    public String getTotalCost(String user) {
        String TotalCost = "0";
        try {
            String strSQL = "SELECT SUM(p.price*c.amount) FROM Products p join Cart c ON p.id = c.productid WHERE c.[user] = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            rs = stm.executeQuery();
            while (rs.next()) {
                TotalCost = String.valueOf(rs.getFloat(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
            return "Có lỗi xảy ra";
        }
        return TotalCost + "$";
    }

    public String countNumOfProducts(String user) {
        String NoOfProducts = "";
        try {
            String strSQL = "SELECT count(productid) FROM Cart WHERE [user] = ? GROUP BY [user]";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            rs = stm.executeQuery();
            while (rs.next()) {
                NoOfProducts = "(" + String.valueOf(String.valueOf(rs.getInt(1))) + ")";
            }
        } catch (SQLException e) {
            System.out.println(e);
            return "(?)";
        }
        return NoOfProducts;
    }

    public void deleteCartProducts(String user, String productid) {
        try {
            String strSQL = "DELETE FROM Cart WHERE [user] = ? AND productid = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            stm.setInt(2, Integer.parseInt(productid));
            System.out.println(user + ", " + productid);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCart(String user) {
        try {
            String strSQL = "DELETE FROM Cart WHERE [user] = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAmount(String user, String productid, String amount) {
        try {
            String strSQL = "UPDATE Cart SET amount = ? WHERE [user] = ? AND productid = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(amount));
            stm.setString(2, user);
            stm.setInt(3, Integer.parseInt(productid));
            stm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(user + ", " + productid + ", " + amount);
    }
}
