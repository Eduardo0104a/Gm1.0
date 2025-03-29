package proyecto_gm.Articulo;

public class Articulo {
    protected int IdArticulo;
    protected int IdCategoria;
    private int IdMarca;
    private String caracteristicas;
    
    protected String  descripcion;
    private int cantidad;
    protected String categoriadescripcion;
    protected String marcadescripcion;

    public Articulo(int idArticulo, String descripcion, int idCategoria) {
        this.IdArticulo = idArticulo;
        this.descripcion = descripcion;
        this.IdCategoria = idCategoria;
    }

    public int getIdArticulo() {
        return IdArticulo;
    }

    public void setIdArticulo(int IdArticulo) {
        this.IdArticulo = IdArticulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.IdCategoria = idCategoria;
    }

    public int getIdMarca() {
        return IdMarca;
    }

    public void setIdMarca(int IdMarca) {
        this.IdMarca = IdMarca;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}