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

    public static void Listar(DefaultTableModel modelo) {
        modelo.setRowCount(0); // Limpiar la tabla antes de cargar nuevos datos
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_credencial()");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoCredencial"),
                    rs.getString("Correo"),
                    rs.getString("Clave"),
                    rs.getString("Alias"),
                    rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al cargar datos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void Insertar(Credencial credencial, JTable tabla) {
        try {
            // Validar si algún campo necesario está vacío (excepto ID porque se genera automáticamente)
            if (credencial.getCorreo().isEmpty() || credencial.getClave().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Correo y Clave son obligatorios", "Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }

            // Preparar la llamada al procedimiento para insertar la credencial
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_credencial(?, ?, ?, ?) }");
            cstmt.setString(1, credencial.getCorreo());
            cstmt.setString(2, credencial.getClave());
            cstmt.setString(3, credencial.getAlias());
            cstmt.setString(4, credencial.getDescripcion());
            cstmt.execute();
            cstmt.close();

            // Limpiar la tabla antes de volver a listar los datos actualizados
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); // Limpiar la tabla

            // Llamar al método Listar para recargar los datos de la base de datos en la tabla
            Listar(modelo); // Esta función recargará la tabla con los datos más recientes, incluida la nueva credencial

            // Mostrar mensaje de éxito
            JOptionPane.showMessageDialog(null, "Credencial registrada correctamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void actualizarDatosCredencial(Credencial credencial, JTable tabla) {
        try {
            // Llamada al procedimiento almacenado para actualizar
            CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_credencial(?, ?, ?, ?, ?) }");
            cstmt.setString(1, credencial.getIdCredencial());
            cstmt.setString(2, credencial.getCorreo());
            cstmt.setString(3, credencial.getClave());
            cstmt.setString(4, credencial.getAlias());
            cstmt.setString(5, credencial.getDescripcion());
            cstmt.execute();

            // Limpiar y actualizar la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);

            PreparedStatement stmt = conn.prepareStatement("CALL listar_credencial()");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoCredencial"),
                    rs.getString("Correo"),
                    rs.getString("Clave"),
                    rs.getString("Alias"),
                    rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }

            JOptionPane.showMessageDialog(null, "Datos actualizados correctamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al actualizar datos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void eliminarDatos(JTable tabla) {
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            String id = tabla.getModel().getValueAt(fila, 0).toString(); // Se asume que el ID está en la primera columna
            int confirm = JOptionPane.showConfirmDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmar eliminación", JOptionPane.YES_NO_OPTION);

            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_credencial(?) }")) {
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

    public static void Limpiar(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                Limpiar((Container) componente);
            }
        }
    }

    // Habilitar o bloquear campos y botones
    public static void Habilitar(Container contenedor, boolean bloquear) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField) {
                ((JTextField) component).setEnabled(bloquear);

            } else if (component instanceof JButton) {
                String button = ((JButton) component).getName();
                if (button.equals("guardar") || button.equals("deshacer")) {
                    ((JButton) component).setEnabled(bloquear);
                } else if (button.equals("agregar") || button.equals("editar") || button.equals("eliminar")) {
                    ((JButton) component).setEnabled(!bloquear); // aplicar logica inversa
                }
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }

}
