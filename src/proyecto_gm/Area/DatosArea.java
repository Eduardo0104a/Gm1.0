package proyecto_gm.Area;
import java.awt.Component;
import java.awt.Container;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;
import java.sql.Types;
public class DatosArea {
    
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
    
    public static String GenerarCodigo() {
        CallableStatement cstmt = null;
        String codigoGenerado = "";
        try {
            cstmt = conn.prepareCall("{ CALL generar_codigo(?, ?, ?, ?) }");

            cstmt.setString(1, "area");
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
   // Habilitar o bloquear campos y botones
    public static void Habilitar(Container contenedor,  boolean bloquear) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField ) {
                ((JTextField)component).setEnabled(bloquear);
            
            } else if (component instanceof JButton ) {
                String button = ((JButton)component).getName();
                if (button.equals("guardar") || button.equals("deshacer")) {
                    ((JButton)component).setEnabled(bloquear);
                } else if (button.equals("agregar") || button.equals("editar") || button.equals("eliminar"))  {
                    ((JButton)component).setEnabled(!bloquear); // aplicar logica inversa
                }
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }
    
    public static void Mostrar(DefaultTableModel modelo) {
        try {
            PreparedStatement ate = conn.prepareStatement("CALL listar_areas()");
            ResultSet rs= ate.executeQuery();
            while (rs.next()) {                
                Object[] row = new Object[]{
                    rs.getString("IdArea"), rs.getString("Descripcion")
                };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static boolean Insertar(Area are, JTable tabla) {
        try ( CallableStatement stmt = conn.prepareCall("{CALL insertar_cargos(?, ?)}")) {
            String nuevoCodigo = GenerarCodigo(); 
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
    
    public static void Actualizar(Area are, JTable tabla) {
        try {
            CallableStatement ate = conn.prepareCall("{CALL actualizar_cargos (?,?)}");
            ate.setString(1, are.getCodigoArea());
            ate.setString(2, are.getDescripcionArea());
            ate.executeUpdate();

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); 

            DatosArea.Mostrar(modelo); 
            ate.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static void Eliminar(JTable tabla) {
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
                    CallableStatement stmt = conn.prepareCall("{ CALL eliminar_areas(?) }");
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
      
    public static boolean Editar(Container contenedor,  JTable tabla, JTextField [] cod){
        int fila = tabla.getSelectedRow();
        if (fila != -1) {
            DatosArea.Habilitar(contenedor, true);
            tabla.clearSelection();
            tabla.setRowSelectionAllowed(false);
            for (int i = 0; i < cod.length; i++) {
                
                String dato= tabla.getModel().getValueAt(fila, i).toString();
                cod[i].setText(dato);
            }
            cod[0].setEnabled(false);
            cod[1].requestFocus();
            return true;
        }else{
            JOptionPane.showMessageDialog(null,"No seleciono una fila" );
            return false;
        }
    }

    static void GenerarCodigo(JTable tblArea, String codigo, int i) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
   
    }
