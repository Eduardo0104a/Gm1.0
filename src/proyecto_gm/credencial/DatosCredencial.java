/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.credencial;
import java.awt.Component;
import java.awt.Container;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.swing.AbstractButton;
import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;
public class DatosCredencial {
    static Connection conn = ConexionBD.getConnection();
    
    public static void Listar(DefaultTableModel modelo){
    
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            
            pstmt = conn.prepareStatement("CALL listar_credencial()");
            rs = pstmt.executeQuery();
            while(rs.next()){
                int idcredencial = rs.getInt("IdCredencial");
                String correo = rs.getString("correo");
                String clave = rs.getString("clave");
                String descripcion = rs.getString("descripcion");
                
                Object[] row = new Object[]{idcredencial, correo, clave, descripcion};
                
                modelo.addRow(row);
                
                }
                
            
        
        }catch(SQLException ex){
             JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
        
    }
    public static void Insertar(Credencial credencial, JTable tabla){
     
        
        PreparedStatement cstmt = null;
        try{
            cstmt = conn.prepareCall("{ CALL insertar_credencial(?,?,?,?) }");
            cstmt.setString(1, credencial.getCorreo());
            cstmt.setString(2, credencial.getClave());
            cstmt.setString(3, credencial.getAlias());
            cstmt.setString(4, credencial.getDescripcion());
            cstmt.execute();
            
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            Listar(modelo);
            
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
        
        DefaultTableModel modelo = (DefaultTableModel)tabla.getModel();
        modelo.setRowCount(0);
        //refrescar grilla
        Listar(modelo);
    }
    
    
    
    public static void Actualizar(Credencial credencial, JTable tabla ){
        PreparedStatement cstmt = null;
        try{
            cstmt = conn.prepareCall("{  CALL actualizar_credencial(?,?,?,?,?) }");
            cstmt.setInt(1, credencial.getIdCredencial());
            cstmt.setString(2, credencial.getCorreo());
            cstmt.setString(3, credencial.getClave());
            cstmt.setString(4, credencial.getAlias());
            cstmt.setString(5, credencial.getDescripcion());
            
            cstmt.execute();
            
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            Listar(modelo);
            
        }catch(SQLException e){
        
        JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
         try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
        
    }
    
}
