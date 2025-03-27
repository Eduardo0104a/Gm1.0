/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.proyectos;

import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author pc_sistemas2022
 */
public class DatosProyectos {
    public static  List<Proyectos> listar(){
        ArrayList<Proyectos> lista = new ArrayList<Proyectos>();
        
        Proyectos p1 = new Proyectos();
        p1.setId("PY01");
        p1.setDescripcion("QUINUA SAN FRANCISCO");
        lista.add(p1);
                
        Proyectos p2 = new Proyectos();
        p2.setId("PY02");
        p2.setDescripcion("LLATA");
        lista.add(p2);
        
        Proyectos p3 = new Proyectos();
        p3.setId("PY03");
        p3.setDescripcion("CONSORCIO SANTA ROSA");
        lista.add(p3);
        
        return lista;
    }
}
