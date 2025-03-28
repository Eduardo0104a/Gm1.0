package proyecto_gm.Tipo;

public class Tipo {
    //Atributos
    int idTipo;  
    String codigoTipo;  
    String descripcionTipo;

    public Tipo() {   
    }
     
    public Tipo(int idTipo, String codigoTipo, String descripcionTipo) {
        this.idTipo = idTipo;
        this.codigoTipo = codigoTipo;
        this.descripcionTipo = descripcionTipo;
    }
    
    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }
    
    public String getCodigoTipo(){
        return codigoTipo;
    }

    public void setCodigoTipo(String codigoTipo) {
        this.codigoTipo = codigoTipo;
    }

    public String getDescripcionTipo() {
        return descripcionTipo;
    }

    public void setDescripcionTipo(String descripcionTipo) {
        this.descripcionTipo = descripcionTipo;
    }
}
