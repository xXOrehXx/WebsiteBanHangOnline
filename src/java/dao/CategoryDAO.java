/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Models.Categories;
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
public class CategoryDAO extends DBContext {

    public CategoryDAO() {
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

   public ArrayList<Categories> getCategories() {
        ArrayList<Categories> data = new ArrayList<Categories>();

        try {
            String strSQL = "SELECT * FROM Categories";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                Categories c = new Categories(id, name);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("getCategories:" + e.getMessage());
        }
        return data;
    }
}
