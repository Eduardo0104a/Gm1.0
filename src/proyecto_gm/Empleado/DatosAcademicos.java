/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Empleado;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import proyecto_gm.ConexionBD;

/**
 *
 * @author jeanv
 */
public class DatosAcademicos {

    static Connection conn = ConexionBD.getConnection();

    // Cargar opciones para los combo boxes
    public static void CargarCombos(JComboBox cboInstitucion, JComboBox cboFacultad, JComboBox cboCarrera) {
        PreparedStatement pstmtIns = null;
        PreparedStatement pstmtFac = null;
        PreparedStatement pstmtCar = null;

        ResultSet rsIns = null;
        ResultSet rsFac = null;
        ResultSet rsCar = null;
        try {
            // Preparamos la consultas
            pstmtIns = conn.prepareStatement("SELECT RazonSocial FROM institucioneseducativas");
            pstmtFac = conn.prepareStatement("SELECT Descripcion FROM facultades");
            pstmtCar = conn.prepareStatement("SELECT Descripcion FROM carreras");

            // Ejecutamos
            rsIns = pstmtIns.executeQuery();
            rsFac = pstmtFac.executeQuery();
            rsCar = pstmtCar.executeQuery();

            // Llenamos cbxInstitucion
            while (rsIns.next()) {
                String inst = rsIns.getString("RazonSocial");
                cboInstitucion.addItem(inst);
            }

            // Llenamos cbxFacultad
            while (rsFac.next()) {
                String fac = rsFac.getString("Descripcion");
                cboFacultad.addItem(fac);
            }

            // Llenamos cbxCarrera
            while (rsCar.next()) {
                String car = rsCar.getString("Descripcion");
                cboCarrera.addItem(car);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (rsIns != null) {
                    rsIns.close();
                }
                if (rsFac != null) {
                    rsFac.close();
                }
                if (rsCar != null) {
                    rsCar.close();
                }
                if (pstmtIns != null) {
                    pstmtIns.close();
                }
                if (pstmtFac != null) {
                    pstmtFac.close();
                }
                if (pstmtCar != null) {
                    pstmtCar.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // Capturar las opciones de los radio buttons y de los combo boxes
    public static String[] CapturarOpciones(JComboBox cbxIns, JComboBox cbxFac, JComboBox cbxCar) {
        String[] ids = new String[3];
        String idIns = "", idFac = "", idCar = "";
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            // Capturar las opciones seleccionadas en los combo boxes
            String selectIns = cbxIns.getSelectedItem().toString();
            String selectFac = cbxFac.getSelectedItem().toString();
            String selectCar = cbxCar.getSelectedItem().toString();

            // Obtener los id de las instituciones, facultades y carreras
            cstmt = conn.prepareCall("{ CALL consulta_inst_facu_carr(?, ?, ?) }");
            cstmt.setString(1, selectIns);
            cstmt.setString(2, selectFac);
            cstmt.setString(3, selectCar);
            rs = cstmt.executeQuery();

            while (rs.next()) {
                idIns = rs.getString("Id_ins");
                idFac = rs.getString("Id_fac");
                idCar = rs.getString("Id_car");
            }

            ids[0] = idIns;
            ids[1] = idFac;
            ids[2] = idCar;

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error en Capturar Opciones", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

        return ids;
    }

    // Boton Guardar
    public static void InsertarDatos(Datosacad obj, String dni, String inst, String fac, String car, String cic, String codEstudiante) {
        CallableStatement cstmt = null;
        try {
            cstmt = conn.prepareCall("{ CALL insertar_datos_academicos(?, ?, ?, ?, ?, ?) }");
            cstmt.setString(1, dni);
            cstmt.setString(2, inst);
            cstmt.setString(3, fac);
            cstmt.setString(4, car);
            cstmt.setString(5, cic);
            cstmt.setString(6, codEstudiante);

            if (cstmt.execute() != true) {
                JOptionPane.showMessageDialog(null, "Datos académicos registrados exitosamente.", "Registro exitoso", JOptionPane.INFORMATION_MESSAGE);
                obj.dispose(); // Cerramos la ventana

            } else {
                JOptionPane.showMessageDialog(null, "No se pudieron registrar los datos académicos.", "Error", JOptionPane.ERROR_MESSAGE);
            }

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
    }

}
