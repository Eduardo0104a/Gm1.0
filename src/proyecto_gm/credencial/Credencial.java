/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.credencial;

/**
 *
 * @author pc_sistemas2022
 */
public class Credencial {
    
    
    
    
    private String idCredencial;
    private String correo;
    private String clave;
    private String descripcion;
    private String alias;

    public Credencial(String idCredencial, String correo, String clave, String descripcion, String alias) {
        this.idCredencial = idCredencial;
        this.correo = correo;
        this.clave = clave;
        this.descripcion = descripcion;
        this.alias = alias;
    }

    public Credencial() {
    }

    public String getIdCredencial() {
        return idCredencial;
    }

    public void setIdCredencial(String idCredencial) {
        this.idCredencial = idCredencial;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }
    
 
}
