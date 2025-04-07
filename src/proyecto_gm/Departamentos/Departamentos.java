/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Departamentos;

/**
 *
 * @author EMERSOM APAZA
 */
public class Departamentos {

    String Id;
    String Descripcion;

    public Departamentos(String Id, String Descripcion) {
        this.Id = Id;
        this.Descripcion = Descripcion;
    }

    public Departamentos() {
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    @Override
    public String toString() {
        return Descripcion;
    }

}
