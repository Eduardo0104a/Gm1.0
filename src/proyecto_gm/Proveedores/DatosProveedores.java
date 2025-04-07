package proyecto_gm.Proveedores;

import java.awt.Component;
import java.awt.Container;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import proyecto_gm.ConexionBD;
import proyecto_gm.Departamentos.Departamentos;

public class DatosProveedores {

    static Connection conn = ConexionBD.getConnection();

    public static void Limpiar(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                Limpiar((Container) componente);
            }
        }
    }

    /*public static String GenerarCodigo(String tabla, String prefijo, int longitud) {
        CallableStatement cstmt = null;
        String codigo_generado = "";
        try {
            cstmt = conn.prepareCall("{ CALL generar_codigo(?, ?, ?, ?) }");
            cstmt.setString(1, tabla);
            cstmt.setString(2, prefijo);
            cstmt.setInt(3, longitud);
            cstmt.registerOutParameter(4, Types.VARCHAR);

            cstmt.execute();

            codigo_generado = cstmt.getString(4);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            if (cstmt != null) {
                try {
                    cstmt.close();
                } catch (SQLException e) {
                    JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
        return codigo_generado;
    }*/
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

    // Mostrar datos
    public static void Mostrar(DefaultTableModel modelo) {
        try ( PreparedStatement pstmt = conn.prepareStatement("CALL listar_proveedores()")) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                modelo.addRow(new Object[]{
                    rs.getString("codigoProveedor"),
                    rs.getString("Descripcion"), // Departamento
                    rs.getString("Nombres"),
                    rs.getString("Direccion"),
                    rs.getString("Correo"),
                    rs.getString("Telefono"),
                    rs.getString("Ruc")
                });
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al mostrar proveedores", JOptionPane.ERROR_MESSAGE);
        }
    }

    //cargar combobox
    public static void llenarComboBoxDepartamentos(JComboBox<String> cboModulo2) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("CALL listar_proveedores_departamentos()"); //select * from departamentos
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                cboModulo2.addItem(rs.getString("Descripcion"));
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al llenar el ComboBox: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static String Capturar(JComboBox<String> cboModulo2) {
        String idModulo = "";
        try ( PreparedStatement pstmt = conn.prepareStatement("SELECT IdDepartamento FROM departamentos WHERE Descripcion = ?")) {
            pstmt.setString(1, cboModulo2.getSelectedItem().toString());
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                idModulo = rs.getString("IdDepartamento");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en Capturar Opciones", JOptionPane.ERROR_MESSAGE);
        }
        return idModulo;
    }

    public static boolean InsertarDatos(Proveedores pro, JTable tabla) {
        System.out.println("Entró al método InsertarDatos...");
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL insertar_proveedores(?, ?, ?, ?, ?, ?, ?) }")) {
            cstmt.setInt(1, Integer.parseInt(pro.getIdProveedor()));
            cstmt.setInt(2, Integer.parseInt(pro.getDepartamentoId()));
            cstmt.setString(3, pro.getNombres());
            cstmt.setString(4, pro.getDireccion());
            cstmt.setString(5, pro.getCorreo());
            cstmt.setString(6, pro.getTelefono());
            cstmt.setString(7, pro.getRuc());
            cstmt.execute();

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            Mostrar(modelo);
            return true;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    public static boolean Actualizar(Proveedores pro, JTable tabla, JComboBox<String> cboModulo2) {
        try {
            // Llamada al procedimiento almacenado
            CallableStatement cstmt = conn.prepareCall("{CALL actualizar_proveedores(?,?,?,?,?,?,?)}");

            // Capturamos el IdDepartamento desde el ComboBox
            String idDepartamento = Capturar(cboModulo2);

            // Definir los parámetros de la consulta
            cstmt.setString(1, pro.IdProveedor);
            cstmt.setInt(2, Integer.parseInt(idDepartamento)); // ComboBox contiene IDs como enteros.
            cstmt.setString(3, pro.Nombres);
            cstmt.setString(4, pro.Direccion);
            cstmt.setString(5, pro.Correo);
            cstmt.setString(6, pro.Telefono);
            cstmt.setString(7, pro.Ruc);

            cstmt.executeUpdate();
            cstmt.close();

            // Actualizar la tabla después de la actualización en la base de datos
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosProveedores.Mostrar(modelo);
            return true;
        } catch (SQLException ex) {

            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    public static void Eliminar(JTable tabla) {
        try {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String codigoDepartamento = tabla.getModel().getValueAt(fila, 0).toString();
                int confirm = JOptionPane.showConfirmDialog(null, "¿Eliminar tipo de empleado?", "Confirmar", JOptionPane.YES_NO_OPTION);

                if (confirm == JOptionPane.YES_OPTION) {

                    // Ejecutar el procedimiento almacenado
                    CallableStatement stmt = conn.prepareCall("{ CALL eliminar_proveedores(?) }");
                    stmt.setString(1, codigoDepartamento);
                    stmt.execute();

                    // Actualizar el JTable
                    DefaultTableModel model = (DefaultTableModel) tabla.getModel();
                    model.removeRow(fila);
                    JOptionPane.showMessageDialog(null, "El registro ha sido eliminada exitosamente");
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para eliminar.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    public static void Editar(Container contenedor, JTable tabla, JTextField[] camposTexto, JComboBox[] combos) {
        int filaSeleccionada = tabla.getSelectedRow();
        if (filaSeleccionada >= 0) {
            Habilitar(contenedor, true);
            camposTexto[0].setEnabled(false); // desactivar edición del ID
            camposTexto[1].requestFocus();

            // Rellenar los campos de texto con los valores de la fila seleccionada.
            camposTexto[0].setText(tabla.getValueAt(filaSeleccionada, 0).toString()); // Id (Proveedor)
            camposTexto[3].setText(tabla.getValueAt(filaSeleccionada, 2).toString()); // Nombres
            camposTexto[1].setText(tabla.getValueAt(filaSeleccionada, 3).toString()); // Direccion
            camposTexto[4].setText(tabla.getValueAt(filaSeleccionada, 4).toString()); // Correo
            camposTexto[2].setText(tabla.getValueAt(filaSeleccionada, 5).toString()); // Telefono
            camposTexto[5].setText(tabla.getValueAt(filaSeleccionada, 6).toString()); // RUC

            // actualiza el ComboBox para el departamento
            String moduloDescripcion = tabla.getValueAt(filaSeleccionada, 1).toString(); // columna de Modulo (Departamento)

            // Verifica si el ComboBox tiene ese valor y lo selecciona
            for (int i = 0; i < combos[0].getItemCount(); i++) {
                if (combos[0].getItemAt(i).equals(moduloDescripcion)) {
                    combos[0].setSelectedIndex(i); // Selecciona el valor correcto
                    break;
                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");
        }
    }

    /*public static boolean Editar(Container contenedor, JTable tabla, JTextField[] cod) {
        int fila = tabla.getSelectedRow();
        if (fila != -1) {
            DatosProveedores.Habilitar(contenedor, true);
            tabla.clearSelection();
            tabla.setRowSelectionAllowed(false);
            for (int i = 0; i < cod.length; i++) {

                String dato = tabla.getModel().getValueAt(fila, i).toString();
                cod[i].setText(dato);
            }
            cod[0].setEnabled(false);
            cod[1].requestFocus();
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "No seleciono una fila");
            return false;
        }
    }
     */
}
