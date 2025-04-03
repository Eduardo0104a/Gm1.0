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
 * @author Emerson
 */
public class DatosInstituciones {

    static Connection conn = ConexionBD.getConnection();

    public void mostrarDatosInstituciones(DefaultTableModel modelo) {
        modelo.setRowCount(0); // Limpiar la tabla antes de cargar nuevos datos
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_instituciones()");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoInstituciones"),
                    rs.getString("Ruc"),
                    rs.getString("RazonSocial"),
                    rs.getString("Direccion"),
                    rs.getString("Sede")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void insertarDatos(Instituciones institucion, JTable tabla) {
        try {
            // Verificar si los campos necesarios están vacíos
            if (institucion.getId().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Ingrese un Id", "Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }

            // Convertir el ID a entero antes de enviarlo
            int idInstitucion = Integer.parseInt(institucion.getId());

            // Preparar la llamada al procedimiento almacenado para insertar datos
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_instituciones(?, ?, ?, ?, ?) }");
            cstmt.setInt(1, idInstitucion);
            cstmt.setString(2, institucion.getRuc());
            cstmt.setString(3, institucion.getRazonSocial());
            cstmt.setString(4, institucion.getDireccion());
            cstmt.setString(5, institucion.getSede());
            cstmt.execute(); // Ejecuta el procedimiento almacenado para insertar los datos
            cstmt.close(); // Cerrar después de la inserción

            // Preparar la llamada al procedimiento almacenado para obtener la institución
            CallableStatement cstmt2 = conn.prepareCall("{ CALL obtener_institucion(?) }");
            cstmt2.setInt(1, idInstitucion); // CORRECCIÓN: Ahora usamos `cstmt2`

            // Ejecutar la consulta
            ResultSet rs = cstmt2.executeQuery(); // CORRECCIÓN: Ahora usamos `cstmt2.executeQuery()`

            if (rs.next()) {
                // Obtener el modelo de la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();

                // Crear una fila con los datos de la institución recién insertada
                Object[] rowData = {
                    rs.getString("codigoInstituciones"),
                    rs.getString("Ruc"),
                    rs.getString("RazonSocial"),
                    rs.getString("Direccion"),
                    rs.getString("Sede")
                };

                // Agregar la nueva fila al modelo de la tabla
                modelo.addRow(rowData);
                tabla.setModel(modelo);  // Actualizar el modelo del JTable
            }

            // Cerrar recursos
            rs.close();
            cstmt2.close();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(null, "El ID debe ser un número", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void eliminarDatos(JTable tabla) {
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            String id = tabla.getModel().getValueAt(fila, 0).toString(); // Se asume que el ID está en la primera columna
            int confirm = JOptionPane.showConfirmDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_instituciones(?) }")) {
                    stmt.setString(1, id); // Se usa setString porque el ID es VARCHAR
                    stmt.execute();

                    // Eliminar la fila de la tabla
                    ((DefaultTableModel) tabla.getModel()).removeRow(fila);
                    JOptionPane.showMessageDialog(null, "La fila ha sido eliminada exitosamente.");
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debe seleccionar una fila para eliminar.");
        }
    }

    public static void guardarCambios(Instituciones institucion, JTable tabla) {
        try {
            // Llamada al procedimiento sin parámetros
            CallableStatement cstmt = conn.prepareCall("{ CALL listar_instituciones() }"); // Sin parámetros
            ResultSet rs = cstmt.executeQuery();

            // Verificar si el resultado tiene filas, lo que indica que el registro ya existe
            if (rs.next()) {
                // Si el registro existe, hacer una actualización
                DatosInstituciones.actualizarDatos(institucion, tabla);
            } else {
                // Si el registro no existe, hacer una inserción
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
            cstmt.execute(); // Ejecuta la actualización en la base de datos

            // Limpiar y actualizar la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); // Limpiar la tabla

            PreparedStatement stmt = conn.prepareStatement("CALL listar_instituciones()"); // Recargar datos
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoInstituciones"),
                    rs.getString("Ruc"),
                    rs.getString("RazonSocial"),
                    rs.getString("Direccion"),
                    rs.getString("Sede")
                };
                modelo.addRow(row);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static boolean validarNumeros(String datos) {
        return datos.matches("[0-9]*");
    }

}
