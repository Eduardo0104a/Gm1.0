/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package proyecto_gm.Categoria;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Toolkit;
import java.io.IOException;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import proyecto_gm.Exportar;
import proyecto_gm.Facultades.DatosFacultades;


public class frmCategoria extends javax.swing.JInternalFrame {

    Exportar obj;
    boolean esNuevo = false;
    public frmCategoria() {
        initComponents();
        JTableHeader header = tblCategoria.getTableHeader();
        header.setDefaultRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table,
                    Object value,
                    boolean isSelected,
                    boolean hasFocus,
                    int row,
                    int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setHorizontalAlignment(JLabel.CENTER);
                setBackground(Color.DARK_GRAY);
                setForeground(Color.WHITE);
                setFont(getFont().deriveFont(Font.BOLD, 13));
                return this;
            }
        });
        DefaultTableModel modelo = (DefaultTableModel) tblCategoria.getModel();
        
        
        DatosCategoria.HabilitarCat(escritorio, false);
        DatosCategoria.MostrarCat(modelo);
        
        tblCategoria.setCellSelectionEnabled(false);
        tblCategoria.setRowSelectionAllowed(true);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        escritorio = new javax.swing.JPanel();
        btnAgregar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        txtDescripcion = new javax.swing.JTextField();
        btnExportar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        txtCodigo = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCategoria = new javax.swing.JTable();
        btnDeshacer = new javax.swing.JButton();

        setClosable(true);
        setIconifiable(true);
        setTitle("CATEGORIA");
        setToolTipText("");

        escritorio.setBackground(new java.awt.Color(255, 248, 239));

        btnAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/agregar.png"))); // NOI18N
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });

        btnEditar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/editar.png"))); // NOI18N
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/eliminar.png"))); // NOI18N
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/guardar.png"))); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        jLabel2.setText("Descripcion:");

        txtDescripcion.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtDescripcionKeyTyped(evt);
            }
        });

        btnExportar.setText("Exportar");
        btnExportar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExportarActionPerformed(evt);
            }
        });

        jLabel1.setText("Id:");

        txtCodigo.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCodigoKeyTyped(evt);
            }
        });

        tblCategoria.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "DESCRIPCIÓN"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblCategoria);

        btnDeshacer.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/regresar.png"))); // NOI18N
        btnDeshacer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeshacerActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout escritorioLayout = new javax.swing.GroupLayout(escritorio);
        escritorio.setLayout(escritorioLayout);
        escritorioLayout.setHorizontalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnAgregar)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(btnEditar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnEliminar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGuardar)
                        .addGap(18, 18, 18)
                        .addComponent(btnDeshacer))
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(txtCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(27, 27, 27)
                        .addComponent(jLabel2)
                        .addGap(29, 29, 29)
                        .addComponent(txtDescripcion, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
                .addComponent(btnExportar))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, escritorioLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 544, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(23, 23, 23))
        );
        escritorioLayout.setVerticalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(btnAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnEditar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnEliminar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnGuardar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(btnDeshacer, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(txtDescripcion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnExportar))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 331, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(16, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(escritorio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        DatosCategoria.HabilitarCat(escritorio, true);
        String codigo = DatosCategoria.GenerarCodigoCat();

        if (codigo != null) {
            txtCodigo.setText(codigo);
            txtCodigo.setEnabled(false);
        } else {
            JOptionPane.showMessageDialog(null, "Error al generar el código.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        txtDescripcion.requestFocus();
        esNuevo = true;
        tblCategoria.setRowSelectionAllowed(false);
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        JTextField[] cod = new JTextField[2];
        cod[0] = txtCodigo;
        cod[1] = txtDescripcion;
        DatosCategoria.EditarCat(escritorio, tblCategoria, cod);
        esNuevo = false;
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        DatosCategoria.EliminarCat(tblCategoria);
        DatosCategoria.HabilitarCat(escritorio, false);
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        Categoria cat = new Categoria();
        String idTexto = txtCodigo.getText().replaceAll("[^0-9]", "");
        try {
            cat.setIdCat(Integer.parseInt(idTexto));
        } catch (NumberFormatException e) {
            cat.setIdCat(0);
        }

        cat.setDescripcionCat(txtDescripcion.getText());
        if (esNuevo) {
            if (txtCodigo.getText().isEmpty() || txtDescripcion.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Completar bien los campos");
                return;
            } else if (!txtCodigo.getText().matches("^[A-Z]{3}[0-9]{4}$")) {
                JOptionPane.showMessageDialog(null, "El formato del Id es incorrecto.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                txtCodigo.requestFocus();
            } else {
                if (DatosCategoria.InsertarCat(cat, tblCategoria)) {
                    JOptionPane.showMessageDialog(null, "Datos guardados correctamente");
                    DatosCategoria.LimpiarCat(escritorio);
                    DatosCategoria.HabilitarCat(escritorio, false);
                    tblCategoria.clearSelection();
                    tblCategoria.setRowSelectionAllowed(true);
                } else {
                    JOptionPane.showMessageDialog(null, "Error al guardar los datos", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        } else {
            if (txtCodigo.getText().isEmpty() || txtDescripcion.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Completar bien los campos");
                return;
            } else {
                cat.setCodigoCat(txtCodigo.getText());
                DatosCategoria.ActualizarCat(cat, tblCategoria);
                JOptionPane.showMessageDialog(null, "Datos actualizados correctamente");
                DatosCategoria.LimpiarCat(escritorio);
                DatosCategoria.HabilitarCat(escritorio, false);
                tblCategoria.clearSelection();
                tblCategoria.setRowSelectionAllowed(true);
            }
        }    
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void txtCodigoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCodigoKeyTyped
        // TODO add your handling code here:
        if (txtCodigo.getText().length() >= 4) {
            evt.consume();
            Toolkit.getDefaultToolkit().beep();
        }
    }//GEN-LAST:event_txtCodigoKeyTyped

    private void btnExportarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExportarActionPerformed
        // TODO add your handling code here:
        try{
            obj = new Exportar(); //mandamos a llamar a la clase
            obj.exportarExcel(tblCategoria); //llamamos el metodo desde la clase DatosEmpleados
        } catch (IOException ex){

        }
    }//GEN-LAST:event_btnExportarActionPerformed

    private void btnDeshacerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeshacerActionPerformed
        DatosCategoria.LimpiarCat(rootPane);
        DatosCategoria.HabilitarCat(escritorio, false);
        tblCategoria.clearSelection();
        // Habilitamos la seleccion de filas de la tabla
        tblCategoria.setRowSelectionAllowed(true);
    }//GEN-LAST:event_btnDeshacerActionPerformed

    private void txtDescripcionKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtDescripcionKeyTyped
        // TODO add your handling code here:
        if (txtDescripcion.getText().length() >= 100) {
            evt.consume();
            Toolkit.getDefaultToolkit().beep();
        }
    }//GEN-LAST:event_txtDescripcionKeyTyped


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnDeshacer;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnExportar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JPanel escritorio;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblCategoria;
    private javax.swing.JTextField txtCodigo;
    private javax.swing.JTextField txtDescripcion;
    // End of variables declaration//GEN-END:variables
}
