
package proyecto_gm.Modulo;

public class Modulo {
    //Atributos
    String Id;
    String Descripcion;

    public Modulo(String Id, String Descripcion) {
        this.Id = Id;
        this.Descripcion = Descripcion;
    }

    public Modulo() {
        
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
}
