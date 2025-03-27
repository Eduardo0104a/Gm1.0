package proyecto_gm.Tipo;

public class Tipo {
    String Id;
    String Descripcion;

    public Tipo(String Id, String Descripcion) {
        this.Id = Id;
        this.Descripcion = Descripcion;
    }

    public Tipo() {
        
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
