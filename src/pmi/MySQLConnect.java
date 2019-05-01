/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pmi;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Haris
 */
public class MySQLConnect {
    Connection conn = null;
    public static Connection ConnectDb(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tugas_sbd2_ganti?useSSL=false", "root", "");
            return conn;
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        }   
    }
    
}
