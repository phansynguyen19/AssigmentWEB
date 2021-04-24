/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.category;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class CategoryDAO implements Serializable{
    
    
    public List<CategoryDTO> getAllCategory() throws SQLException, NamingException {
        List<CategoryDTO> result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = nguyenps.util.DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select CategoryID, CategoryName From Category";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                //4. Query Data
                rs = stm.executeQuery();
                result = new ArrayList<>();
                //5. Process
                while(rs.next()) {
                    int categoryID = rs.getInt("CategoryID");
                    String categoryName = rs.getString("CategoryName");
                    CategoryDTO dto = new CategoryDTO(categoryID, categoryName);
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
}
