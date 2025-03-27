package proyecto_gm.Proveedores;


    public class Proveedores {
        //Atributos
    String Id, Nombres,Direccion, Correo, Telefono, Ruc;

    // Constructor
    public Proveedores(String Id, String Nombres, String Direccion, String Correo, String Telefono, String Ruc) {
        this.Id = Id;
        this.Nombres = Nombres;
        this.Direccion = Direccion;
        this.Correo = Correo;
        this.Telefono = Telefono;
        this.Ruc=Ruc;
    }
    public Proveedores() {
        
    }

    // Getters & Setters

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getRuc() {
        return Ruc;
    }

    public void setRuc(String Ruc) {
        this.Ruc = Ruc;
    }
    
    }