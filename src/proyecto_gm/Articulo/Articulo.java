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

    // Constructor
    public Articulo(int idArticulo, String descripcion, int idCategoria) {
        this.IdArticulo = idArticulo;
        this.descripcion = descripcion;
        this.IdCategoria = idCategoria;
    }

    //get y set
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

    /**
     * @return the IdMarca
     */
    public int getIdMarca() {
        return IdMarca;
    }

    /**
     * @param IdMarca the IdMarca to set
     */
    public void setIdMarca(int IdMarca) {
        this.IdMarca = IdMarca;
    }

    /**
     * @return the caracteristicas
     */
    public String getCaracteristicas() {
        return caracteristicas;
    }

    /**
     * @param caracteristicas the caracteristicas to set
     */
    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
