package proyecto_gm.Area;

public class Area {
    //Atributos
    int idArea;  
    String codigoArea;  
    String descripcionArea;

     public Area() {   
    }
     
    public Area(String Id, String Descripcion) {
        this.idArea = idArea;
        this.codigoArea = codigoArea;
        this.descripcionArea = descripcionArea;
    }
    
    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(String Id) {
        this.idArea = idArea;
    }

    public void setCodigoArea(String codigoCargo) {
        this.codigoArea = codigoArea;
    }

    public String getDescripcion() {
        return descripcionArea;
    }

    public void setDescripcion(String descripcion) {
        this.descripcionArea = descripcionArea;
    }
}
