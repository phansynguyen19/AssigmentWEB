/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.cart;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import nguyenps.util.DBHelper;

/**
 *
 * @author Admin
 */
public class CartDAO implements Serializable{
    private Map<Integer, Integer> items;
    
    public Map<Integer, Integer> getItems() {
        return items;
    }
    
    public void addItemToCart(int title, int quantityInput) {
        //1. kiem tra ngan ton tai hay chua
        if(this.items == null) {
            this.items = new  HashMap<>();
        } // end if item not exits
        //2. kiem tra co chau do chua
        int quantity = quantityInput;
        if(this.items.containsKey(title)) {
            quantity = this.items.get(title) + quantityInput;
        }// end if item is exits
        this.items.put(title, quantity);
    }
    public void updateItemToCart(int title, int quantityInput) {
        //1. kiem tra ngan ton tai hay chua
        if(this.items == null) {
            this.items = new  HashMap<>();
        } // end if item not exits
        //2. kiem tra co chau do chua
        //int quantity = quantityInput;
        if(this.items.containsKey(title)) {
            //quantity = this.items.get(title) + quantityInput;
            this.items.put(title, quantityInput);
        }// end if item is exits
        
    }
    public void removeItemFromCart(int title) {
        if(this.items == null) {
            return;
        }
        
        if(this.items.containsKey(title)) {
            this.items.remove(title);
            if(this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
    
    public int saveCartToDatabase(float total, int userID, Timestamp date) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Orders (Total, UserID, Date, Status) OUTPUT Inserted.OrderID values (?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setFloat(1, total);
                stm.setInt(2, userID);
                stm.setTimestamp(3, date);
                stm.setBoolean(4, true);
                
                rs = stm.executeQuery();
                if(rs.next()) {
                    id = rs.getInt("OrderID");
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
        return id;
    }
}
