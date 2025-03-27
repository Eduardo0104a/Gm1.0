package proyecto_gm.CabeceraComprobante;

import java.awt.Graphics;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class frmCabeceraComprobante extends javax.swing.JInternalFrame {

    boolean esNuevo = false;

    public frmCabeceraComprobante() {
        initComponents();
        DefaultTableModel modelo = (DefaultTableModel) tblCabezera.getModel();

        DatosCabeceraComprobante.Mostrar(modelo);
        DatosCabeceraComprobante.CargarCombo(cboProveedores, cboTipoDocumento);
       
        DatosCabeceraComprobante.Habilitar(escritorio, false);
        // Quitar la edicion de las celdas
        tblCabezera.setCellSelectionEnabled(false);
        // Poder seleccionar fila(s) de la tabla
        tblCabezera.setRowSelectionAllowed(true);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ImageIcon icon = new ImageIcon(getClass().getResource("/iconos/fondo.jpg"));
        Image image = icon.getImage();
        escritorio = new javax.swing.JDesktopPane(){
            public void paintComponent(Graphics g) {
                g.drawImage(image, 0, 0, getWidth(), getHeight(), this);
            }
        };
        btnAgregar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnDeshacer = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtNumeroFactura = new javax.swing.JTextField();
        txtFechaEmision = new javax.swing.JTextField();
        txtFechaVencimiento = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCabezera = new javax.swing.JTable();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtTotal = new javax.swing.JTextField();
        cboProveedores = new javax.swing.JComboBox<>();
        cboTipoDocumento = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        txtSubTotal = new javax.swing.JTextField();
        txtIgv = new javax.swing.JTextField();

        setClosable(true);
        setIconifiable(true);
        setTitle("CABECERA DE COMPROBANTE");

        btnAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/agregar.png"))); // NOI18N
        btnAgregar.setName("agregar"); // NOI18N
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });

        btnEditar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/editar.png"))); // NOI18N
        btnEditar.setName("editar"); // NOI18N
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/eliminar.png"))); // NOI18N
        btnEliminar.setName("eliminar"); // NOI18N
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/guardar.png"))); // NOI18N
        btnGuardar.setName("guardar"); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnDeshacer.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/regresar.png"))); // NOI18N
        btnDeshacer.setName("deshacer"); // NOI18N
        btnDeshacer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeshacerActionPerformed(evt);
            }
        });

        jLabel1.setText("Numero de Comprobante:");

        jLabel2.setText("Fecha de Emision:");

        jLabel3.setText("Fecha de Vencimiento:");

        txtNumeroFactura.setNextFocusableComponent(txtFechaEmision);

        txtFechaEmision.setNextFocusableComponent(txtFechaVencimiento);
        txtFechaEmision.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtFechaEmisionKeyTyped(evt);
            }
        });

        txtFechaVencimiento.setNextFocusableComponent(txtSubTotal);
        txtFechaVencimiento.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtFechaVencimientoKeyTyped(evt);
            }
        });

        tblCabezera.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Numero de Comprobante", "Fecha de Emision", "Fecha de Vencimiento", "Sub Total", "Igv", "Total", "Proveedores", "Tipo de Documento"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblCabezera);
        if (tblCabezera.getColumnModel().getColumnCount() > 0) {
            tblCabezera.getColumnModel().getColumn(0).setResizable(false);
            tblCabezera.getColumnModel().getColumn(1).setResizable(false);
            tblCabezera.getColumnModel().getColumn(2).setResizable(false);
            tblCabezera.getColumnModel().getColumn(3).setResizable(false);
            tblCabezera.getColumnModel().getColumn(4).setResizable(false);
            tblCabezera.getColumnModel().getColumn(5).setResizable(false);
            tblCabezera.getColumnModel().getColumn(6).setResizable(false);
            tblCabezera.getColumnModel().getColumn(7).setResizable(false);
        }

        jLabel4.setText("Total:");

        jLabel5.setText("Proveedores:");

        jLabel6.setText("Tipo de Documento");

        txtTotal.setEditable(false);
        txtTotal.setNextFocusableComponent(cboProveedores);

        cboProveedores.setNextFocusableComponent(cboTipoDocumento);

        cboTipoDocumento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboTipoDocumentoActionPerformed(evt);
            }
        });

        jLabel9.setText("Sub Total:");

        jLabel10.setText("Igv:");

        txtSubTotal.setNextFocusableComponent(txtIgv);
        txtSubTotal.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtSubTotalFocusLost(evt);
            }
        });
        txtSubTotal.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtSubTotalKeyTyped(evt);
            }
        });

        txtIgv.setEditable(false);
        txtIgv.setNextFocusableComponent(txtTotal);

        escritorio.setLayer(btnAgregar, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(btnEditar, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(btnEliminar, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(btnGuardar, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(btnDeshacer, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel1, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel2, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel3, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtNumeroFactura, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtFechaEmision, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtFechaVencimiento, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jScrollPane1, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel4, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel5, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel6, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtTotal, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(cboProveedores, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(cboTipoDocumento, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel9, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(jLabel10, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtSubTotal, javax.swing.JLayeredPane.DEFAULT_LAYER);
        escritorio.setLayer(txtIgv, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout escritorioLayout = new javax.swing.GroupLayout(escritorio);
        escritorio.setLayout(escritorioLayout);
        escritorioLayout.setHorizontalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(btnAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnEditar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnEliminar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnGuardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnDeshacer))
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3))
                        .addGap(18, 18, 18)
                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(escritorioLayout.createSequentialGroup()
                                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(txtFechaEmision, javax.swing.GroupLayout.DEFAULT_SIZE, 147, Short.MAX_VALUE)
                                    .addComponent(txtFechaVencimiento))
                                .addGap(32, 32, 32)
                                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addGroup(escritorioLayout.createSequentialGroup()
                                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(jLabel10)
                                            .addComponent(jLabel4))
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                            .addComponent(txtTotal, javax.swing.GroupLayout.DEFAULT_SIZE, 148, Short.MAX_VALUE)
                                            .addComponent(txtIgv)))
                                    .addGroup(escritorioLayout.createSequentialGroup()
                                        .addComponent(jLabel9)
                                        .addGap(18, 18, 18)
                                        .addComponent(txtSubTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE))))
                            .addComponent(txtNumeroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel6)
                            .addComponent(jLabel5))
                        .addGap(18, 18, 18)
                        .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cboTipoDocumento, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(cboProveedores, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 176, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 895, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(18, Short.MAX_VALUE))
        );
        escritorioLayout.setVerticalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnEditar)
                    .addComponent(btnAgregar)
                    .addComponent(btnEliminar)
                    .addComponent(btnGuardar)
                    .addComponent(btnDeshacer, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(18, 18, 18)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtNumeroFactura, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9)
                    .addComponent(txtSubTotal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5)
                    .addComponent(cboProveedores, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtFechaEmision, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addComponent(txtIgv, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(9, 9, 9)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtFechaVencimiento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6)
                    .addComponent(cboTipoDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(txtTotal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 266, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(15, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        DatosCabeceraComprobante.Habilitar(escritorio, true);
        txtNumeroFactura.requestFocus();
        esNuevo = true;
        tblCabezera.setRowSelectionAllowed(false);
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        esNuevo = false;
        // Agrupar las cajas de texto
        JTextField[] camposTexto = {txtNumeroFactura, txtFechaEmision, txtFechaVencimiento,
            txtSubTotal, txtIgv, txtTotal};
        // Agrupar los combo boxes
        JComboBox[] combos = {cboProveedores, cboTipoDocumento};

        DatosCabeceraComprobante.Editar(escritorio, tblCabezera, camposTexto, combos);

    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        // TODO add your handling code here:
        DatosCabeceraComprobante.Eliminar(tblCabezera);
        DatosCabeceraComprobante.Habilitar(escritorio, false);
        //DatosCabeceraComprobante.Bloquear(escritorio);

    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        String[] opciones = DatosCabeceraComprobante.Capturar(cboProveedores, cboTipoDocumento);
        // Creamos un objeto tipo Empleado
        CabeceraComprobante cab = new CabeceraComprobante(txtNumeroFactura.getText(),
                txtFechaEmision.getText(), txtFechaVencimiento.getText(), Float.parseFloat(txtSubTotal.getText()), Float.parseFloat(txtIgv.getText()), Float.parseFloat(txtTotal.getText()),
                opciones[0],
                opciones[1]);
        // Preguntamos si haremos un INSERT o un UPDATE

        if (esNuevo) {
            // Insertar nuevo registro
            if (DatosCabeceraComprobante.ValidarCampos(cab)) {
                DatosCabeceraComprobante.Insertar(cab, tblCabezera);
                JOptionPane.showMessageDialog(null, "Datos guardados correctamente");
                DatosCabeceraComprobante.Limpiar(escritorio);
                DatosCabeceraComprobante.Habilitar(escritorio, false);

                tblCabezera.clearSelection();
                // Habilitamos la seleccion de filas de la tabla
                tblCabezera.setRowSelectionAllowed(true);
            }
        } else {
            if (DatosCabeceraComprobante.ValidarCampos(cab)) {
                DatosCabeceraComprobante.Actualizar(cab, tblCabezera);
                JOptionPane.showMessageDialog(null, "Datos actualizados correctamente");
                DatosCabeceraComprobante.Limpiar(escritorio);
                DatosCabeceraComprobante.Habilitar(escritorio, false);

                tblCabezera.clearSelection();
                // Habilitamos la seleccion de filas de la tabla
                tblCabezera.setRowSelectionAllowed(true);
            }
        }

    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnDeshacerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeshacerActionPerformed
        // TODO add your handling code here:
        DatosCabeceraComprobante.Limpiar(escritorio);
        DatosCabeceraComprobante.Habilitar(escritorio, false);
        tblCabezera.clearSelection();
        // Habilitamos la seleccion de filas de la tabla
        tblCabezera.setRowSelectionAllowed(true);

    }//GEN-LAST:event_btnDeshacerActionPerformed

    private void cboTipoDocumentoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboTipoDocumentoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cboTipoDocumentoActionPerformed

    private void txtFechaEmisionKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtFechaEmisionKeyTyped
        // TODO add your handling code here:
        char c = evt.getKeyChar();
        if (c == evt.VK_BACK_SPACE) {
            // permitir eliminar el carácter anterior incluso si es una diagonal
            String fecha = txtFechaEmision.getText();
            int length = fecha.length();
            if (length > 0) {
                // eliminar el último carácter de la cadena
                fecha = fecha.substring(0, length - 1);
                txtFechaEmision.setText(fecha);
            }
        } else if (!(Character.isDigit(c))) {
            evt.consume(); // Si no es un número, se ignora el evento de tecla
        }

        String fecha = txtFechaEmision.getText();
        int length = fecha.length();
        if (length == 2 || length == 5) { // Si se ha ingresado un día o un mes completo, se agrega el guión correspondiente
            fecha += "/";
            txtFechaEmision.setText(fecha);
        }

        if (length >= 10) {
            evt.consume(); // Si ya se ha ingresado la fecha completa, se ignora el evento de tecla
        }
    }//GEN-LAST:event_txtFechaEmisionKeyTyped

    private void txtFechaVencimientoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtFechaVencimientoKeyTyped
        // TODO add your handling code here:
        char c = evt.getKeyChar();
        if (c == evt.VK_BACK_SPACE) {
            // permitir eliminar el carácter anterior incluso si es una diagonal
            String fecha = txtFechaVencimiento.getText();
            int length = fecha.length();
            if (length > 0) {
                // eliminar el último carácter de la cadena
                fecha = fecha.substring(0, length - 1);
                txtFechaVencimiento.setText(fecha);
            }
        } else if (!(Character.isDigit(c))) {
            evt.consume(); // Si no es un número, se ignora el evento de tecla
        }

        String fecha = txtFechaVencimiento.getText();
        int length = fecha.length();
        if (length == 2 || length == 5) { // Si se ha ingresado un día o un mes completo, se agrega el guión correspondiente
            fecha += "/";
            txtFechaVencimiento.setText(fecha);
        }

        if (length >= 10) {
            evt.consume(); // Si ya se ha ingresado la fecha completa, se ignora el evento de tecla
        }
    }//GEN-LAST:event_txtFechaVencimientoKeyTyped

    private void txtSubTotalFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtSubTotalFocusLost
        // TODO add your handling code here:
        float Igv = (float) (Math.round((Float.parseFloat(txtSubTotal.getText()) * 0.18) * 100.0) / 100.0);
        txtIgv.setText(String.valueOf(Igv));

        float Total = Float.parseFloat(txtSubTotal.getText()) + Igv;
        txtTotal.setText(String.valueOf(Total));
    }//GEN-LAST:event_txtSubTotalFocusLost

    private void txtSubTotalKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSubTotalKeyTyped
        // TODO add your handling code here:
        char c = evt.getKeyChar();
        String text = txtSubTotal.getText();

        if (!(Character.isDigit(c) || c == '.')) {
            evt.consume(); // Si no es un número o un punto, se ignora el evento de tecla
        } else if (c == '.' && text.contains(".")) {
            evt.consume(); // Si el carácter ingresado es un punto y ya hay un punto en el campo de texto, se ignora el evento de tecla
        } else if (text.contains(".") && text.length() - text.indexOf(".") > 2) {
            evt.consume(); // Si ya hay dos decimales en el campo de texto, se ignora el evento de tecla
        } else if (text.equals("0") && c != '.') {
            evt.consume(); // Si el primer carácter es 0 y el siguiente carácter no es un punto, se ignora el evento de tecla
        }
    }//GEN-LAST:event_txtSubTotalKeyTyped


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnDeshacer;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JComboBox<String> cboProveedores;
    private javax.swing.JComboBox<String> cboTipoDocumento;
    private javax.swing.JDesktopPane escritorio;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblCabezera;
    private javax.swing.JTextField txtFechaEmision;
    private javax.swing.JTextField txtFechaVencimiento;
    private javax.swing.JTextField txtIgv;
    private javax.swing.JTextField txtNumeroFactura;
    private javax.swing.JTextField txtSubTotal;
    private javax.swing.JTextField txtTotal;
    // End of variables declaration//GEN-END:variables
}
