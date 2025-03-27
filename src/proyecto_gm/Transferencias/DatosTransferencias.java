/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Transferencias;

import java.awt.Component;
import java.awt.Container;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author jeanv
 */
public class DatosTransferencias {

    static Connection conn = ConexionBD.getConnection();

    // Limpiar campos
    public static void Limpiar(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField ) {
                ((JTextField)componente).setText("");
            } else if (componente instanceof JComboBox) {
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
                ((JTextField)componente).setEnabled(bloquear);
            } else if (componente instanceof JComboBox ) {
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

    // Cargar las cuentas en los combo boxes
    public static void CargarCuentas(JComboBox<String> origen, JComboBox<String> destino) {
        String sql = "SELECT Nombres FROM cuentasbancarias";
        List<String> cuentas = new ArrayList<>();
        try ( PreparedStatement pstmt = conn.prepareStatement(sql);  ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                cuentas.add(rs.getString(1));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        origen.setModel(new DefaultComboBoxModel<>(cuentas.toArray(new String[0])));
        destino.setModel(new DefaultComboBoxModel<>(cuentas.toArray(new String[0])));
    }

    // Mostrar datos
    public static void Listar(DefaultTableModel modelo) {
        try ( PreparedStatement pstmt = conn.prepareStatement("CALL listar_transferencias");  ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString("Id"), rs.getString("Periodo"),
                    rs.getString("NroOperacion"), rs.getString("CuentaOrigen"), rs.getString("CuentaDestino"),
                    rs.getString("Fecha")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Insertar datos
    public static void Insertar(Transferencia transferencia, JTable tabla) {
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL insertar_transferencia(?, ?, ?, ?, ?) }")) {
            cstmt.setString(1, transferencia.getPeriodo());
            cstmt.setString(2, transferencia.getNroOperacion());
            cstmt.setString(3, transferencia.getCuentaOrigen());
            cstmt.setString(4, transferencia.getCuentaDestino());
            cstmt.setString(5, transferencia.getFecha());

            cstmt.execute(); // se inserta los datos a la BD
            JOptionPane.showMessageDialog(null, "Transferencia registrada satisfactoriamente.", "Registro Exitoso", JOptionPane.INFORMATION_MESSAGE);

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            Listar(modelo);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Boton editar
    public static void Editar(Container contenedor, JTable tabla, JTextField[] cajas, JComboBox origen, JComboBox destino) {
        // Obtener el indice de la fila seleccionada
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {
            Habilitar(contenedor, true);
            // Limpiamos la seleccion en la tabla
            tabla.clearSelection();
            // Deshabilitamos la seleccion de filas de la tabla
            tabla.setRowSelectionAllowed(false);

            cajas[0].setText(tabla.getModel().getValueAt(fila, 0).toString());
            cajas[1].setText(tabla.getModel().getValueAt(fila, 1).toString());
            cajas[2].setText(tabla.getModel().getValueAt(fila, 2).toString());
            cajas[3].setText(tabla.getModel().getValueAt(fila, 5).toString());

            cajas[0].setEnabled(false);
            cajas[1].requestFocus();

            origen.setSelectedItem(tabla.getModel().getValueAt(fila, 3).toString()); // la columna "CuentaOrigen" está en la posición 3
            destino.setSelectedItem(tabla.getModel().getValueAt(fila, 4).toString()); // la columna "CuentaDestino" está en la posición 4

        } else {
            JOptionPane.showMessageDialog(null, "Debe seleccionar una fila para editar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
        }
    }

    // Actualizar datos
    public static void Actualizar(Transferencia transferencia, JTable tabla) {
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_transferencia(?, ?, ?, ?, ?, ?) }")) {

            cstmt.setInt(1, transferencia.getId());
            cstmt.setString(2, transferencia.getPeriodo());
            cstmt.setString(3, transferencia.getNroOperacion());
            cstmt.setString(4, transferencia.getCuentaOrigen());
            cstmt.setString(5, transferencia.getCuentaDestino());
            cstmt.setString(6, transferencia.getFecha());

            cstmt.execute(); // se actualiza los datos en la BD

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            Listar(modelo);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Eliminar datos
    public static void Eliminar(JTable tabla) {
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL eliminar_transferencia(?) }")) {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                if (opcion == JOptionPane.YES_OPTION) {
                    // Obtener los datos de fila seleccionada
                    String id = tabla.getModel().getValueAt(fila, 0).toString(); // Se asume que el ID se encuentra en la primera columna

                    // Ejecutar el procedimiento almacenado
                    cstmt.setString(1, id);
                    cstmt.execute();

                    // Actualizamos la tabla
                    DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                    modelo.setRowCount(0);
                    Listar(modelo);
                } else {
                    tabla.clearSelection();
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debe seleccionar una fila para eliminar.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Validar campos
    public static boolean Validar(JTextField[] campos, JComboBox[] combos) {
        for (JTextField campo : campos) {
            if (campo.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Debe rellenar todos los campos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                campo.requestFocus();
                return false;
            }
        }

        for (JComboBox combo : combos) {
            if (combo.getSelectedItem() == null) {
                JOptionPane.showMessageDialog(
                        null, "Debe escoger un distrito y una forma de pago.", "Advertencia", JOptionPane.WARNING_MESSAGE
                );
                combo.requestFocus();
                return false;
            }
        }

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            sdf.setLenient(false);
            sdf.parse(campos[2].getText());
        } catch (ParseException e) {
            JOptionPane.showMessageDialog(null, "El formato de la fecha es el siguiente: dd/mm/aaaa. Inténtelo de nuevo.", "Advertencia", JOptionPane.WARNING_MESSAGE);
            campos[2].requestFocus();
            return false;
        }

        // Si se llega aquí, todos los campos son válidos
        return true;
    }
}
