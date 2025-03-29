package proyecto_gm.Area;

import java.awt.Component;
import java.awt.Container;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

public class DatosArea {

    static Connection conn = ConexionBD.getConnection();

    public static void LimpiarArea(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                LimpiarArea((Container) componente);
            }
        }
    }

    public static String GenerarCodigoArea() {
        CallableStatement cstmt = null;
        String codigoGenerado = "";
        try {
            cstmt = conn.prepareCall("{ CALL generar_codigo(?, ?, ?, ?) }");

            cstmt.setString(1, "areas");
            cstmt.setString(2, "IdArea");
            cstmt.setString(3, "ARE");

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

    public static void MostrarArea(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try ( PreparedStatement stmt = conn.prepareStatement("CALL listar_areas()");  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("CodigoArea"),
                    rs.getString("descripcion")
                };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    
    public static boolean InsertarArea(Area are, JTable tabla) {
        try ( CallableStatement stmt = conn.prepareCall("{CALL insertar_areas(?, ?)}")) {
            String nuevoCodigo = GenerarCodigoArea();
            stmt.setString(1, are.getDescripcionArea());
            stmt.registerOutParameter(2, Types.VARCHAR);
            int filasAfectadas = stmt.executeUpdate();

            are.setCodigoArea(nuevoCodigo);
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.addRow(new Object[]{are.getCodigoArea(), are.getDescripcionArea()});

            return filasAfectadas > 0;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
    public static void ActualizarArea(Area are, JTable tabla) {
        try {
            CallableStatement ate = conn.prepareCall("{CALL actualizar_areas (?,?)}");
            ate.setString(1, are.getCodigoArea());
            ate.setString(2, are.getDescripcionArea());
            ate.executeUpdate();

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); 

            DatosArea.MostrarArea(modelo); 
            ate.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void EliminarArea(JTable tabla) {
        int fila = tabla.getSelectedRow();
        if (fila >= 0) {
            String codigoArea = tabla.getModel().getValueAt(fila, 0).toString();
            int confirm = JOptionPane.showConfirmDialog(null, "¿Eliminar área?", "Confirmar", JOptionPane.YES_NO_OPTION);
            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_areas(?) }")) {
                    stmt.setString(1, codigoArea);
                    stmt.execute();
                    ((DefaultTableModel) tabla.getModel()).removeRow(fila);
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Seleccione un área para eliminar.");
        }
    }
    
    public static void HabilitarArea(Container contenedor, boolean bloquear) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEnabled(bloquear);
            } else if (componente instanceof JButton) {
                String button = ((JButton) componente).getName();
                boolean activar = button.equals("guardar") || button.equals("deshacer");
                ((JButton) componente).setEnabled(activar == bloquear);
            }
        }
    }

    public static boolean EditarArea(Container contenedor, JTable tabla, JTextField[] campos) {
        int fila = tabla.getSelectedRow();
        if (fila != -1) {
            HabilitarArea(contenedor, true);
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
