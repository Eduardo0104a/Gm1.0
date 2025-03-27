package proyecto_gm.Facultades;

//public class Facultades {
//    protected String id, descripcion;
//
//    // Constructor
//    public Facultades(String id, String descripcion) {
//        this.id = id;
//        this.descripcion = descripcion;
//    }
//    public Facultades(){
//        
//    }
//
//    // Getters & Setters
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public String getDescripcion() {
//        return descripcion;
//    }
//
//    public void setDescripcion(String descripcion) {
//        this.descripcion = descripcion;
//    }
//    
//    
//}
public class Facultades {
    String Id;
    String Descripcion;

    public Facultades(String Id, String Descripcion) {
        this.Id = Id;
        this.Descripcion = Descripcion;
    }

    public Facultades() {

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
