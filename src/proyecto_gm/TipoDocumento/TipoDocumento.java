
package proyecto_gm.TipoDocumento;

public class TipoDocumento {
    String Id;
    String IdModulo;
    String Descripcion;
    

    public TipoDocumento(String Id, String IdModulo,  String Descripcion) {
        this.Id = Id;
        this.IdModulo=IdModulo;
        this.Descripcion = Descripcion;
        
    }

    public TipoDocumento() {
        
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }
    public String getIdModulo() {
        return IdModulo;
    }

    public void setIdModulo(String IdModulo) {
        this.IdModulo = IdModulo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
}
