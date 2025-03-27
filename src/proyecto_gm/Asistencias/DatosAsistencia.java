/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Asistencias;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;

/**
 *
 * @author jeanv
 */
public class DatosAsistencia {

    static final Connection conn = ConexionBD.getConnection();

    public static void RellenarTabla(JTable tabla, JComboBox mes, JComboBox empleado, JTextField totalHoras, JTextField totalAsistencias) {
        // Obtener el dni del empleado
        String dni = ObtenerDNI(empleado);
        String periodo = mes.getSelectedItem().toString();

        // Parsea el período en mes y año
        int month = Integer.parseInt(periodo.substring(0, 2)); // 05
        int year = Integer.parseInt(periodo.substring(2, 6)); // 2023
        // Crea un objeto Calendar para el primer día del mes
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);
        cal.set(Calendar.DAY_OF_MONTH, 1);

        // Obtiene el último día del mes
        int lastDayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

        // Crea una matriz bidimensional para almacenar los datos de la tabla
        String[][] data = new String[lastDayOfMonth][6];

        // Variables para almacenar el total de horas, minutos, segundos y numero de asistencias
        int totalHorasSum = 0;
        int totalMinutosSum = 0;
        int totalSegundosSum = 0;
        int asistencias = 0;

        // Utiliza un bucle para iterar sobre cada día del mes en el período seleccionado
        for (int i = 0; i < lastDayOfMonth; i++) { 
            // Obtiene el nombre del día de la semana y lo convierte a mayúscula
            String dayName = new SimpleDateFormat("EEEE").format(cal.getTime());
            dayName = dayName.substring(0, 1).toUpperCase() + dayName.substring(1).toLowerCase();

            // Obtiene la fecha en formato dd-mm-YYYY
            String date = new SimpleDateFormat("dd/MM/yyyy").format(cal.getTime());

            // Consulta la base de datos para obtener los datos de entrada y salida para esta fecha
            String entrada = "";
            String salida = "";
            String duracion = "";
            String observaciones = "";

            try ( CallableStatement cstmt = conn.prepareCall("{ CALL obtener_horario_empleado (?, ?) }")) {
                cstmt.setString(1, dni);
                System.out.println("dni consultado:" +  dni);
                cstmt.setString(2, date);
                try ( ResultSet rs = cstmt.executeQuery();) {
                    if (rs.next()) {
                        entrada = rs.getString("Hora_entrada");
                        System.out.println(entrada);
                        salida = rs.getString("Hora_salida") != null ? rs.getString("Hora_salida") : "00:00:00";
                        System.out.println(salida);
                        duracion = rs.getString("Duracion") != null ? rs.getString("Duracion") : "00:00:00";
                        System.out.println(duracion);
                        observaciones = rs.getString("Observaciones");
                        System.out.println(observaciones);
                       
                    }
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }

            
             // Agrega los datos a la matriz bidimensional
                        data[i][0] = dayName;
                        data[i][1] = date;
                        data[i][2] = entrada;
                        data[i][3] = salida;
                        data[i][4] = duracion;
                        data[i][5] = observaciones;
                        
            // Suma las horas, minutos y segundos de la duración
            if (!duracion.isEmpty()) {
                String[] duracionParts = duracion.split(":");
                int horas = Integer.parseInt(duracionParts[0]);
                int minutos = Integer.parseInt(duracionParts[1]);
                int segundos = Integer.parseInt(duracionParts[2]);
                totalHorasSum += horas;
                totalMinutosSum += minutos;
                totalSegundosSum += segundos;
            }

            // Incrementa el objeto Calendar para apuntar al siguiente día del mes
            cal.add(Calendar.DAY_OF_MONTH, 1);
            
       //aca cerraba la llave de los 30 dias
        }
        // Convierte los segundos adicionales a minutos y los minutos adicionales a horas si exceden 60
        int additionalMinutes = totalSegundosSum / 60;
        totalMinutosSum += additionalMinutes;
        totalSegundosSum %= 60;

        int additionalHours = totalMinutosSum / 60;
        totalHorasSum += additionalHours;
        totalMinutosSum %= 60;

        // Crea un nuevo modelo de tabla utilizando la matriz bidimensional
        DefaultTableModel model = new DefaultTableModel(data, new String[]{"DÍA", "FECHA", "ENTRADA", "SALIDA", "DURACIÓN", "OBSERVACIONES"});

        // Configura la tabla para utilizar el nuevo modelo de tabla
        tabla.setModel(model);

        // Muestra el total de horas en el JTextField
        String totalHorasText = String.format("%02d:%02d:%02d", totalHorasSum, totalMinutosSum, totalSegundosSum);
        totalHoras.setText(totalHorasText);
        
        // Muestra la cantidad de asistencias durante el periodo seleccionado
        try (CallableStatement cstmt = conn.prepareCall("{ CALL obtener_cantidad_asistencias(?, ?, ?) }")){
            cstmt.setString(1, dni);
            cstmt.setString(2, periodo);
            cstmt.registerOutParameter(3, Types.INTEGER);
            
            cstmt.execute();
            asistencias = cstmt.getInt(3);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        
        String cantidad_asistencias = String.valueOf(asistencias);
        totalAsistencias.setText(cantidad_asistencias);
    }

    public static void CargarEmpleados(JComboBox combo) {
        //String query = "SELECT CONCAT(dni,'-',ifnull(Nombres,''), ' ', ifnull(Apellidos,'')) AS NombreCompleto FROM empleados ORDER BY Nombres ASC";
        String query = "SELECT dni AS NombreCompleto FROM empleados ORDER BY Nombres ASC";
        try ( PreparedStatement pstmt = conn.prepareStatement(query);  ResultSet rs = pstmt.executeQuery();) {
            while (rs.next()) {
                String nombre_completo = rs.getString("NombreCompleto");
                combo.addItem(nombre_completo);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static String ObtenerDNI(JComboBox combo) {
        String dni = "";
        String empleado = combo.getSelectedItem().toString();
        /*String query = "SELECT Dni FROM empleados WHERE CONCAT(Nombres, ' ', Apellidos) = ?";**/
        String query = "SELECT Dni FROM empleados WHERE dni = ?";
        try ( PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, empleado);
            try ( ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    dni = rs.getString("Dni");
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return dni;
    }

    public static int ObtenerIdAsistencia(String dni, String fecha, String hora) {
        int id = 0;
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL obtener_id_asistencia(?, ?, ?, ?) }");) {
            cstmt.setString(1, dni);
            cstmt.setString(2, fecha);
            cstmt.setString(3, hora);
            cstmt.registerOutParameter(4, Types.INTEGER);

            cstmt.execute();

            id = cstmt.getInt(4);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        System.out.println("id = " + id);
        return id;
    }

    public static void Actualizar(Asistencia a, String entrada, JTable tabla, JComboBox periodo, JComboBox combo, JTextField totalHoras, JTextField totalAsistencias) {
        int id_detalle = obtenerIdDetalleAsistencia(a.getDni(), a.getFecha(), entrada);
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL actualizar_detalle_asistencia(?, ?) }");) {
            cstmt.setInt(1, id_detalle);
            cstmt.setString(2, a.getHora());

            cstmt.execute();

            // Actualizamos la tabla
            DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
            modelo.setRowCount(0);
            RellenarTabla(tabla, periodo, combo, totalHoras, totalAsistencias);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void Insertar(Asistencia a, JTable tabla, JComboBox periodo, JComboBox combo, JTextField totalHoras) {
        try ( CallableStatement cstmt = conn.prepareCall("{ CALL insertar_asistencia(?, ?, ?) }")) {
            cstmt.setString(1, a.getDni());
            cstmt.setString(2, a.getFecha());
            cstmt.setString(3, a.getHora());

            cstmt.execute();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    public static void ColocarObservacion(String dni, String fecha, String entrada, String observacion) {
        int id_detalle = obtenerIdDetalleAsistencia(dni, fecha, entrada);

        if (id_detalle != 0) {
            try ( CallableStatement castmt = conn.prepareCall("{ CALL actualizar_observacion(?, ?) }")) {
                castmt.setInt(1, id_detalle);
                castmt.setString(2, observacion);
                castmt.execute();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private static int obtenerIdDetalleAsistencia(String dni, String fecha, String entrada) {
        int id_detalle = 0;

        try ( CallableStatement cstmt = conn.prepareCall("{ CALL obtener_id_detalle_asistencia(?, ?, ?, ?) }")) {
            cstmt.setString(1, dni);
            cstmt.setString(2, fecha);
            cstmt.setString(3, entrada);
            cstmt.registerOutParameter(4, Types.INTEGER);

            cstmt.execute();

            id_detalle = cstmt.getInt(4);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

        return id_detalle;
    }

    public static void GenerarDetalle(JTable tabla, JComboBox mes, JComboBox empleado, JTextField totalHoras, JTextField totalAsistencias) {
        try ( PreparedStatement pstmt = conn.prepareStatement("{ CALL generar_detalle_asistencia() }")) {
            pstmt.execute();
            RellenarTabla(tabla, mes, empleado, totalHoras, totalAsistencias);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

}
