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

public class DatosArticulo {

    static Connection conn = ConexionBD.getConnection();

    public static void habilitarCampos(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEditable(true);
            } else if (componente instanceof JComboBox) {
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
                ((JTextField) component).setText("");
            } else if (component instanceof JComboBox) {
                ((JComboBox) component).setSelectedIndex(0);
            } else {
            }

        }

    }

    public static void BloquearCampos(Container contenedor) {
        Component[] components = contenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JTextField) {
                component.setEnabled(true);
            } else if (component instanceof JComboBox) {
                component.setEnabled(true);
            } else {
            }
        }

    }

    public static void CargarMarcas(JComboBox cboMarca) {
    try {
        cboMarca.removeAllItems(); // Limpiar ComboBox antes de cargar

        PreparedStatement pstmtMarcas = conn.prepareStatement("SELECT IdMarca, descripcion FROM marcas");
        ResultSet marcas = pstmtMarcas.executeQuery();
        while (marcas.next()) {
            cboMarca.addItem(marcas.getInt("IdMarca") + " - " + marcas.getString("descripcion"));
        }
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en cargar marcas", JOptionPane.ERROR_MESSAGE);
    }
}


    public static void CargarCombos(JComboBox cboidCat) {
        try {
            PreparedStatement pstmtArea = conn.prepareStatement("SELECT  descripcion FROM categorias");

            ResultSet categoria = pstmtArea.executeQuery();

            while (categoria.next()) {
                String nomCat = categoria.getString("descripcion");
                cboidCat.addItem(nomCat);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error en cargar opciones", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void insertarDatos(Articulo articulo, JTable tabla) {
    try {
        PreparedStatement cstmt = conn.prepareCall("{ CALL insertar_articulos(?, ?, ?, ?, ?, ?) }");

        cstmt.setInt(1, articulo.getIdArticulo());
        cstmt.setInt(2, articulo.getIdCategoria());
        cstmt.setInt(3, articulo.getIdMarca());
        cstmt.setString(4, articulo.getCaracteristicas());
        cstmt.setString(5, articulo.getDescripcion());
        cstmt.setInt(6, articulo.getCantidad());

        cstmt.execute();

        DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
        modelo.setRowCount(0);
        DatosArticulo.mostrarDatos(modelo);

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al insertar", JOptionPane.ERROR_MESSAGE);
    }
}



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

    public static void actualizarDatos(Articulo articulo, JTable tabla) {
    try {
        // Ajuste aquí: 6 parámetros
        PreparedStatement cstmt = conn.prepareCall("{ CALL actualizar_articulos(?, ?, ?, ?, ?, ?) }");
        
        cstmt.setInt(1, articulo.getIdArticulo());
        cstmt.setInt(2, articulo.getIdCategoria());
        cstmt.setInt(3, articulo.getIdMarca());
        cstmt.setString(4, articulo.getCaracteristicas());
        cstmt.setString(5, articulo.getDescripcion());
        cstmt.setInt(6, articulo.getCantidad());

        cstmt.execute();

        DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
        modelo.setRowCount(0);
        DatosArticulo.mostrarDatos(modelo);

    } catch (HeadlessException | SQLException ex) {
        JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al actualizar", JOptionPane.ERROR_MESSAGE);
    }
}


    public static void eliminarDatos(JTable tabla) {
        try {
            int fila = tabla.getSelectedRow();

            if (fila >= 0) {
                String[] options = {"Sí", "No", "Cancelar"};
                int opcion = JOptionPane.showOptionDialog(null, "¿Está seguro de que quiere eliminar la fila seleccionada?", "Confirmación", JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null, options, options[2]);
                if (opcion == JOptionPane.YES_OPTION) {
                    int id = Integer.parseInt(tabla.getModel().getValueAt(fila, 0).toString());

                    PreparedStatement stmt = conn.prepareCall("{ CALL eliminar_articulos(?) }");
                    stmt.setInt(1, id);
                    stmt.execute();

                    DefaultTableModel model = (DefaultTableModel) tabla.getModel();
                    model.removeRow(fila);
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para eliminar.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    public static void guardarCambios(Articulo articulo, JTable tabla, JComboBox cboMarca) {
    try {
        PreparedStatement stmt = conn.prepareStatement("CALL listar_articulos()");
        ResultSet rs = stmt.executeQuery();

        // Verificar si el artículo existe
        if (rs.next()) {
            DatosArticulo.actualizarDatos(articulo, tabla);
        } else {
            DatosArticulo.insertarDatos(articulo, tabla );
        }

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
}


    public static void Editar(JTable tabla, JTextField[] camposTexto, JComboBox[] combos) {
        tabla.setRowSelectionAllowed(false);

        int filaSeleccionada = tabla.getSelectedRow();
        if (filaSeleccionada >= 0) {
            Object[] valoresFila = ObtenerValoresFila(filaSeleccionada, tabla);
            for (int i = 0; i < camposTexto.length; i++) {
                if (valoresFila[i] != null) {
                    camposTexto[i].setText(valoresFila[i].toString());
                } else {
                    camposTexto[i].setText("");
                }

            }
            camposTexto[0].setEnabled(false);
            camposTexto[1].requestFocus();

            for (int i = 0; i < combos.length; i++) {
                combos[i].setSelectedItem(valoresFila[camposTexto.length + i].toString());
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");
            tabla.setRowSelectionAllowed(true);
        }
    }

    private static Object[] ObtenerValoresFila(int filaSeleccionada, JTable tabla) {
        TableModel modelo = tabla.getModel();

        int numColumnas = modelo.getColumnCount();

        Object[] valoresFila = new Object[numColumnas];

        for (int i = 0; i < numColumnas; i++) {
            valoresFila[i] = modelo.getValueAt(filaSeleccionada, i);
        }

        return valoresFila;
    }

    public static String GenerarCodigoEntero(String tabla) {
        CallableStatement cstmt = null;
        String codigo_generado = "";

        try {
            cstmt = conn.prepareCall("{ CALL generar_codigoentero(?, ?) }");
            cstmt.setString(1, tabla);
            cstmt.registerOutParameter(2, Types.INTEGER);
            cstmt.execute();

            codigo_generado = cstmt.getString(2);
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

}
