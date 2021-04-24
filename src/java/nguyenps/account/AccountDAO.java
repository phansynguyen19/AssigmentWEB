/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.account;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class AccountDAO implements Serializable{
    List<AccountDTO> listAccount;

    public List<AccountDTO> getListAccount() {
        return listAccount;
    }
    
    public AccountDTO checkLogin(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select ID ,FullName, IsAdmin From Account Where Username = ? COLLATE SQL_Latin1_General_CP1_CS_AS And Password = ? COLLATE SQL_Latin1_General_CP1_CS_AS";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Query Data
                rs = stm.executeQuery();
                //5. Process
                if (rs.next()) {
                    String lastname = rs.getString("FullName");
                    boolean role = rs.getBoolean("IsAdmin");
                    int id = rs.getInt("ID");
                    return new AccountDTO(id, username, password, lastname, role);
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

        return null;
    }
    
    public boolean createAccount(AccountDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Insert into Account (Username, Password, Fullname, IsAdmin) Values (?,?,?,?)";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getFullname());
                stm.setBoolean(4, dto.isRole());
                
                //4. Query Data
                int row = stm.executeUpdate();
                if (row > 0) {
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
