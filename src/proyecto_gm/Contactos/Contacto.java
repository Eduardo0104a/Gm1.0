/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Contactos;

/**
 *
 * @author USUARIO
 */
public class Contacto {

    /**
     * @return the cuenta
     */
    public String getCuenta() {
        return cuenta;
    }

    /**
     * @param cuenta the cuenta to set
     */
    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    /**
     * @return the clave
     */
    public String getClave() {
        return clave;
    }

    /**
     * @param clave the clave to set
     */
    public void setClave(String clave) {
        this.clave = clave;
    }
    private int Id;
    protected String  Nombre, FechaNacimiento, PersonasRelacionadas, Empresa, Cargo, Correo, Telefono, Departamento, Direccion, Notas;
    private String cuenta;
    private String clave;

    // Constructor
    public Contacto(int Id, String Nombre, String FechaNacimiento, String PersonasRelacionadas, String Empresa, String cuenta, String clave,
                            String Cargo, String Correo, String Telefono, String Departamento, String Direccion, String Notas) {
        this.Id=Id;
        this.Nombre=Nombre;
        this.FechaNacimiento=FechaNacimiento;
        this.PersonasRelacionadas=PersonasRelacionadas;
        this.Empresa=Empresa;
        this.cuenta = cuenta;
        this.clave = clave;
        this.Cargo=Cargo;
        this.Correo=Correo;
        this.Telefono=Telefono;
        this.Departamento=Departamento;
        this.Direccion=Direccion;
        this.Notas=Notas;
        
    }
    
    //get y set

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }
    
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getPersonasRelacionadas() {
        return PersonasRelacionadas;
    }

    public void setPersonasRelacionadas(String PersonasRelacionadas) {
        this.PersonasRelacionadas = PersonasRelacionadas;
    }

    public String getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(String Empresa) {
        this.Empresa = Empresa;
    }

    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
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

    public String getDepartamento() {
        return Departamento;
    }

    public void setDepartamento(String Departamento) {
        this.Departamento = Departamento;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getNotas() {
        return Notas;
    }

    public void setNotas(String Notas) {
        this.Notas = Notas;
    }
    
    
}
