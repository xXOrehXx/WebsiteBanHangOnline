/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Models.Categories;
import Models.HomeProducts;
import Models.Products;
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import jdk.jfr.Description;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public ProductDAO() {
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

    boolean isInCart;

    public void checkCart(String id, String user) {
        isInCart = false;
        try {
            String strSQL = "SELECT * FROM Cart WHERE productid = ? AND [user] = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            stm.setString(2, user);
            rs = stm.executeQuery();
            while (rs.next()) {
                isInCart = true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<HomeProducts> getHomeProductsUsers(String user) {
        ArrayList<HomeProducts> data = new ArrayList<HomeProducts>();

        try {
            int count = 0;
            String strSQL = """
                            WITH CTE AS (
                                SELECT p.id, p.name, p.price, p.image, p.description, c.name AS category_name, ct.[user],
                                ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY ct.[user]) AS rn
                                FROM Products p
                                JOIN Categories c ON p.categoryid = c.id 
                                LEFT OUTER JOIN Cart ct ON p.id = ct.productid
                            )
                            SELECT TOP 8 id, name, price, image, description, category_name, [user]
                            FROM CTE
                            WHERE [user] = ? OR [user] IS NULL OR rn = 1
                            ORDER BY id DESC""";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, user);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                String inCart = "";
                if (rs.getString(7) != null && rs.getString(7).equals(user)) {
                    inCart = "style=\"color: red\"";
                }
                HomeProducts hp = new HomeProducts(inCart, id, name, price, image, description, category);
                data.add(hp);
                count++;
                System.out.println(count);
            }
        } catch (SQLException e) {
            System.out.println("getHomeProductsUsers:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<HomeProducts> getHomeProducts() {
        ArrayList<HomeProducts> data = new ArrayList<HomeProducts>();

        try {
            int count = 0;
            String strSQL = """
                            WITH CTE AS (
                                SELECT p.id, p.name, p.price, p.image, p.description, c.name AS category_name, ct.[user],
                                ROW_NUMBER() OVER (PARTITION BY p.id ORDER BY ct.[user]) AS rn
                                FROM Products p
                                JOIN Categories c ON p.categoryid = c.id 
                                LEFT OUTER JOIN Cart ct ON p.id = ct.productid 
                            )
                            SELECT TOP 8 id, name, price, image, description, category_name, [user]
                            FROM CTE
                            WHERE rn = 1
                            ORDER BY id DESC""";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                String inCart = "";
                HomeProducts hp = new HomeProducts(inCart, id, name, price, image, description, category);
                data.add(hp);
                count++;
                System.out.println(count);
            }
        } catch (SQLException e) {
            System.out.println("getHomeProducts:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Products> getProductByName(String name) {
        ArrayList<Products> data = new ArrayList<Products>();

        try {
            String strSQL = "SELECT * FROM Products p join Categories c ON p.categoryid = c.id AND ProductName like ?";
            stm = cnn.prepareStatement(strSQL);
            name = "%" + name + "%";
            stm.setString(1, name);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String Name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                Products p = new Products(id, Name, price, image, description, category);
                data.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getProductByName:" + e.getMessage());
        }
        return data;
    }

    public Products getProductById(String id) {
        Products p = new Products();
        try {
            String strSQL = "SELECT * FROM Products p join Categories c ON p.CategoryID = c.id WHERE p.id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            rs = stm.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = String.valueOf(rs.getInt(6));
                p = new Products(Id, name, price, image, description, category);
            }
        } catch (SQLException e) {
            System.out.println("getProductById:" + e.getMessage());
        }
        return p;
    }

    public ArrayList<Products> getRandomProducts() {
        ArrayList<Products> data = new ArrayList<Products>();

        try {
            String strSQL = "SELECT TOP 4 * FROM Products ORDER BY NEWID()";
            stm = cnn.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                Products p = new Products(Id, name, price, image, description, category);
                data.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getRandomProducts:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Products> getProductByCategories(String categoryid) {
        ArrayList<Products> data = new ArrayList<Products>();

        try {
            String strSQL = "SELECT * FROM Products WHERE categoryid = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(categoryid));
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                Products p = new Products(id, name, price, image, description, category);
                data.add(p);
            }
        } catch (SQLException e) {
            System.out.println("getProductByCategories:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Categories> getOtherCategories(String categoryid) {
        ArrayList<Categories> data = new ArrayList<Categories>();
        try {
            String strSQL = "SELECT * FROM Categories WHERE NOT id = ?";
            stm = cnn.prepareStatement(strSQL);
            if (categoryid == "") {
                stm.setString(1, categoryid);
            } else {
                stm.setInt(1, Integer.parseInt(categoryid));
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                Categories c = new Categories(Id, name);
                data.add(c);
            }
        } catch (SQLException e) {
            System.out.println("getOtherCategories:" + e.getMessage());
        }
        return data;
    }

    public String getCategory(String categoryid) {
        String name = "???";
        try {
            String strSQL = "SELECT [name] FROM Categories WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(categoryid));
            rs = stm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("getCategory:" + e.getMessage());
        }
        return name;
    }

    public ArrayList<Products> searchProductByCategories(String search, String categoryid) {
        ArrayList<Products> data = new ArrayList<Products>();

        try {
            String strSQL = "SELECT * FROM Products WHERE [name] LIKE ? AND categoryid = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, "%" + search + "%");
            stm.setInt(2, Integer.parseInt(categoryid));
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                Products p = new Products(id, name, price, image, description, category);
                data.add(p);
            }
        } catch (SQLException e) {
            System.out.println("searchProductByCategories:" + e.getMessage());
        }
        return data;
    }

    public ArrayList<Products> searchProduct(String search) {
        ArrayList<Products> data = new ArrayList<Products>();

        try {
            String strSQL = "SELECT * FROM Products WHERE [name] LIKE ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, "%" + search + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String price = String.valueOf(rs.getFloat(3)) + "$";
                String image = rs.getString(4);
                String description = rs.getString(5);
                String category = rs.getString(6);
                Products p = new Products(id, name, price, image, description, category);
                data.add(p);
            }
        } catch (SQLException e) {
            System.out.println("searchProduct:" + e.getMessage());
        }
        return data;
    }

    public void deleteProduct(String id) {
        try {
            String strSQL = "DELETE FROM Products WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            rs = stm.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(String id, String name, String price, String image, String description, String category, String ID) {
        try {
            String strSQL = "UPDATE Products SET id = ?, [name] = ?, price = ?, [image] = ?, [description] = ?, categoryid = ? WHERE id = ?";
            stm = cnn.prepareStatement(strSQL);
            stm.setInt(1, Integer.parseInt(id));
            stm.setString(2, name);
            stm.setFloat(3, Float.parseFloat(price));
            stm.setString(4, image);
            stm.setString(5, description);
            stm.setString(6, category);
            stm.setInt(7, Integer.parseInt(ID));
            rs = stm.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProduct(String name, String price, String image, String description, String category) {
        try {
            String strSQL = "INSERT INTO Products([name], price, [image], [description], categoryid) VALUES (?, ?, ?, ?, ?)";
            stm = cnn.prepareStatement(strSQL);
            stm.setString(1, name);
            stm.setFloat(2, Float.parseFloat(price));
            stm.setString(3, image);
            stm.setString(4, description);
            stm.setInt(5, Integer.parseInt(category));
            stm.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
