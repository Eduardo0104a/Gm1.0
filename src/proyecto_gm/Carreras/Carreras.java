package proyecto_gm.Carreras;

public class Carreras {

    protected String id, descripcion;

    // Constructor
    public Carreras(String id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    // Getters & Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
