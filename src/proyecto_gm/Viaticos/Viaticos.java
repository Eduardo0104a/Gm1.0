/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Viaticos;

/**
 *
 * @author jeanv
 */
public class Viaticos {
    private int id;
    private String descripcion;
    private float pasaje, menu;
    private String empleado, periodo;
    
    public Viaticos() {
        // Constructor vacio
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPasaje() {
        return pasaje;
    }

    public void setPasaje(float pasaje) {
        this.pasaje = pasaje;
    }

    public float getMenu() {
        return menu;
    }

    public void setMenu(float menu) {
        this.menu = menu;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }
    
    
}
