package proyecto_gm.TipoDocumento;

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

public class DatosTipoDocumento {
    
    static Connection conn = ConexionBD.getConnection();

    // Limpiar campos
    public static void Limpiar(Container contenedor) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField ) {
                ((JTextField)component).setText("");
            } else if (component instanceof JComboBox ) {
                ((JComboBox)component).setSelectedIndex(0);
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }
    public static String GenerarCodigo(String tabla, String prefijo, int longitud) {
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
        
    }


    // Habilitar o bloquear campos y botones
    public static void Habilitar(Container contenedor,  boolean bloquear) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField ) {
                ((JTextField)component).setEnabled(bloquear);
            } else if (component instanceof JComboBox ) {
                ((JComboBox)component).setEnabled(bloquear);
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

    // Cargar opciones para los combo boxes
    public static void CargarCombo(JComboBox cboModulo) {
        try {
            // Preparamos la consultas
            PreparedStatement pstmtModelo = conn.prepareStatement("SELECT Descripcion FROM modulos");

            // Las ejecutamos
            ResultSet Modelos = pstmtModelo.executeQuery();

            // Agregamos las areas en cbxArea
            while (Modelos.next()) {
                String nomModelo = Modelos.getString("Descripcion");
                cboModulo.addItem(nomModelo);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Mostrar datos
    public static void Mostrar(DefaultTableModel modelo) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("CALL listar_tipodocumento()");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString("Id"), rs.getString("Descripcion"), rs.getString("Modulo")};
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Capturar las opciones del combo box 
    public static String Capturar(JComboBox cboModulo) {
        String idModulo = "";
        try {
            // Capturar las opciones seleccionadas en los combo boxes
            String selectmodulo = cboModulo.getSelectedItem().toString();

            // Obtener los id de modulo
            String consulta = "SELECT Id AS IdModulo "
                    + "FROM modulo "
                    + "WHERE Descripcion = ? ";
            PreparedStatement pstmt = conn.prepareStatement(consulta);
            pstmt.setString(1, selectmodulo);
            
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                idModulo = rs.getString("IdModulo");   
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en Capturar Opciones", JOptionPane.ERROR_MESSAGE);
        }

        return idModulo;
    }

    // Insertar datos
    public static void Insertar(TipoDocumento tip, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_tipodocumento(?, ?, ?) }");
            
            cstmt.setString(1, tip.getId());
            cstmt.setString(3, tip.getDescripcion());
            cstmt.setString(2, tip.getIdModulo());
           

            cstmt.execute(); // se inserta los datos a la BD

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosTipoDocumento.Mostrar(modelo);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

   
    // Boton editar
    public static void Editar(Container contenedor, JTable tabla, JTextField[] camposTexto, JComboBox[] combos) {
        

        // Obtener la fila seleccionada
        int filaSeleccionada = tabla.getSelectedRow();
        if (filaSeleccionada >= 0) {
            // Obtener los valores de la fila seleccionada
            DatosTipoDocumento.Habilitar(contenedor, true);
            tabla.clearSelection();
            // Deshabilitamos la seleccion de filas de la tabla
            tabla.setRowSelectionAllowed(false);
            // Llenar los campos de texto con los valores de la fila
            for (int i = 0; i < camposTexto.length; i++) {
                if (tabla.getValueAt(filaSeleccionada, i) != null) {
                    String dato= tabla.getModel().getValueAt(filaSeleccionada, i).toString();
                    camposTexto[i].setText(dato);
                } else {
                    camposTexto[i].setText("");
                }
            }

            camposTexto[0].setEnabled(false);
            camposTexto[1].requestFocus();

            // Llenar los combos con los valores de la fila
            for (int i = 0; i < combos.length; i++) {
                combos[i].setSelectedItem(tabla.getModel().getValueAt(filaSeleccionada, camposTexto.length + i).toString());
                break;
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");
            
            // Habilitamos la seleccion de fila(s) en la tabla
            tabla.setRowSelectionAllowed(true);
        }
    }
    // Actualizar datos

    public static void Actualizar(TipoDocumento tip, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_tipodocumento(?, ?, ?) }");
            
            
            cstmt.setString(1, tip.getId());
            cstmt.setString(3, tip.getDescripcion());
            cstmt.setString(2, tip.getIdModulo());

            String[] options = {"Sí", "No", "Cancelar"};
            int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere actualizar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);

            if (opcion == JOptionPane.YES_OPTION) {
                cstmt.execute(); // se actualiza los datos en la BD

                // Actualizamos la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                modelo.setRowCount(0);

                DatosTipoDocumento.Mostrar(modelo);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Eliminar datos
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
                    CallableStatement stmt = conn.prepareCall("{ CALL eliminar_tipodocumento(?) }");
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
    public static boolean ValidarCampos(TipoDocumento emp) {
        boolean validar = true;
        String[] campos = {emp.getId()
        };

        // Validamos si los campos estan vacios
        for (String campo : campos) {
            if (campo.equals("")) {
                validar = false;
            }
        }

        if (!validar) {
            JOptionPane.showMessageDialog(null, "Debe rellenar todos los campos.");
        }

        // Validamos uno por uno
        // Validamos ID:
        if (!emp.getId().matches("^[A-Z]{2}[0-9]{2}$") || emp.getId().length() != 4) {
            validar = false;
            JOptionPane.showMessageDialog(null, "El formato del ID es el siguiente: AA00. Inténtelo de nuevo.");
        
        }
        return validar;
    }
}