/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Instituciones;

import java.awt.HeadlessException;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;
import proyecto_gm.Facultades.DatosFacultades;
import proyecto_gm.Facultades.Facultades;

/**
 *
 * @author Mariluz
 */
public class DatosInstituciones {

     static Connection conn = ConexionBD.getConnection();

    public void mostrarDatosInstituciones(DefaultTableModel modelo) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_instituciones()");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString("Id"), rs.getString("Ruc"),
                rs.getString("RazonSocial"), rs.getString("Direccion"), rs.getString("Sede")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

    }
    public static void insertarDatos(Instituciones institucion, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_instituciones(?, ?, ?, ?, ?) }");
            cstmt.setString(1, institucion.getId());
            cstmt.setString(2, institucion.getRuc());
            cstmt.setString(3, institucion.getRazonSocial());
            cstmt.setString(4, institucion.getDireccion());
            cstmt.setString(5, institucion.getSede());
            cstmt.execute(); // se inserta los datos a la BD

            // Actualiza el modelo de tabla con los nuevos datos
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            Object[] rowData = {institucion.getId(), institucion.getRuc(), institucion.getRazonSocial(), institucion.getDireccion(), institucion.getSede()};
            modelo.addRow(rowData);

            // Actualiza la vista del JTable con el modelo de tabla actualizado
            tabla.setModel(modelo);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }
        public static void eliminarDatos(JTable tabla) {
        try {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                if (opcion == JOptionPane.YES_OPTION) {
                    // Obtener los datos de fila seleccionada
                    String id = tabla.getModel().getValueAt(fila, 0).toString(); //Se asume que el ID se encuentra en la primera columna

                    // Ejecutar el procedimiento almacenado
                    CallableStatement stmt = conn.prepareCall("{ CALL eliminar_instituciones(?) }");
                    stmt.setString(1, id);
                    stmt.execute();

                    // Actualizar el JTable
                    DefaultTableModel model = (DefaultTableModel) tabla.getModel();
                    model.removeRow(fila);
                    // JOptionPane.showMessageDialog(null, "La fila ha sido eliminada exitosamente");                
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para eliminar.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
        public static void guardarCambios(Instituciones institucion, JTable tabla) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_instituciones()");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // El registro ya existe, se debe realizar una actualización
                DatosInstituciones.actualizarDatos(institucion, tabla);
            } else {
                // El registro no existe, se debe realizar una inserción
                DatosInstituciones.insertarDatos(institucion, tabla);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
        public static void actualizarDatos(Instituciones institucion, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_instituciones(?, ?, ?, ?, ?) }");
            cstmt.setString(1, institucion.getId());
            cstmt.setString(2, institucion.getRuc());
            cstmt.setString(3, institucion.getRazonSocial());
            cstmt.setString(4, institucion.getDireccion());
            cstmt.setString(5, institucion.getSede());

            //String[] options = {"Sí", "No", "Cancelar"};
            //int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere actualizar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);

            //if (opcion == JOptionPane.YES_OPTION) {
                cstmt.execute(); // se actualiza los datos en la BD

                // Actualizamos la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                modelo.setRowCount(0);

                try {
                    PreparedStatement stmt = conn.prepareStatement("CALL listar_instituciones()");
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        Object[] row = new Object[]{rs.getString("Id"), rs.getString("Ruc"), rs.getString("RazonSocial"), rs.getString("Direccion"), rs.getString("Sede")};
                        modelo.addRow(row);
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            //}

        } catch (HeadlessException | SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
        public static boolean validarNumeros(String datos){
            return datos.matches("[0-9]*");
        }
        
}
