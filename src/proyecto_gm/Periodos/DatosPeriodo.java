/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Periodos;

import java.awt.Component;
import java.awt.Container;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author jeanv
 */
public class DatosPeriodo {

    static Connection conn = ConexionBD.getConnection();

    // Limpiar campos
    public static void Limpiar(Container contenedor) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setText("");
            } else if (componente instanceof Container) {
                Limpiar((Container) componente);
            } else {
                // No hace nada para otros tipos de componentes
            }
        }
    }

    // Habilitar campos
    public static void Habilitar(Container contenedor, boolean bloquear) {
        for (Component componente : contenedor.getComponents()) {
            if (componente instanceof JTextField) {
                ((JTextField) componente).setEnabled(bloquear);
            } else if (componente instanceof JButton) {
                String button = ((JButton) componente).getName();
                if (button.equals("guardar") || button.equals("cancelar")) {
                    ((JButton) componente).setEnabled(bloquear);
                } else if (button.equals("nuevo") || button.equals("editar") || button.equals("eliminar")) {
                    ((JButton) componente).setEnabled(!bloquear); // aplicar logica inversa
                } else {
                    // No hace nada para otros tipos de componentes
                }
            }
        }
    }
    // Mostrar datos

    public static void Listar(DefaultTableModel modelo) {
        try {
            PreparedStatement pstmt = conn.prepareStatement("CALL listar_periodos()");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Object[] row = new Object[]{
                    rs.getString("codigoPeriodo"),
                    rs.getString("descripcion")};
                modelo.addRow(row);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Insertar datos
    public static void Insertar(Periodos periodo, JTable tabla) {
        try {
            if (periodo.getId().isEmpty() || periodo.getDescripcion().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Ingrese el Id y el Mes (en letras)", "Sistema", JOptionPane.WARNING_MESSAGE);
                return;
            }

            // Convertir mes en texto (descripción) a número
            int mesNumero = obtenerNumeroMes(periodo.getDescripcion());
            if (mesNumero == 0) {
                JOptionPane.showMessageDialog(null, "Mes inválido. Ejemplo válido: Enero", "Error", JOptionPane.ERROR_MESSAGE);
                return;
            }

            // Llamar al procedimiento almacenado
            CallableStatement cstmt = conn.prepareCall("{ CALL insertar_periodos(?, ?, ?) }");
            cstmt.setInt(1, Integer.parseInt(periodo.getId())); // IdPeriodo
            cstmt.setInt(2, mesNumero); // Mes como número
            cstmt.setString(3, periodo.getDescripcion()); // Descripción: mes en letras
            cstmt.execute();
            cstmt.close();

            // Mostrar mensaje de éxito
            JOptionPane.showMessageDialog(null, "Registro insertado correctamente", "Éxito", JOptionPane.INFORMATION_MESSAGE);

            // Actualizar la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0); // Limpiar filas
            DatosPeriodo.Listar(modelo); // Rellenar tabla de nuevo

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

// Método auxiliar para convertir el mes en texto a número
    private static int obtenerNumeroMes(String nombreMes) {
        nombreMes = nombreMes.toLowerCase().trim();
        switch (nombreMes) {
            case "enero":
                return 1;
            case "febrero":
                return 2;
            case "marzo":
                return 3;
            case "abril":
                return 4;
            case "mayo":
                return 5;
            case "junio":
                return 6;
            case "julio":
                return 7;
            case "agosto":
                return 8;
            case "septiembre":
                return 9;
            case "octubre":
                return 10;
            case "noviembre":
                return 11;
            case "diciembre":
                return 12;
            default:
                return 0;
        }
    }

    // Boton editar
    public static void Editar(Container contenedor, JTable tabla, JTextField[] cajas) {
        // Obtener el indice de la fila seleccionada
        int fila = tabla.getSelectedRow();

        if (fila >= 0) {

            DatosPeriodo.Habilitar(contenedor, true);
            tabla.clearSelection();
            tabla.setRowSelectionAllowed(false);

            for (int i = 0; i < cajas.length; i++) {
                String dato = tabla.getModel().getValueAt(fila, i).toString();
                cajas[i].setText(dato);
            }

            cajas[0].setEnabled(false);
            cajas[1].requestFocus();
        } else {
            JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para editar.");
        }

    }

    // Actualizar datos
    public static void Actualizar(Periodos periodo, JTable tabla) {
        CallableStatement cstmt = null;

        // Confirmación antes de actualizar
        int opcion = JOptionPane.showConfirmDialog(
                null,
                "¿Está seguro de que desea actualizar este periodo?",
                "Confirmar actualización",
                JOptionPane.YES_NO_OPTION,
                JOptionPane.QUESTION_MESSAGE
        );

        if (opcion != JOptionPane.YES_OPTION) {
            return; // Si el usuario elige "No", se cancela
        }

        try {
            cstmt = conn.prepareCall("{ CALL actualizar_periodos(?, ?) }");
            cstmt.setString(1, periodo.getId());
            cstmt.setString(2, periodo.getDescripcion());

            cstmt.execute(); // Ejecutar actualización

            // Actualizar tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            DatosPeriodo.Listar(modelo);

            // Mostrar mensaje de éxito
            JOptionPane.showMessageDialog(null, "Periodo actualizado correctamente.", "Éxito", JOptionPane.INFORMATION_MESSAGE);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // Eliminar datos
    public static void Eliminar(JTable tabla) {
        CallableStatement cstmt = null;
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
                    cstmt = conn.prepareCall("{ CALL eliminar_periodos(?) }");
                    cstmt.setString(1, id);
                    cstmt.execute();

                    // Actualizar el JTable
                    // Actualizamos la tabla
                    DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
                    modelo.setRowCount(0);

                    DatosPeriodo.Listar(modelo);
                } else {
                    tabla.clearSelection();
                }
            } else {
                JOptionPane.showMessageDialog(null, "Debes seleccionar una fila para eliminar.");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // Validar campos
    public static boolean Validar(JTextField[] campos) {
        for (JTextField campo : campos) {
            if (campo.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Debe rellenar todos los campos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                campo.requestFocus();
                return false;
            }

            /*if (campo.getName().equals("id") && campo.getText().length() < 6) {
                JOptionPane.showMessageDialog(null, "El ID debe contener 6 dígitos.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                campo.requestFocus();
                return false;
            }*/
        }
        return true;
    }
}
