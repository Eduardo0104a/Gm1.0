package proyecto_gm.Area;

public class Area {
    //Atributos
    int idArea;  
    String codigoArea;  
    String descripcionArea;

     public Area() {   
    }
     
    public Area(int idArea, String codigoArea, String descripcionArea) {
        this.idArea = idArea;
        this.codigoArea = codigoArea;
        this.descripcionArea = descripcionArea;
    }
    
    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }
    
    public String getCodigoArea(){
        return codigoArea;
    }

    public void setCodigoArea(String codigoArea) {
        this.codigoArea = codigoArea;
    }

    public String getDescripcionArea() {
        return descripcionArea;
    }

    public void setDescripcionArea(String descripcionArea) {
        this.descripcionArea = descripcionArea;
    }
}
