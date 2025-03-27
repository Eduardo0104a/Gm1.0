package proyecto_gm.Cargo;

public class Cargo {
    //Atribjtos
    String Id;
    String Descripcion;
    
    public Cargo() {
        
    }
    //metodos con get y set
    public String getId() {
        return Id;
	}
    public void setId(String Id) {
        this.Id = Id;
	}
    
    public String getDescripcion(){
        return Descripcion;
    }
    public void setDescripcion(String Descripcion){
        this.Descripcion=Descripcion;
    }
}
