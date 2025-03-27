/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package proyecto_gm.Asistencias;

import java.awt.Color;
import java.awt.Component;
import java.util.Arrays;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class RowsRenderer extends DefaultTableCellRenderer {

    private int columna;

    public RowsRenderer(int Colpatron) {
        this.columna = Colpatron;
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean selected, boolean focused, int row, int column) {
        setBackground(Color.white);
        table.setForeground(Color.black);
        super.getTableCellRendererComponent(table, value, selected, focused, row, column);
        String cellValue = table.getValueAt(row, columna).toString();
        Object valorEntrada = table.getValueAt(row, 2);
        Object valorSalida = table.getValueAt(row, 3);
        String entrada = (valorEntrada == null) ? "" : valorEntrada.toString();
        String salida = (valorSalida == null) ? "" : valorSalida.toString();

        String[] finde = {"Sábado", "Domingo"};

        if (entrada.isEmpty() && salida.isEmpty()) {
            this.setBackground(Color.decode("#FCE4D6"));
        }

        if (Arrays.asList(finde).contains(cellValue) && entrada.isEmpty() && salida.isEmpty()) {
            this.setForeground(Color.RED);
            this.setBackground(Color.WHITE);
        } else {
            this.setForeground(Color.BLACK);
        }

        if (!entrada.isEmpty() && salida.equals("00:00:00")) {
            this.setForeground(Color.BLACK);
            this.setBackground(Color.decode("#FFE699"));
        }

        return this;
    }
}
