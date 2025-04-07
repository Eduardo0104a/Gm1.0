package proyecto_gm.Proveedores;

public class Proveedores {
    //Atributos

    String IdProveedor, Nombres, Direccion, Correo, Telefono, Ruc, departamentoId;

    public Proveedores(String IdProveedor, String Nombres, String Direccion, String Correo, String Telefono, String Ruc, String departamentoId) {
        this.IdProveedor = IdProveedor;
        this.Nombres = Nombres;
        this.Direccion = Direccion;
        this.Correo = Correo;
        this.Telefono = Telefono;
        this.Ruc = Ruc;
        this.departamentoId = departamentoId;
    }

    public Proveedores() {
    }

    public String getIdProveedor() {
        return IdProveedor;
    }

    public void setIdProveedor(String IdProveedor) {
        this.IdProveedor = IdProveedor;
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

    public String getDepartamentoId() {
        return departamentoId;
    }

    public void setDepartamentoId(String departamentoId) {
        this.departamentoId = departamentoId;
    }

}
