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
    
    
    
    
    private int idCredencial;
    private String correo;
    private String clave;
    private String descripcion;
    private String alias;
    
    public Credencial(){
        this.idCredencial = 0;
        this.correo = "";
        this.clave = "";
        this.descripcion = "";
        this.alias = "";
    }
    
    /*
    IdCredencial int auto_increment ,
    Correo varchar(200),
    Clave varchar(200),
    Alias varchar(100),
    Descripcion varchar(200),
    primary key (IdCredencial)
    */

    /**
     * @return the idCredencial
     */
    public int getIdCredencial() {
        return idCredencial;
    }

    /**
     * @param idCredencial the idCredencial to set
     */
    public void setIdCredencial(int idCredencial) {
        this.idCredencial = idCredencial;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
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

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the alias
     */
    public String getAlias() {
        return alias;
    }

    /**
     * @param alias the alias to set
     */
    public void setAlias(String alias) {
        this.alias = alias;
    }
}
