/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Viaticos;

import java.awt.Component;
import java.awt.Container;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author jeanv
 */
public class DatosViaticos {

    static Connection conn = ConexionBD.getConnection();

    // Limpiar campos
    public static void Limpiar(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField ) {
                //componente.setText("");
                ((JTextField)componente).setText("");
            } else if (componente instanceof JComboBox ) {
                ((JComboBox)componente).setSelectedIndex(-1);
            } else if (componente instanceof Container ) {
                Limpiar((Container)componente);
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }

    // Habilitar campos
    public static void Habilitar(Container contenedor, boolean bloquear) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField ) {
                //jTextField.setEnabled(bloquear);
                ((JTextField)componente).setEnabled(bloquear);
            } else if (componente instanceof JComboBox ) {
                //jComboBox.setEnabled(bloquear);
                ((JComboBox)componente).setEnabled(bloquear);
            } else if (componente instanceof JButton ) {
                
                String button = ((JButton)componente).getName();
                if (button.equals("guardar") || button.equals("cancelar")) {
                    ((JButton)componente).setEnabled(bloquear);
                } else if (button.equals("nuevo") || button.equals("editar") || button.equals("eliminar")) {
                    ((JButton)componente).setEnabled(!bloquear); // aplicar logica inversa
                }
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }

    // Cargar opciones para los combo boxes
    public static void CargarCombos(JComboBox cboEmpleado, JComboBox cboPeriodo) {
        PreparedStatement pstmtEmp = null;
        PreparedStatement pstmtPer = null;
        ResultSet rsEmp = null;
        ResultSet rsPer = null;
        try {
            // Preparamos la consultas
            pstmtEmp = conn.prepareStatement("SELECT CONCAT(Nombres, ' ', Apellidos) AS NombreCompleto FROM empleados ORDER BY Nombres ASC");
            pstmtPer = conn.prepareStatement("SELECT IdPeriodo as Id FROM periodos");

            // Las ejecutamos
            rsEmp = pstmtEmp.executeQuery();
            rsPer = pstmtPer.executeQuery();

            // Agregamos las areas en cbxArea
            while (rsEmp.next()) {
                String nomEmp = rsEmp.getString("NombreCompleto");
                cboEmpleado.addItem(nomEmp);
            }

            // Agregamos los cargos a cbxCargo
            while (rsPer.next()) {
                String nomPer = rsPer.getString("Id");
                cboPeriodo.addItem(nomPer);
            }

            // Contenido vacio en los combo boxes
            cboEmpleado.setSelectedIndex(-1);
            cboPeriodo.setSelectedIndex(-1); // cambio para agilizar inserciones

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (rsEmp != null) {
                    rsEmp.close();
                }
                if (rsPer != null) {
                    rsPer.close();
                }
                if (pstmtEmp != null) {
                    pstmtEmp.close();
                }
                if (pstmtPer != null) {
                    pstmtPer.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // Mostrar datos
    public static void Listar(DefaultTableModel modelo) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("CALL listar_viaticos()");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString("Id"), rs.getString("Descripcion"), rs.getString("Pasaje"),
                    rs.getString("Menu"), rs.getString("Empleado"), rs.getString("Periodo")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
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

    // Insertar datos
    public static void Insertar(Viaticos viatico, JTable tabla) {
        CallableStatement cstmt = null;
        try {
            cstmt = conn.prepareCall("{ CALL insertar_viaticos(?, ?, ?, ?, ?) }");
            cstmt.setString(1, viatico.getDescripcion());
            cstmt.setFloat(2, viatico.getPasaje());
            cstmt.setFloat(3, viatico.getMenu());
            cstmt.setString(4, viatico.getEmpleado());
            cstmt.setString(5, viatico.getPeriodo());

            cstmt.execute(); // se inserta los datos a la BD

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosViaticos.Listar(modelo);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

    }

    // Boton editar
    public static void Editar(JPanel panel, JTable tabla, JTextField[] cajas, JComboBox cboEmp, JComboBox cboPer) {
        // Obtener el indice de la fila seleccionada
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            DatosViaticos.Habilitar(panel, true);
            // Limpiamos la seleccion en la tabla
            tabla.clearSelection();
            // Deshabilitamos la seleccion de filas de la tabla
            tabla.setRowSelectionAllowed(false);

            for (int i = 0; i < cajas.length; i++) {
                String dato = tabla.getModel().getValueAt(fila, i).toString();
                cajas[i].setText(dato);
            }
            
            cajas[0].setEnabled(false);
            cajas[1].requestFocus();

            cboEmp.setSelectedItem(tabla.getModel().getValueAt(fila, 4).toString());
            cboPer.setSelectedItem(tabla.getModel().getValueAt(fila, 5).toString());

        } else {
            JOptionPane.showMessageDialog(null, "Debe seleccionar una fila para editar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        }
    }

    // Actualizar datos
    public static void Actualizar(Viaticos viatico, JTable tabla) {
        CallableStatement cstmt = null;
        try {
            cstmt = conn.prepareCall("{ CALL actualizar_viaticos(?, ?, ?, ?, ?, ?) }");
            cstmt.setInt(1, viatico.getId());
            cstmt.setString(2, viatico.getDescripcion());
            cstmt.setFloat(3, viatico.getPasaje());
            cstmt.setFloat(4, viatico.getMenu());
            cstmt.setString(5, viatico.getEmpleado());
            cstmt.setString(6, viatico.getPeriodo());

            cstmt.execute(); // se actualiza los datos en la BD

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);

            DatosViaticos.Listar(modelo);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // Eliminar datos
    public static void Eliminar(JTable tabla) {
        CallableStatement cstmt = null;
        try {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                if (opcion == JOptionPane.YES_OPTION) {
                    // Obtener los datos de fila seleccionada
                    int id = Integer.parseInt(tabla.getModel().getValueAt(fila, 0).toString()); //Se asume que el ID se encuentra en la primera columna

                    // Ejecutar el procedimiento almacenado
                    cstmt = conn.prepareCall("{ CALL eliminar_viaticos(?) }");
                    cstmt.setInt(1, id);
                    cstmt.execute();

                    // Actualizar el JTable
                    DefaultTableModel model = (DefaultTableModel) tabla.getModel();
                    model.removeRow(fila);
                    // JOptionPane.showMessageDialog(null, "La fila ha sido eliminada exitosamente");                
                } else {
                    tabla.clearSelection();
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debe seleccionar una fila para eliminar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }
    
    // Validar campos
    public static boolean Validar(JTextField[] campos, JComboBox[] combos) {
        // Comprobamos cajas vacías
        for (JTextField campo : campos) {
            if (campo.getText().equals("")) {
                JOptionPane.showMessageDialog(
                        null, "Debe rellenar todos los campos.", "Advertencia", JOptionPane.WARNING_MESSAGE
                );
                campo.requestFocus();
                return false;
            }
        }
        
        for (JComboBox combo : combos) {
            if (combo.getSelectedItem() == null) {
                JOptionPane.showMessageDialog(
                        null, "Debe escoger un empleado y un periodo.", "Advertencia", JOptionPane.WARNING_MESSAGE
                );
                combo.requestFocus();
                return false;
            }
        }
        
        return true;
    }
}
