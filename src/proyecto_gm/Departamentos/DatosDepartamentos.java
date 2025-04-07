/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Departamentos;

import java.awt.Component;
import java.awt.Container;
import javax.swing.JOptionPane;
import java.sql.*;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author EMERSOM APAZA
 */
public class DatosDepartamentos {

    static Connection conn = ConexionBD.getConnection();

    public static void editar(JTable tabla, JTextField[] cajas) {
        // Obtener el indice de la fila seleccionada
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            for (int i = 0; i < cajas.length; i++) {
                String dato = tabla.getModel().getValueAt(fila, i).toString();
                cajas[i].setText(dato);
            }

            cajas[0].setEditable(false);
            cajas[1].requestFocus();
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");
        }

    }

    // Limpiar campos
    public static void limpiarCampos(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                limpiarCampos((Container) componente);
            }
        }
    }

    // Bloquear campos
    public static void bloquearCampos(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEditable(false);
            } else if (componente instanceof Container) {
                bloquearCampos((Container) componente);
            }
        }
    }

    // Habilitar campos
    public static void habilitarCampos(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEditable(true);
            } else if (componente instanceof Container) {
                habilitarCampos((Container) componente);
            }
        }
    }

    // Guardar cambios
    /*public static void guardarCambios(Departamentos departamento, JTable tabla) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_facultades()");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // El registro ya existe, se debe realizar una actualización
                DatosDepartamentos.actualizarDatos(departamento, tabla);
            } else {
                // El registro no existe, se debe realizar una inserción
                DatosDepartamentos.insertarDatos(departamento, tabla);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }*/

    // Insertar datos
    public static void insertarDatos(Departamentos departamento, JTable tabla) {
        try {
            // Verificar si los campos necesarios están vacíos
            if (departamento.getId().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Ingrese un Id", "Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }

            // Preparar la llamada al procedimiento almacenado para insertar datos
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_departamentos(?, ?) }");
            cstmt.setString(1, departamento.getId());
            cstmt.setString(2, departamento.getDescripcion());
            cstmt.execute(); // Ejecuta el procedimiento almacenado para insertar los datos
            cstmt.close(); // Cerrar después de la inserción

            // Preparar la llamada al procedimiento almacenado para obtener la facultad
            CallableStatement cstmt2 = conn.prepareCall("{ CALL obtener_departamento(?) }");
            cstmt2.setString(1, departamento.getId()); // Usamos el ID de la facultad

            // Ejecutar la consulta
            ResultSet rs = cstmt2.executeQuery(); // Ahora usamos `cstmt2.executeQuery()`

            if (rs.next()) {
                // Obtener el modelo de la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();

                // Crear una fila con los datos de la facultad recién insertada
                Object[] rowData = {
                    rs.getString("codigoDepartamento"),
                    rs.getString("descripcion")
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
        }
    }

    // Mostrar datos
    public static void mostrarDatos(DefaultTableModel modelo) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_departamentos()");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoDepartamento"),
                    rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Actualizar datos
    public static void actualizarDatos(Departamentos departamento, JTable tabla) {
        try {
            // Confirmación antes de actualizar
            int confirm = JOptionPane.showConfirmDialog(null, "¿Está seguro de que quiere actualizar la fila seleccionada?", "Confirmar actualización", JOptionPane.YES_NO_OPTION);

            if (confirm == JOptionPane.YES_OPTION) {
                // Llamada al procedimiento almacenado para actualizar los datos
                CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_departamentos(?, ?) }");
                cstmt.setString(1, departamento.getId());
                cstmt.setString(2, departamento.getDescripcion());
                cstmt.execute(); // Ejecuta la actualización en la base de datos

                // Mensaje de éxito
                JOptionPane.showMessageDialog(null, "El departamento ha sido actualizado exitosamente.");

                // Limpiar y actualizar la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                modelo.setRowCount(0); // Limpiar la tabla

                // Preparar la consulta para listar los departamentos
                PreparedStatement stmt = conn.prepareStatement("CALL listar_departamentos()"); // Recargar datos
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    // Crear una fila con los datos del departamento
                    Object[] row = new Object[]{
                        rs.getString("codigoDepartamento"),
                        rs.getString("Descripcion")
                    };
                    modelo.addRow(row); // Agregar la fila a la tabla
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Eliminar datos
    public static void eliminarDatos(JTable tabla) {
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            String id = tabla.getModel().getValueAt(fila, 0).toString(); // Se asume que el ID está en la primera columna
            int confirm = JOptionPane.showConfirmDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_departamentos(?) }")) {
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

}
