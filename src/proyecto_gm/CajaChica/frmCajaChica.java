package proyecto_gm.CajaChica;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.sql.SQLException;
import javax.swing.DefaultCellEditor;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;

public class frmCajaChica extends javax.swing.JInternalFrame {

    private boolean primerEvento = false;

    boolean esNuevo = false;
    String periodo;
    
    public frmCajaChica()  {
        initComponents();
        initializeTable();
        //  Crea un objeto ComboBox y asigna el modelo creado en el paso anterior
        DatosCajaChica.CargarCombo(cbotransferencias);
        //  Agrega el objeto ComboBox a la celda correspondiente en cada fila de la tabla tblCajaChica
        TableColumn comboColumn = tblCajaChica.getColumnModel().getColumn(1); // Reemplaza "columna" por el índice de la columna donde deseas agregar el ComboBox
        comboColumn.setCellEditor(new DefaultCellEditor(cbotransferencias));
        DatosCajaChica.Habilitar(escritorio, false);
        calcularSumaTotal();
        // Personalizar header
        JTableHeader header = tblCajaChica.getTableHeader();
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

    }

    private void calcularSumaTotal() {
        // Declarar una variable para almacenar la suma total
        float total = 0.0f;

        // Recorrer todas las filas de la tabla
        for (int row = 0; row < tblCajaChica.getRowCount(); row++) {
            // Obtener el valor de la columna 6 para la fila actual
            Object value = tblCajaChica.getValueAt(row, 6);
            if (value != null) {
                float saldo = Float.parseFloat(value.toString());
                total += saldo;
            }
        }

        // Asignar el total al JTextField "txtTotal"
        txtTotal.setText(String.valueOf(total));
    }

