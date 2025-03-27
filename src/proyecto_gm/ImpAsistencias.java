/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ImpAsistencias {

    private static final Connection conn = ConexionBD.getConnection();

    public static void importData(String fileName) throws ParseException {
        try {
            String sql = "INSERT INTO asistencias (Dni, Fecha, Hora) VALUES (?, ?, ?)";
            try ( PreparedStatement pstmt = conn.prepareStatement(sql);  FileInputStream inputStream = new FileInputStream(fileName)) {
                Workbook workbook = new HSSFWorkbook(inputStream);
                Sheet sheet = workbook.getSheetAt(0);

                for (Row row : sheet) {
                    if (row.getRowNum() == 0) {
                        // saltar la primera fila (encabezados de columna)
                        continue;
                    }
                    Cell dniCell = row.getCell(0);
                    Cell fechaCell = row.getCell(1);
                    Cell horaCell = row.getCell(2);

                    double dniDouble = dniCell.getNumericCellValue();
                    String dni = String.format("%.0f", dniDouble);

                    // Obtener la fecha como objeto de tipo Date
                    Date fecha = fechaCell.getDateCellValue();

                    // Formatear la fecha al formato "yyyy-MM-dd" para almacenar en la base de datos
                    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String fechaBD = outputFormat.format(fecha);

                    // Obtener la hora como objeto de tipo Date
                    Date horaDate = DateUtil.getJavaDate(horaCell.getNumericCellValue());

                    // Formatear la hora al formato "HH:mm:ss"
                    SimpleDateFormat horaFormat = new SimpleDateFormat("HH:mm:ss");
                    String hora = horaFormat.format(horaDate);

                    pstmt.setString(1, dni);
                    pstmt.setString(2, fechaBD);
                    pstmt.setString(3, hora);
                    pstmt.executeUpdate();
                }

            }
            JOptionPane.showMessageDialog(null, "Los datos han sido importados correctamente.", "Importación Exitosa", JOptionPane.INFORMATION_MESSAGE);

            try ( PreparedStatement pstmt = conn.prepareStatement(" CALL generar_detalle_asistencia() ")) {
                pstmt.execute();
                System.out.println("Detalle de asistencias generado exitosamente");
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        } catch (SQLException | IOException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
