package proyecto_gm.Tipo;

import java.awt.Component;
import java.awt.Container;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;


public class DatosTipo {
        static Connection conn = ConexionBD.getConnection();

    
    public static void LimpiarTipo (Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                LimpiarTipo((Container) componente);
            }
        }
    }
    
    public static String GenerarCodigoTipo() {
        CallableStatement cstmt = null;
        String codigoGenerado = "";
        try {
            cstmt = conn.prepareCall("{ CALL generar_codigo(?, ?, ?, ?) }");

            cstmt.setString(1, "tiposempleados");
            cstmt.setString(2, "IdTipoEmpleado");
            cstmt.setString(3, "TEM");

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
    
    public static void MostrarTipo(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try ( PreparedStatement stmt = conn.prepareStatement("CALL listar_tipoempleado()");  ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("CodigoTipoEmpleado"),
                    rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static boolean InsertarTipo(Tipo tip, JTable tabla) {
        try ( CallableStatement stmt = conn.prepareCall("{CALL insertar_tipoempleado(?, ?)}")) {
            String nuevoCodigo = GenerarCodigoTipo();
            stmt.setString(1, tip.getDescripcionTipo());
            stmt.registerOutParameter(2, Types.VARCHAR);
            int filasAfectadas = stmt.executeUpdate();

            tip.setCodigoTipo(nuevoCodigo);
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.addRow(new Object[]{tip.getCodigoTipo(), tip.getDescripcionTipo()});

            return filasAfectadas > 0;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
    
    public static void ActualizarTipo(Tipo tip, JTable tabla) {
        try {
            CallableStatement ate = conn.prepareCall("{CALL actualizar_tipoempleado (?,?)}");
            ate.setString(1, tip.getCodigoTipo());
            ate.setString(2, tip.getDescripcionTipo());
            ate.executeUpdate();

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); 

            DatosTipo.MostrarTipo(modelo); 
            ate.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
   
    public static void EliminarTipo(JTable tabla) {
        int fila = tabla.getSelectedRow();
        if (fila >= 0) {
            String codigoTipo = tabla.getModel().getValueAt(fila, 0).toString();
            int confirm = JOptionPane.showConfirmDialog(null, "¿Eliminar tipo de empleado?", "Confirmar", JOptionPane.YES_NO_OPTION);
            if (confirm == JOptionPane.YES_OPTION) {
                try ( CallableStatement stmt = conn.prepareCall("{ CALL eliminar_tipoempleado(?) }")) {
                    stmt.setString(1, codigoTipo);
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
    
    public static void HabilitarTipo(Container contenedor, boolean bloquear) {
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
      
    public static boolean EditarTipo(Container contenedor, JTable tabla, JTextField[] campos) {
        int fila = tabla.getSelectedRow();
        if (fila != -1) {
            HabilitarTipo(contenedor, true);
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
