/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Comunicacion;

import java.awt.TrayIcon;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

/**
 *
 * @author pc_sistemas2022
 */
public class Utilitario {
    enum EstadoProceso{
        NUEVO,
        EDITAR,
        ELIMINAR,
        CONSULTAR
    }
    enum TipoMensaje{
        alerta,
        informativo,
        error
    }
    static void MostrarMensaje(String mensaje, TipoMensaje tipo  ){
        if(null != tipo)switch (tipo) {
            case informativo:
                JOptionPane.showMessageDialog(null, mensaje, "Sistema", JOptionPane.INFORMATION_MESSAGE);
                break;
            case alerta:
                JOptionPane.showMessageDialog(null, mensaje, "Sistema", JOptionPane.WARNING_MESSAGE);
                break;
            case error:
                JOptionPane.showMessageDialog(null, mensaje, "Sistema", JOptionPane.ERROR_MESSAGE);
                break;
            default:
                break;
        }
        
    }
    static String TraerFechaActual(){
        String resultado = "";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
        LocalDateTime fechaActual = LocalDateTime.now();
        
        String sFecha = fechaActual.format(dtf);
        resultado = sFecha;
        return resultado;
    }
    static String TraerFechaInicial(){
        String resultado = "";
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
        LocalDateTime fechaActual = LocalDateTime.now();
        LocalDateTime fechaInicio = LocalDateTime.of(2023, 3, 1,0,0);
        resultado   = fechaInicio.format(dtf);
        return resultado;
    }
    
//    static void MostrarMensajeInformacion(String mensaje, String titulo){
//    
//    }
    
    
}
