/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Articulo;

import java.awt.Component;
import java.awt.Container;
import java.awt.HeadlessException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author Luis
 */
public class DatosArticulo {
    
    static Connection conn = ConexionBD.getConnection();
    
    public static void habilitarCampos(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEditable(true);
            } else if (componente instanceof JComboBox ) {
                //jComboBox.setEnabled(true);
                componente.setEnabled(true);
            } else {
                LimpiarCampos((Container) componente);
            }
        }
    }
    
    public static void LimpiarCampos(Container contenedor) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField) {
                //jTextField.setText("");
                ((JTextField) component).setText("");
            } else if (component instanceof JComboBox ) {
                //jComboBox.setSelectedIndex(0);
                ((JComboBox) component).setSelectedIndex(0);
            } else {
                // No hace nada para otros tipos de componentes
            }
            
            
        }

        //porDefecto.setSelected(true);
    }

    // Bloquear campos
    public static void BloquearCampos(Container contenedor) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField) {
                //jTextField.setEnabled(false);
                component.setEnabled(true);
            } else if (component instanceof JComboBox ) {
                //jComboBox.setEnabled(false);
                component.setEnabled(true);
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
//        for (Enumeration<AbstractButton> buttons = opciones.getElements(); buttons.hasMoreElements();) {
//            buttons.nextElement().setEnabled(false);
        }

    
    public static void CargarMarcas(JComboBox cboMarca){
        try{
         PreparedStatement pstmtMarcas = conn.prepareStatement("Select descripcion from marcas");
         ResultSet marcas = pstmtMarcas.executeQuery();
         
         while(marcas.next()){
             String nomMarca = marcas.getString("descripcion");
             cboMarca.addItem(nomMarca);
         }
        }catch(SQLException ex){
        
        }
    }
    public static void CargarCombos(JComboBox cboidCat) {
        try {
            // Preparamos la consultas
            PreparedStatement pstmtArea = conn.prepareStatement("SELECT  descripcion FROM categorias");
            //PreparedStatement pstmtCargo = conn.prepareStatement("SELECT Descripcion FROM cargos");
            
            // Las ejecutamos
            ResultSet categoria = pstmtArea.executeQuery();
            //ResultSet cargos = pstmtCargo.executeQuery();

            // Agregamos las areas en cbxArea
            while (categoria.next()) {
                String nomCat = categoria.getString("descripcion");
                cboidCat.addItem(nomCat);
            }

            
            

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en cargar opciones", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    
//metodo para insertar datos (nuevo cambio)
    public static void insertarDatos(Articulo articulo, JTable tabla) {
        try {
            PreparedStatement cstmt = conn.prepareCall("{ CALL insertar_articulos(?, ?, ?) }");
            if (articulo.getIdArticulo()== 0) {
                JOptionPane.showMessageDialog(null, "Ingrese un Id", "Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }

            cstmt.setInt(1, articulo.getIdArticulo());
            cstmt.setString(2, articulo.getDescripcion());
            cstmt.setInt(3, articulo.getIdCategoria());
            cstmt.setInt(4, articulo.getIdMarca());
            cstmt.setString(5, articulo.getCaracteristicas());
            cstmt.setInt(6, articulo.getCantidad());
            
            cstmt.execute(); // se inserta los datos a la BD

            // Actualiza el modelo de tabla con los nuevos datos

            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosArticulo.mostrarDatos(modelo);

            // Actualiza la vista del JTable con el modelo de tabla actualizado
//            tabla.setModel(modelo);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    // Mostrar datos
    public static void mostrarDatos(DefaultTableModel modelo) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_articulos()");
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Object[] row = new Object[]{rs.getInt("idarticulo"), 
                                            rs.getInt("idcategoria"),
                                            rs.getString("categoriadescripcion"),
                                            
                                            rs.getInt("idmarca"),
                                            rs.getString("marcadescripcion"),
                                            rs.getString("caracteristicas"),
                                            rs.getString("descripcion"), 
                                            rs.getString("cantidad") 
                                            
                                            };
                modelo.addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en mostrar datos", JOptionPane.ERROR_MESSAGE);
        }

    }

    // Actualizar datos
    public static void actualizarDatos(Articulo articulo, JTable tabla) {
        try {
            PreparedStatement cstmt = conn.prepareCall("{ CALL actualizar_articulos(?, ?, ?) }");
            cstmt.setInt(1, articulo.getIdCategoria());
            cstmt.setString(2, articulo.getDescripcion());
            cstmt.setInt(3, articulo.getIdCategoria());
            cstmt.setInt(4, articulo.getIdMarca());
            cstmt.setString(5, articulo.getCaracteristicas());
            cstmt.setInt(6, articulo.getCantidad());
            
            cstmt.execute(); // se actualiza los datos en la BD

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosArticulo.mostrarDatos(modelo);


        } catch (HeadlessException | SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Eliminar datos
    public static void eliminarDatos(JTable tabla) {
        try {
            // Obtener el indice de la fila seleccionada
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                if (opcion == JOptionPane.YES_OPTION) {
                    // Obtener los datos de fila seleccionada
                    int id =  Integer.parseInt(tabla.getModel().getValueAt(fila, 0).toString());  //Se asume que el ID se encuentra en la primera columna

                    // Ejecutar el procedimiento almacenado
                    PreparedStatement stmt = conn.prepareCall("{ CALL eliminar_articulos(?) }");
                    stmt.setInt(1, id);
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

    // Boton Guardar
    public static void guardarCambios(Articulo articulo, JTable tabla) {
        try {
            PreparedStatement stmt = conn.prepareStatement("CALL listar_articulos()");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // El registro ya existe, se debe realizar una actualización
                DatosArticulo.actualizarDatos(articulo, tabla);
            } else {
                // El registro no existe, se debe realizar una inserción
                DatosArticulo.insertarDatos(articulo, tabla);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    
    public static void Editar(JTable tabla, JTextField[] camposTexto, JComboBox[] combos) {
        // Bloqueamos lo siguientes botones del formulario:
//        frmArticulo.btnNuevo.setEnabled(false);
//        frmArticulo.btnEliminar.setEnabled(false);
//        // Habilitamos lo siguientes botontes del formulario:
//        frmArticulo.btnGuardar.setEnabled(true);
//        frmArticulo.btnCancelar.setEnabled(true);
//        // Deshabilitamos la seleccion de filas de la tabla
        tabla.setRowSelectionAllowed(false);

        // Obtener la fila seleccionada
        int filaSeleccionada = tabla.getSelectedRow();
        if (filaSeleccionada >= 0) {
            // Obtener los valores de la fila seleccionada
            Object[] valoresFila = ObtenerValoresFila(filaSeleccionada, tabla); // Usamos el método para obtener los valores de la fila seleccionada de la tabla

            // Llenar los campos de texto con los valores de la fila
            for (int i = 0; i < camposTexto.length; i++) {
                if (valoresFila[i] != null) {
                    camposTexto[i].setText(valoresFila[i].toString());
                } else {
                    camposTexto[i].setText("");
                }

            }

            camposTexto[0].setEnabled(false);
            camposTexto[1].requestFocus();

            // Llenar los combos con los valores de la fila
            for (int i = 0; i < combos.length; i++) {
                combos[i].setSelectedItem(valoresFila[camposTexto.length + i].toString());
            }

//            // Llenar el grupo de botones con los valores de la fila
//            for (Enumeration<AbstractButton> botones = grupoBotones.getElements(); botones.hasMoreElements();) {
//                AbstractButton boton = botones.nextElement();
//                if (boton.getText().equals(valoresFila[camposTexto.length + combos.length].toString())) {
//                    boton.setSelected(true);
//                    break;
//                }
//            }
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");

//            // Habilitamos lo siguientes botones del formulario:
//            frmArticulo.btnNuevo.setEnabled(true);
//            frmArticulo.btnEliminar.setEnabled(true);
//            // Bloqueamos lo siguientes botontes del formulario:
//            frmArticulo.btnGuardar.setEnabled(false);
//            frmArticulo.btnCancelar.setEnabled(false);

            // Habilitamos la seleccion de fila(s) en la tabla
            tabla.setRowSelectionAllowed(true);
        }
    }
     private static Object[] ObtenerValoresFila(int filaSeleccionada, JTable tabla) {
        // Obtener el modelo de la tabla
        TableModel modelo = tabla.getModel();

        // Obtener el número de columnas de la tabla
        int numColumnas = modelo.getColumnCount();

        // Crear un arreglo de objetos para almacenar los valores de la fila
        Object[] valoresFila = new Object[numColumnas];

        // Obtener los valores de la fila seleccionada y guardarlos en el arreglo
        for (int i = 0; i < numColumnas; i++) {
            valoresFila[i] = modelo.getValueAt(filaSeleccionada, i);
        }

        return valoresFila;
    }
     
     
     public static String GenerarCodigoEntero(String tabla){
         CallableStatement cstmt = null;
         String codigo_generado = "";
         
         try{
            cstmt = conn.prepareCall("{ CALL generar_codigoentero(?, ?) }");
            cstmt.setString(1, tabla);
            cstmt.registerOutParameter(2, Types.INTEGER);
            cstmt.execute();
            
            codigo_generado = cstmt.getString(2);
         }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
         }finally{
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

}