    private void initializeTable() {
        final int entradaColumn = 4; // Número de columna de entrada
        final int salidaColumn = 5; // Número de columna de salida
        final int saldoColumn = 6; // Número de columna de saldo

        // Establecer el CellEditor personalizado solo en la columna de salida
        tblCajaChica.getColumnModel().getColumn(salidaColumn).setCellEditor(new DefaultCellEditor(new JTextField()) {
            @Override
            public boolean stopCellEditing() {
                boolean result = super.stopCellEditing();
                if (result) {
                    // Obtener el valor de la celda editada en la columna de salida
                    String salida = tblCajaChica.getModel().getValueAt(tblCajaChica.getSelectedRow(), salidaColumn).toString();

                    // Obtener el valor de la celda de entrada en la misma fila
                    String entrada = tblCajaChica.getModel().getValueAt(tblCajaChica.getSelectedRow(), entradaColumn).toString();

                    try {
                        // Convertir los valores de String a float
                        float entradaValue = Float.parseFloat(entrada) * 100.0f / 100.0f;
                        float salidaValue = Float.parseFloat(salida) * 100.0f / 100.0f;

                        // Calcular el saldo
                        float saldo = Math.round((entradaValue - salidaValue) * 100.0f) / 100.0f;

                        // Mostrar el saldo en la celda de saldo correspondiente
                        String saldoString = String.format("%.2f", saldo);
                        tblCajaChica.setValueAt(saldoString, tblCajaChica.getSelectedRow(), saldoColumn);
                    } catch (NumberFormatException ex) {
                        System.out.println("Error al convertir valores a float: " + ex.getMessage());
                        // Manejar la excepción si los valores no se pueden convertir a float
                    }
                }
                return result;
            }
        });
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        escritorio = new javax.swing.JPanel();
        btnAgregar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        btnDeshacer = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCajaChica = new javax.swing.JTable();
        cbotransferencias = new javax.swing.JComboBox<>();
        txtTotal = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        cboPeriodo = new javax.swing.JComboBox<>();

        setClosable(true);
        setIconifiable(true);
        setTitle("CAJA CHICA");

        escritorio.setBackground(new java.awt.Color(255, 248, 239));

        btnAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconos/agregar.png"))); // NOI18N
        btnAgregar.setName("agregar"); // NOI18N
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
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

        tblCajaChica.setBackground(new java.awt.Color(255, 255, 255));
        tblCajaChica.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Id", "NroOperacion", "Fecha", "Descripcion", "Entrada", "Salida", "Saldo"
            }
        ));
        cbotransferencias.addItemListener(new java.awt.event.ItemListener() {
        public void itemStateChanged(java.awt.event.ItemEvent evt) {
            if (!primerEvento) {
                primerEvento = true;
                return; // Ignorar el primer evento
            }
            if (evt.getStateChange() == java.awt.event.ItemEvent.SELECTED) {
                System.out.println("Click");
                DatosCajaChica.Fecha(tblCajaChica, cbotransferencias);
            }
        }
    });
        tblCajaChica.setFocusable(false);
        tblCajaChica.setRowHeight(25);
        tblCajaChica.setSelectionBackground(new java.awt.Color(153, 153, 153));
        tblCajaChica.setSelectionForeground(new java.awt.Color(0, 0, 0));
        tblCajaChica.setShowGrid(true);
        jScrollPane1.setViewportView(tblCajaChica);
        if (tblCajaChica.getColumnModel().getColumnCount() > 0) {
            tblCajaChica.getColumnModel().getColumn(0).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(1).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(2).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(3).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(4).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(5).setResizable(false);
            tblCajaChica.getColumnModel().getColumn(6).setResizable(false);
        }

        txtTotal.setEnabled(false);

        jLabel1.setText("Saldo Actual:");

        jLabel2.setText("Periodo:");

        cboPeriodo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "012023", "022023", "032023", "042023", "052023" }));
        cboPeriodo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboPeriodoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout escritorioLayout = new javax.swing.GroupLayout(escritorio);
        escritorio.setLayout(escritorioLayout);
        escritorioLayout.setHorizontalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(escritorioLayout.createSequentialGroup()
                        .addComponent(btnAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnEliminar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGuardar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnDeshacer)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel2)
                        .addGap(18, 18, 18)
                        .addComponent(cboPeriodo, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(128, 128, 128)
                        .addComponent(jLabel1)
                        .addGap(18, 18, 18)
                        .addComponent(txtTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 746, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(20, Short.MAX_VALUE))
            .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(escritorioLayout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(cbotransferencias, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        escritorioLayout.setVerticalGroup(
            escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(escritorioLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(btnDeshacer)
                    .addComponent(btnAgregar)
                    .addComponent(btnEliminar)
                    .addComponent(btnGuardar)
                    .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtTotal, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel1)
                        .addComponent(jLabel2)
                        .addComponent(cboPeriodo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 244, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(23, Short.MAX_VALUE))
            .addGroup(escritorioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(escritorioLayout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(cbotransferencias, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    
    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed

        CajaChica caj = new CajaChica();

        // Dentro del método donde capturas los datos de la nueva fila
        int newRow = tblCajaChica.getSelectedRow(); // Última fila ingresada
        String transferencia = DatosCajaChica.CapturarID(tblCajaChica.getValueAt(newRow, 1).toString());

        caj.setId((String) tblCajaChica.getValueAt(newRow, 0)); // Asigna el valor de la primera columna a campo1

        caj.setIdTransferenciasBancarias(transferencia);
        caj.setFecha((String) tblCajaChica.getValueAt(newRow, 2));
        caj.setDescripcion((String) tblCajaChica.getValueAt(newRow, 3));
        // Validar y convertir el valor de entrada
        Object entradaValue = tblCajaChica.getValueAt(newRow, 4);
        if (entradaValue instanceof String) {
            try {
                caj.setEntrada(Float.parseFloat((String) entradaValue));
            } catch (NumberFormatException ex) {
                // Manejar la excepción si el valor no es un número válido
                System.out.println("Error al convertir entrada a float: " + ex.getMessage());
            }
        }

        // Validar y convertir el valor de salida
        Object salidaValue = tblCajaChica.getValueAt(newRow, 5);
        if (salidaValue instanceof String) {
            try {
                caj.setSalida(Float.parseFloat((String) salidaValue));
            } catch (NumberFormatException ex) {
                // Manejar la excepción si el valor no es un número válido
                System.out.println("Error al convertir salida a float: " + ex.getMessage());
            }
        }

        // Validar y convertir el valor de saldo
        Object saldoValue = tblCajaChica.getValueAt(newRow, 6);
        if (saldoValue instanceof String) {
            try {
                caj.setSaldo(Float.parseFloat((String) saldoValue));
            } catch (NumberFormatException ex) {
                // Manejar la excepción si el valor no es un número válido
                System.out.println("Error al convertir saldo a float: " + ex.getMessage());
            }
        }

        System.out.println(caj.getSaldo());

        // Preguntamos si haremos un INSERT o un UPDATE
        if (esNuevo) {
            // Insertar nuevo registro
            if (DatosCajaChica.validarCamposCompletados(tblCajaChica)) {
                DatosCajaChica.Insertar(caj, tblCajaChica, periodo);
                JOptionPane.showMessageDialog(null, "Datos guardados correctamente");
                DatosCajaChica.Habilitar(escritorio, false);

                tblCajaChica.clearSelection();
                // Habilitamos la seleccion de filas de la tabla
                tblCajaChica.setRowSelectionAllowed(true);
            }
        } else {
            if (DatosCajaChica.validarCamposCompletados(tblCajaChica)) {
                DatosCajaChica.Actualizar(caj, tblCajaChica, periodo);
                JOptionPane.showMessageDialog(null, "Datos actualizados correctamente");
                DatosCajaChica.Habilitar(escritorio, false);

                tblCajaChica.clearSelection();
                // Habilitamos la seleccion de filas de la tabla
                tblCajaChica.setRowSelectionAllowed(true);
            }
        }
        calcularSumaTotal();

    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        // TODO add your handling code
        DatosCajaChica.Habilitar(escritorio, true);
        DatosCajaChica.NuevaFila(tblCajaChica);
        esNuevo = true;
        calcularSumaTotal();
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnDeshacerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeshacerActionPerformed
        // TODO add your handling code here:
        DatosCajaChica.Limpiar(tblCajaChica);
        DatosCajaChica.Habilitar(escritorio, false);
    }//GEN-LAST:event_btnDeshacerActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        // TODO add your handling code here:
        DatosCajaChica.Eliminar(tblCajaChica);
        DatosCajaChica.Habilitar(escritorio, false);
        calcularSumaTotal();
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void cboPeriodoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboPeriodoActionPerformed
        // TODO add your handling code here:}
        DefaultTableModel modelo = (DefaultTableModel) tblCajaChica.getModel();
        modelo.setRowCount(0);
        String periodo = cboPeriodo.getSelectedItem().toString();
        DatosCajaChica.Mostrar(modelo, periodo);

        calcularSumaTotal();

    }//GEN-LAST:event_cboPeriodoActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnDeshacer;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JComboBox<String> cboPeriodo;
    private javax.swing.JComboBox<String> cbotransferencias;
    private javax.swing.JPanel escritorio;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblCajaChica;
    private javax.swing.JTextField txtTotal;
    // End of variables declaration//GEN-END:variables
}
