package proyecto_gm.Categoria;

import java.awt.Component;
import java.awt.Container;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

public class DatosCategoria {

    static Connection conn = ConexionBD.getConnection();

    public static void LimpiarCat(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                LimpiarCat((Container) componente);
            }
        }
    }

    public static String GenerarCodigoCat() {
        CallableStatement cstmt = null;
        String codigoGenerado = "";
        try {
            cstmt = conn.prepareCall("{ CALL generar_codigo(?, ?, ?, ?) }");

            cstmt.setString(1, "categorias");
            cstmt.setString(2, "idCategoria");
            cstmt.setString(3, "CAT");

            cstmt.registerOutParameter(4, Types.VARCHAR);

            cstmt.execute();

            codigoGenerado = cstmt.getString(4);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException ignored) {
            }
        }
        return codigoGenerado;
    }

    public static void MostrarCat(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try ( PreparedStatement stmt = conn.prepareStatement("CALL listar_categorias()");  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("CodigoCategoria"),
                    rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static boolean InsertarCat(Categoria cat, JTable tabla) {
        try ( CallableStatement stmt = conn.prepareCall("{CALL insertar_categorias(?, ?)}")) {
            String nuevoCodigo = GenerarCodigoCat();
            stmt.setString(1, cat.getDescripcionCat());
            stmt.registerOutParameter(2, Types.VARCHAR);
            int filasAfectadas = stmt.executeUpdate();

            cat.setCodigoCat(nuevoCodigo);
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.addRow(new Object[]{
                cat.getCodigoCat(), 
                cat.getDescripcionCat()
            });

            return filasAfectadas > 0;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    public static void ActualizarCat(Categoria cat, JTable tabla) {
        try {
            CallableStatement ate = conn.prepareCall("{CALL actualizar_categorias (?,?)}");
            ate.setString(1, cat.getCodigoCat());
            ate.setString(2, cat.getDescripcionCat());
            ate.executeUpdate();

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);

            DatosCategoria.MostrarCat(modelo);
            ate.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void EliminarCat(JTable tabla) {
        int fila = tabla.getSelectedRow();
        if (fila >= 0) {
            String codigoCat = tabla.getModel().getValueAt(fila, 0).toString();
            int confirm = JOptionPane.showConfirmDialog(null, "¿Eliminar Categoria?", "Confirmar", JOptionPane.YES_NO_OPTION);
            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_categorias(?) }")) {
                    stmt.setString(1, codigoCat);
                    stmt.execute();
                    ((DefaultTableModel) tabla.getModel()).removeRow(fila);
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Seleccione un categoria para eliminar.");
        }
    }

    public static void HabilitarCat(Container contenedor, boolean bloquear) {
    if (contenedor == null) return;

    for (Component componente : contenedor.getComponents()) {
        if (componente instanceof JTextField) {
            ((JTextField) componente).setEnabled(bloquear);
        } else if (componente instanceof JButton) {
            String button = ((JButton) componente).getName();
            if (button != null) {
                // Se habilitan solo cuando bloquear es true
                boolean activar = button.equals("guardar") || button.equals("deshacer");
                ((JButton) componente).setEnabled(bloquear && activar);
            }
        }
    }
}


    public static boolean EditarCat(Container contenedor, JTable tabla, JTextField[] campos) {
        int fila = tabla.getSelectedRow();
        if (fila != -1) {
            HabilitarCat(contenedor, true);
            for (int i = 0; i < campos.length; i++) {
                campos[i].setText(tabla.getModel().getValueAt(fila, i).toString());
            }
            campos[0].setEnabled(false);
            campos[1].requestFocus();
            return true;
        } else {
            JOptionPane.showMessageDialog(null, "Seleccione una fila para editar.");
            return false;
        }
    }
}
