package proyecto_gm.Cargo;

public class Cargo {
   
    private int idCargo;  
    private String codigoCargo;  
    private String descripcion;

    public Cargo() {}

    // Constructor con parámetros
    public Cargo(int idCargo, String codigoCargo, String descripcion) {
        this.idCargo = idCargo;
        this.codigoCargo = codigoCargo;
        this.descripcion = descripcion;
    }

    // Métodos Getters y Setters
    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getCodigoCargo() {
        return codigoCargo;
    }

    public void setCodigoCargo(String codigoCargo) {
        this.codigoCargo = codigoCargo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
