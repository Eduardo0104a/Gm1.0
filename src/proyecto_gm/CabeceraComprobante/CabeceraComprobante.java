package proyecto_gm.CabeceraComprobante;

public class CabeceraComprobante {
    //Atributos
    String NumeroComprobante;
    String FechaEmision;
    String FechaVencimiento;
    float SubTotal;
    float Igv;
    float Total;
    String IdProveedores;
    String IdTipoDocumento;

    public CabeceraComprobante(String NumeroComprobante, String FechaEmision, String FechaVencimiento, float SubTotal, float Igv, float Total, String IdProveedores, String IdTipoDocumento) {
        this.NumeroComprobante = NumeroComprobante;
        this.FechaEmision = FechaEmision;
        this.FechaVencimiento = FechaVencimiento;
        this.SubTotal = SubTotal;
        this.Igv = Igv;
        this.Total = Total;
        this.IdProveedores = IdProveedores;
        this.IdTipoDocumento = IdTipoDocumento;
    }
    
    
    public CabeceraComprobante() {
        
    }

    public String getNumeroComprobante() {
        return NumeroComprobante;
    }

    public void setNumeroComprobante(String NumeroComprobante) {
        this.NumeroComprobante = NumeroComprobante;
    }

    public String getFechaEmision() {
        return FechaEmision;
    }

    public void setFechaEmision(String FechaEmision) {
        this.FechaEmision = FechaEmision;
    }

    public String getFechaVencimiento() {
        return FechaVencimiento;
    }

    public void setFechaVencimiento(String FechaVencimiento) {
        this.FechaVencimiento = FechaVencimiento;
    }

    public float getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(float SubTotal) {
        this.SubTotal = SubTotal;
    }

    public float getIgv() {
        return Igv;
    }

    public void setIgv(float Igv) {
        this.Igv = Igv;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public String getIdProveedores() {
        return IdProveedores;
    }

    public void setIdProveedores(String IdProveedores) {
        this.IdProveedores = IdProveedores;
    }

    public String getIdTipoDocumento() {
        return IdTipoDocumento;
    }

    public void setIdTipoDocumento(String IdTipoDocumento) {
        this.IdTipoDocumento = IdTipoDocumento;
    }

    
    
}
