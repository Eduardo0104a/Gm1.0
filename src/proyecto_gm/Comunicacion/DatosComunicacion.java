/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Comunicacion;


import com.mysql.cj.protocol.Resultset;
import java.sql.*;

//import java.util.Date;
import java.text.SimpleDateFormat;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import proyecto_gm.ConexionBD;
import proyecto_gm.proyectos.Proyectos;

/**
 *
 * @author pc_sistemas2022
 */
//Lista los datos de la tabla comunicacion
public class DatosComunicacion {
    public DatosComunicacion(){}
    Comunicacion entidad = new Comunicacion();
    //ConexionBD objCon = new ConexionBD();
    static Connection conn = ConexionBD.getConnection();
    //funcion para obtener el numero numero de codigo
   
     static boolean Validar(Comunicacion entidad){
        boolean estado = true;
            if(entidad.getNombreProyecto().equals("")){
                Utilitario.MostrarMensaje("Ingresar nombre de proeyecto", Utilitario.TipoMensaje.alerta);
                return false;
            }
            if(entidad.getTipo() == -1){
                Utilitario.MostrarMensaje("Seleccionar tipo", Utilitario.TipoMensaje.alerta);
                return false;
                
            }
            
            if(entidad.getCodDoc().equals("")){
                Utilitario.MostrarMensaje("Ingresar codigo documento", Utilitario.TipoMensaje.alerta);
                return false;
            }
            if(entidad.getOrigen().equals("")){
                Utilitario.MostrarMensaje("Ingresar origen", Utilitario.TipoMensaje.alerta);
                return false;
            }
            if(entidad.getDestino().equals("")){
                Utilitario.MostrarMensaje("Ingresar destino", Utilitario.TipoMensaje.alerta);
                return false;
            }
            
            if(entidad.getFlujo() == -1 ){
                Utilitario.MostrarMensaje("Seleccionar flujo", Utilitario.TipoMensaje.alerta);
                return false;
            }
                
            if(entidad.getAsunto().equals("")){
                Utilitario.MostrarMensaje("Ingresar asunto", Utilitario.TipoMensaje.alerta);
                return false;
            }
            if(entidad.getEstado() == -1){
                Utilitario.MostrarMensaje("Seleccionar estado", Utilitario.TipoMensaje.alerta);
                return false;
            }
            
            if(entidad.getEnlace().equals("")){
                Utilitario.MostrarMensaje("Ingresar enlace", Utilitario.TipoMensaje.alerta);
                return  false;
            }
            return estado;
    }
     //Proceso para insertar un registor al tabla comunicacion
    static boolean Insertar(Comunicacion entidad){
        boolean estadoProceso  = false;
        try {
            
            //Llmar al procedimiento almacenado
            CallableStatement proc = conn.prepareCall(" {call insertar_comunicacion(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
        
            //validacion de campos con valores en blanco
            
            
            if(Validar(entidad)== true){
                
            
            proc.setString("parId", entidad.getId());
            proc.setString("parIdPeriodo",entidad.getIdPeriodo());
                    proc.setString("parNomProy", entidad.getNombreProyecto());
                    proc.setInt("parTipo", entidad.getTipo());
                    proc.setString("parCodDoc", entidad.getCodDoc());
                    proc.setString("parOrigen", entidad.getOrigen());
                    proc.setString("parDestino", entidad.getDestino());
                    proc.setInt("parFlujo", entidad.getFlujo());
                    proc.setString("parAsunto", entidad.getAsunto());                    
                    proc.setDate("parFecha", entidad.getFecha());                    
                    proc.setString("parCodDocRespuesta", entidad.getCodDocRespuesta());
                    proc.setInt("parEstado", entidad.getEstado());
                    proc.setString("parEnlace", entidad.getEnlace());
                    estadoProceso = proc.execute();
                    
                    estadoProceso = true;
                    }
        } catch (SQLException exSQL) {
            System.err.println("Error en proceso insertar..." + exSQL.getMessage());
            estadoProceso = false;
        }
        return estadoProceso;
    }
    //Metod par aactualizr registro
    static boolean  Actualizar(Comunicacion entidad) {
        boolean estadoProceso  = false;
        try{
         CallableStatement proc = conn.prepareCall(" {call actualizar_comunicacion(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
          if(Validar(entidad)== true){
                
            
            proc.setString("parId", entidad.getId());
            proc.setString("parIdPeriodo",entidad.getIdPeriodo());
                    proc.setString("parNomProy", entidad.getNombreProyecto());
                    proc.setInt("parTipo", entidad.getTipo());
                    proc.setString("parCodDoc", entidad.getCodDoc());
                    proc.setString("parOrigen", entidad.getOrigen());
                    proc.setString("parDestino", entidad.getDestino());
                    proc.setInt("parFlujo", entidad.getFlujo());
                    proc.setString("parAsunto", entidad.getAsunto());                    
                    proc.setDate("parFecha", entidad.getFecha());                    
                    proc.setString("parCodDocRespuesta", entidad.getCodDocRespuesta());
                    proc.setInt("parEstado", entidad.getEstado());
                    proc.setString("parEnlace", entidad.getEnlace());
                    estadoProceso = proc.execute();
          }else{
            estadoProceso  = false;
          }
          
        }catch(SQLException ex){
            estadoProceso = false;
        }
        return estadoProceso;
    }
    
        
    static String GenerarCodigo(){
        String codigoGenerado = "";
        try{
            CallableStatement cst = conn.prepareCall("{call generar_codigocomunicacion()}");
            ResultSet rs =null;
            
            rs = cst.executeQuery();
            
            while(rs.next()){
                codigoGenerado = rs.getString(1);
            }
        }catch(SQLException ex){
         System.out.println("Error al GenerarCodigo:"+ ex.getMessage());
        }
        return codigoGenerado;
    }
    static void ConfigurarGrilla(DefaultTableModel modelo){
    
    try{
        modelo.setColumnCount(0);
        modelo.setRowCount(0);      
        //formateo las columnas de la tabla
        //ArrayList<Comunicacion> lista = new ArrayList<Comunicacion>();
        // 
        // NombreProyecto->Proyecto,  Codigo -> Id, Periodo-> IdPeriodo,  Tipo, TipoDesc, CodDoc, Origen, Destino, Flujo, FlujoDesc, Asunto, Fecha, CodDocRespuesta,Estado, EstadoDesc, Enlace
          String columnas[] = {"Proyecto","Codigo","Periodo","Tipo", 
                              "TipoDesc", "Cod.Doc", "Origen", "Destino", 
                              "Flujo", "FlujoDesc","Asunto", "Fecha", 
                              "Cod.Doc.Resp","Enlace",  "Estado","EstadoDesc"  
                              , "Dias"};
          //ocultar el id
          //modelo.addColumn(columnas);
          //ocultar idperiodo
          
        modelo.addColumn(columnas[0]); // proyecto = Nombreproyecto
        modelo.addColumn(columnas[1]); // codigo = Id
        modelo.addColumn(columnas[2]); // periodo  = IdPeriodo
        modelo.addColumn(columnas[3]); //Tipo = Tipo
        modelo.addColumn(columnas[4]); //TipDesc = TipoDesc
        modelo.addColumn(columnas[5]); // cod.doc = codDoc
        
        modelo.addColumn(columnas[6]);//Origen = origen
        modelo.addColumn(columnas[7]);//Destino = destino
        modelo.addColumn(columnas[8]);//Flujo = Flujo
        modelo.addColumn(columnas[9]);//FlujoDesc = FlujoDesc
        modelo.addColumn(columnas[10]);//Asunto = asunto
        modelo.addColumn(columnas[11]);//Fecha = fecha
        modelo.addColumn(columnas[12]);//Cod.Doc.Resp = CodDocRespuesta       //
        modelo.addColumn(columnas[13]);  // enlace
        modelo.addColumn(columnas[14]); // Estado
        modelo.addColumn(columnas[15]); //EstadoDesc
        modelo.addColumn(columnas[16]); // Dias  = dias
        // Id -> codigo
        // -- , , , Tipo, TipoDesc, CodDoc, Origen, Destino, Flujo, FlujoDesc, Asunto, Fecha, CodDocRespuesta,Estado, EstadoDesc, Enlace, Dias
        
    }catch(Exception ex){
        System.out.println("Error al configurar grilla:"+ ex.getMessage());
    }
    
    
    }
    static void OcultarColumna(JTable tabla, int indiceColumna){
        tabla.getColumnModel().getColumn(indiceColumna).setMaxWidth(0);
        tabla.getColumnModel().getColumn(indiceColumna).setMinWidth(0);
        tabla.getColumnModel().getColumn(indiceColumna).setPreferredWidth(0);
    }
//    public ArrayList<Comunicacion> Listar(DefaultTableModel modelo){
    static  void Listar(JTable tabla){
        ResultSet rs = null;        
        DefaultTableModel modelo = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int i, int i1) { return false; }            
        };
        
        //configuracion de grilla
        ConfigurarGrilla(modelo);
        
        try{
                        
        CallableStatement cst = conn.prepareCall("{ call listar_comunicacion() }");
        rs  = cst.executeQuery();
        int i = 0;
        //mientras realizo la lectura de registros
        while(rs.next()){                    
            
                String[] campos = rs.getString("Fecha").split("/");
                //String dia, mes, anio;
                //dia = campos[0]; mes = campos[1];
            //String fechaFormato =  campos[2]+"/"+campos[1]+"/"+ campos[0]; // anio
            String fechaFormato = rs.getString("Fecha");
            //agrego el resultado de la consulta al arreglo de tipo object
            Object registro[]  = new Object[] {  
                rs.getString("NombreProyecto"), //0
                rs.getString("Id"),  // 1
                rs.getString("IdPeriodo"),  // 2
                rs.getInt("Tipo"),  // 3
                rs.getString("TipoDesc"), //4 
                rs.getString("CodDoc"), // 5
                rs.getString("Origen"), // 6
                rs.getString("Destino"), // 7
                rs.getInt("Flujo"),  // 8
                rs.getString("FlujoDesc"),  // 9
                rs.getString("Asunto"),  // 10
                fechaFormato,  // 11
                rs.getString("CodDocRespuesta"), // 12
                rs.getString("Enlace"),// 13
                rs.getInt("Estado"),         // 14                           
                rs.getString("EstadoDesc"),  // 15 
                rs.getString("Dias")}; // 16
            
           //insertar al modelo de la tabla la variable tipo objeto
         modelo.addRow(registro);
        }
   
        tabla.setModel(modelo);
        /*
        OcultarColumna(tabla, 1);
        OcultarColumna(tabla, 2);
        OcultarColumna(tabla, 3);
        OcultarColumna(tabla, 8);
        OcultarColumna(tabla, 14);
        */
        }catch(Exception ex){
            System.out.println("Error al listar:"+ ex.getMessage());
        }
        //return lista;
    }
    
    
    static void Listar(JTable tabla, String parFiltro, String parFechaInicio, String parFechaFin,
            int parEstadoCodigo, int  parFlujoCodigo,  String parOrigen, String parDestino){
        
                ResultSet rs = null;
        
        DefaultTableModel modelo = new DefaultTableModel(){
            @Override
            public boolean isCellEditable(int i, int i1) {
                return false;
            }
            
        };
        ConfigurarGrilla(modelo);
        
        try{
      CallableStatement cst = conn.prepareCall("{ call listar_comunicacionesfiltrados(?,?,?,?,?,?,?) }");
      cst.setString("parFiltro", parFiltro);
      cst.setString("parFechaInicio", parFechaInicio);
      cst.setString("parFechaFin", parFechaFin);
      cst.setInt("parEstadoCodigo", parEstadoCodigo);
      cst.setInt("parFlujoCodigo", parFlujoCodigo);
      cst.setString("parOrigen", parOrigen);
      cst.setString("parDestino", parDestino);
        rs  = cst.executeQuery();
        
        int i = 0;
        //mientras realizo la lectura de registros
        while(rs.next()){                    
            
                //String[] campos = rs.getString("Fecha").split("-");
                    //String campos = rs.getString("Fecha");
                    //String fechaFormato = campos;
            //String fechaFormato =  campos[2]+"/"+campos[1]+"/"+ campos[0]; // anio
            //agrego el resultado de la consulta al arreglo de tipo object
            Object registro[]  = new Object[] {  rs.getString("NombreProyecto"), 
                rs.getString("Id"), 
                rs.getString("IdPeriodo"), 
                rs.getInt("Tipo"), 
                rs.getString("TipoDesc"),
                rs.getString("CodDoc"), 
                rs.getString("Origen"), 
                rs.getString("Destino"),
                rs.getInt("Flujo"), 
                rs.getString("FlujoDesc"), 
                rs.getString("Asunto"), 
                //rs.getDate("Fecha"),                
                rs.getString("Fecha"),
                rs.getString("CodDocRespuesta"),
                rs.getString("Enlace"),                 
                rs.getInt("Estado"), 
                rs.getString("EstadoDesc"), 
                rs.getString("Dias")};
             String fechaformateado = rs.getDate("Fecha").toString();
           //insertar al modelo de la tabla la variable tipo objeto
         modelo.addRow(registro);
        }
        
        tabla.setModel(modelo);
        /*
        OcultarColumna(tabla, 1);
        OcultarColumna(tabla, 2);
        OcultarColumna(tabla, 3);
        OcultarColumna(tabla, 8);
        OcultarColumna(tabla, 14);
        */
        }catch(Exception ex){
            System.out.println("Error al listar con filtros:"+ ex.getMessage());
        }
    }
    
   

    
}
