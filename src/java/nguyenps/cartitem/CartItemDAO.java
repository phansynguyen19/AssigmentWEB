/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.cartitem;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import nguyenps.product.ProductDTO;
import nguyenps.util.DBHelper;

/**
 *
 * @author Admin
 */
public class CartItemDAO implements Serializable{
    Map<ProductDTO, Float> item = new HashMap<>();

    public Map<ProductDTO, Float> getItem() {
        return item;
    }
    
    public boolean saveCartItemToDatabase(int cartID, int foodID, float quantity) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Order_Items (CartID, ProductID, Quantity) values (?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, cartID);
                stm.setInt(2, foodID);
                stm.setFloat(3, quantity);
                int row = stm.executeUpdate();
                if(row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
