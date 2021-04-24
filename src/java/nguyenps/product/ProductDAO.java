/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.product;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyenps.util.DBHelper;

/**
 *
 * @author Admin
 */
public class ProductDAO implements Serializable{
    public List<ProductDTO> searchProduct(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<ProductDTO> list = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity, Status From Products Where ProductName Like ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                list = new ArrayList<>();
                while (rs.next()) {
                    int productID = rs.getInt("ProductID");
                    String productName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    boolean status = rs.getBoolean("Status");
                    ProductDTO dto = new ProductDTO(productID, productName, image, description, price, createDate, categoryID, quantity, status);
                    
                    list.add(dto);
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return list;
    }
    public List<ProductDTO> getAllProduct() throws SQLException, NamingException {
        List<ProductDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity From Products Where Status = 1";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Query Data
                rs = stm.executeQuery();
                result = new ArrayList<>();
                //5. Process
                while(rs.next()) {
                    int foodID = rs.getInt("ProductID");
                    String foodName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    ProductDTO dto = new ProductDTO(foodID, foodName, image, description, price, createDate, categoryID, quantity, true);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return result;
    }
    public List<ProductDTO> getAll1() throws SQLException, NamingException {
        List<ProductDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select top 4 ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity From Products Where Status = 1 And CategoryID = 1 And Quantity > 0 ORDER BY CreateDate DESC";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Query Data
                rs = stm.executeQuery();
                result = new ArrayList<>();
                //5. Process
                while(rs.next()) {
                    int foodID = rs.getInt("ProductID");
                    String foodName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    ProductDTO dto = new ProductDTO(foodID, foodName, image, description, price, createDate, categoryID, quantity, true);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return result;
    }
    public ProductDTO findProductByID(int id) throws SQLException, NamingException {
        ProductDTO result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity From Products Where FoodID = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                //4. Query Data
                rs = stm.executeQuery();
                //5. Process
                if(rs.next()) {
                    int foodID = rs.getInt("ProductID");
                    String foodName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    result = new ProductDTO(foodID, foodName, image, description, price, createDate, categoryID, quantity, true);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return result;
    }
    public List<ProductDTO> getAll2() throws SQLException, NamingException {
        List<ProductDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select top 3 ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity From Products Where Status = 1 And CategoryID = 2 And Quantity > 0 ORDER BY CreateDate DESC";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Query Data
                rs = stm.executeQuery();
                result = new ArrayList<>();
                //5. Process
                while(rs.next()) {
                    int foodID = rs.getInt("ProductID");
                    String foodName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    ProductDTO dto = new ProductDTO(foodID, foodName, image, description, price, createDate, categoryID, quantity, true);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return result;
    }
    
    public List<ProductDTO> getAll3() throws SQLException, NamingException {
        List<ProductDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select top 3 ProductID, ProductName, Image, Description, Price, CreateDate, CategoryID, Quantity From Products Where Status = 1 And CategoryID = 3 And Quantity > 0 ORDER BY CreateDate DESC";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Query Data
                rs = stm.executeQuery();
                result = new ArrayList<>();
                //5. Process
                while(rs.next()) {
                    int foodID = rs.getInt("ProductID");
                    String foodName = rs.getString("ProductName");
                    String image = rs.getString("Image");
                    String description = rs.getString("Description");
                    float price = rs.getFloat("Price");
                    Date createDate = rs.getDate("CreateDate");
                    int categoryID = rs.getInt("CategoryID");
                    int quantity = rs.getInt("Quantity");
                    ProductDTO dto = new ProductDTO(foodID, foodName, image, description, price, createDate, categoryID, quantity, true);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return result;
    }
    
    public boolean updateQuantity(int id, int quantity) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Products Set Quantity = ? Where ProductID = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, quantity);
                pst.setInt(2, id);
                boolean row = pst.executeUpdate() > 0;
                if (row) {
                    return true;
                }
            }

        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
