package proyecto_gm.Categoria;

public class Categoria {
    protected int IdCategoria;
    protected String  descripcion;

    // Constructor
    public Categoria(int idCategoria, String descripcion) {
        this.IdCategoria = idCategoria;
        this.descripcion = descripcion;
    }

    // Getters & Setters
    public int getId() {
        return IdCategoria;
    }

    public void setId(int id) {
        this.IdCategoria = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
