package proyecto_gm.Area;

public class Area {
    //Atributos
    String Id;
    String Descripcion;

    public Area(String Id, String Descripcion) {
        this.Id = Id;
        this.Descripcion = Descripcion;
    }

    public Area() {
        
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
