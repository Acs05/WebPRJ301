package models;

import database.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO implements Serializable{
    DBUtil db = new DBUtil();
    
    public boolean checkLogin(String username, String password) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = db.makeConnection();
            if (con != null) {
                String sql = "Select * From "
                        +"Customer Where Username = ? and Password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }
    
    public boolean createAccount(String username, String password,String firstName,String lastName) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = db.makeConnection();
            if(con != null) {
                String sql = "Insert into Customer "
                        + "values (?,?,?,?,0)";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, firstName);
                stm.setString(4, lastName);
                int rs = stm.executeUpdate();
                
                if(rs > 0) {
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
