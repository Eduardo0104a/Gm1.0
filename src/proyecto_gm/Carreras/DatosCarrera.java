package proyecto_gm.Carreras;

import java.awt.HeadlessException;
import java.sql.*;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;
import proyecto_gm.Facultades.DatosFacultades;
import proyecto_gm.Facultades.Facultades;

public class DatosCarrera {

    static Connection conn = ConexionBD.getConnection();

    public void mostrarDatosCarreras(DefaultTableModel modelo) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_carreras()");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString("Id"), rs.getString("Descripcion")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

    }
        public static void insertarDatos(Carreras carrera, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_carreras(?, ?) }");
            if(carrera.getId().equals("")){
                JOptionPane.showMessageDialog(null, "Ingrese un Id","Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }
            
            cstmt.setString(1, carrera.getId());
            cstmt.setString(2, carrera.getDescripcion());
            cstmt.execute(); // se inserta los datos a la BD

            // Actualiza el modelo de tabla con los nuevos datos
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            Object[] rowData = {carrera.getId(), carrera.getDescripcion()};
            modelo.addRow(rowData);

            // Actualiza la vista del JTable con el modelo de tabla actualizado
            tabla.setModel(modelo);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }
            public static void eliminarDatos(JTable tabla) {
        try {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                //if (opcion == JOptionPane.YES_OPTION) {
                    // Obtener los datos de fila seleccionada
                    String id = tabla.getModel().getValueAt(fila, 0).toString(); //Se asume que el ID se encuentra en la primera columna

                    // Ejecutar el procedimiento almacenado
                    CallableStatement stmt = conn.prepareCall("{ CALL eliminar_carreras(?) }");
                    stmt.setString(1, id);
                    stmt.execute();

                    // Actualizar el JTable
                    DefaultTableModel model = (DefaultTableModel) tabla.getModel();
                    model.removeRow(fila);
                    // JOptionPane.showMessageDialog(null, "La fila ha sido eliminada exitosamente");                
               // }
            } else {
                JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para eliminar.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }
//    public static void guardarCambios(Carreras carrera, JTable tabla) {
//        try {
//            PreparedStatement stmt = conn.prepareStatement("CALL listar_carreras()");
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                // El registro ya existe, se debe realizar una actualización
//                DatosCarrera.actualizarDatos(carrera, tabla);
//            } else {
//                // El registro no existe, se debe realizar una inserción
//                DatosCarrera.insertarDatos(carrera, tabla);
//            }
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
//        }
//    }
    public static void actualizarDatos(Carreras carrera, JTable tabla) {
        try {
            CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_carreras(?, ?) }");
            cstmt.setString(1, carrera.getId());
            cstmt.setString(2, carrera.getDescripcion());

            //String[] options = {"Sí", "No", "Cancelar"};
            //int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere actualizar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);

            //if (opcion == JOptionPane.YES_OPTION) {
                cstmt.execute(); // se actualiza los datos en la BD

                // Actualizamos la tabla
                DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                modelo.setRowCount(0);

                try {
                    PreparedStatement stmt = conn.prepareStatement("CALL listar_carreras()");
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        Object[] row = new Object[]{rs.getString("Id"), rs.getString("Descripcion")};
                        modelo.addRow(row);
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            //}

        } catch (HeadlessException | SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
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
}
