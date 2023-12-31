/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package proyecto_1;


import analizadorJC.*;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;






/**
 *
 * @author carme
 */
public class Interfaz extends javax.swing.JFrame {
    
       public static  String ruta = "";
       public static  String nombre_archivo = "";
          public static String dataHTML = "";
    public static String dataCSS = "";
    

    /**
     * Creates new form Interfaz
     */
    public Interfaz() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenu1 = new javax.swing.JMenu();
        jScrollPane1 = new javax.swing.JScrollPane();
        area_texto = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        text_error = new javax.swing.JTextArea();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu2 = new javax.swing.JMenu();
        abrir_archivo = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        ejecucion_analisis = new javax.swing.JMenuItem();
        boton_r = new javax.swing.JMenu();
        botonReportes = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();

        jMenu1.setText("jMenu1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        area_texto.setColumns(20);
        area_texto.setRows(5);
        jScrollPane1.setViewportView(area_texto);

        text_error.setEditable(false);
        text_error.setBackground(new java.awt.Color(102, 102, 102));
        text_error.setColumns(20);
        text_error.setForeground(new java.awt.Color(255, 102, 0));
        text_error.setRows(5);
        jScrollPane2.setViewportView(text_error);

        jMenu2.setText("Archivo");

        abrir_archivo.setText("Abrir archivo");
        abrir_archivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                abrir_archivoActionPerformed(evt);
            }
        });
        jMenu2.add(abrir_archivo);

        jMenuItem2.setText("Guardar");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem2);

        jMenuItem3.setText("Guardar como");
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem3);

        jMenuBar1.add(jMenu2);

        jMenu3.setText("Ejecutar");

        ejecucion_analisis.setText("Ejecuta");
        ejecucion_analisis.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ejecucion_analisisActionPerformed(evt);
            }
        });
        jMenu3.add(ejecucion_analisis);

        jMenuBar1.add(jMenu3);

        boton_r.setText("Reportes");

        botonReportes.setText("Tokens");
        botonReportes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonReportesActionPerformed(evt);
            }
        });
        boton_r.add(botonReportes);

        jMenuItem1.setText("errores");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        boton_r.add(jMenuItem1);

        jMenuBar1.add(boton_r);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jScrollPane2)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 583, Short.MAX_VALUE))
                .addContainerGap(352, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 344, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 130, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(15, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void abrir_archivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_abrir_archivoActionPerformed
        // TODO add your handling code here:
        JFileChooser chooser = new JFileChooser();
        
        int option = chooser.showOpenDialog(null);
        
        if (option == JFileChooser.APPROVE_OPTION){
            
            File archivo = chooser.getSelectedFile();
            
            this.ruta = archivo.getAbsolutePath();
            this.nombre_archivo = archivo.getName();
            
            try {
                BufferedReader lector = new BufferedReader(new FileReader(archivo));
                
                  String contenido = "";
                
                 String line;

                // Leer el contenido del archivo línea por línea
                while ((line = lector.readLine()) != null) {
                    contenido+= line+"\n";
                }
                
                // Cerrar el lector
                lector.close();

                // Imprimir el contenido del archivo
                System.out.println("Contenido del archivo:\n" + contenido);
                
                area_texto.setText(contenido);

                
                
                
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        
        } else {
            System.out.println("Ningún archivo seleccionado");
        }
        
        
    }//GEN-LAST:event_abrir_archivoActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
           System.out.println(this.ruta);
        
          try {
            // Crear un FileWriter en modo de adición (true)
            FileWriter fileWriter = new FileWriter(this.ruta, true);

            // Crear un BufferedWriter para mejorar el rendimiento de escritura
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

            // Contenido a agregar al archivo
            String contenido = area_texto.getText();
            

            // Escribir el contenido en el archivo
            bufferedWriter.write(contenido);
            bufferedWriter.newLine();  // Agregar una nueva línea

            // Cerrar el BufferedWriter
            bufferedWriter.close();

            System.out.println("Contenido agregado al archivo exitosamente.");
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo: " + e.getMessage());
        }

        
        
        
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        // TODO add your handling code here:
        
         String texto = this.area_texto.getText();
        JFileChooser guardarComo = new JFileChooser();
        int opcion = guardarComo.showSaveDialog(this);
        try {
            if (opcion != JFileChooser.CANCEL_OPTION) {
                File archivoNuevo = guardarComo.getSelectedFile();

                BufferedWriter bw = new BufferedWriter(new FileWriter(archivoNuevo));
                bw.write(texto);
                bw.close();
                
                if (this.ruta.equals("")) {
                    this.ruta = archivoNuevo.getAbsolutePath();
                    if (archivoNuevo.getName().endsWith("json")) {
                        this.nombre_archivo = archivoNuevo.getName();
                    }
                }
                
                if (archivoNuevo.getName().endsWith("json") && this.nombre_archivo.equals("")){
                   this. nombre_archivo = archivoNuevo.getName();
                }
            }
        } catch (IOException ex) {
            JOptionPane.showMessageDialog(this, "No se pudo guardar el archivo", "Error al guardar", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void ejecucion_analisisActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ejecucion_analisisActionPerformed
        // TODO add your handling code here:
        
      //  StringReader reader = new StringReader(area_texto.getText());
              //  BufferedReader text = new BufferedReader(reader);
               // analizadorJC = new Lexer (text);
               String texto = this.area_texto.getText();
            Lexer analizadorLexico = new Lexer(new BufferedReader(new StringReader(texto)));
            
            Parser analizador_sintac = new Parser(analizadorLexico);
           try {
               analizador_sintac.parse();
           } catch (Exception ex) {
               System.out.println("Error al compilar");
               System.out.println(ex);
           }
            
            System.out.println("se hizo clic en ejecutar"+texto);
            
              if (Lexer.lista_errores.isEmpty()) {
                    System.out.println("No se encontraron errores lexicos");
                } else {
              
              Lexer.lista_errores.forEach((error_t) -> {
             System.out.println(error_t.getTipo()+ "| " + error_t.getLinea() + "| " + error_t.getColumna());
             text_error.append(error_t.getLexema() + "| " +error_t.getTipo()+ "| " + error_t.getLinea() + "| " + error_t.getColumna()+"\n");
                });
              
              
              
              
              
              
              
              
              
              }
                 
   
            
     
    }//GEN-LAST:event_ejecucion_analisisActionPerformed

    private void botonReportesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonReportesActionPerformed
           
        
        
        
        // TODO add your handling code here:
         try (FileWriter writer = new FileWriter("tokens.html")) {
            // Escribir el encabezado del HTML
            writer.write("<html><head><title>Tabla de Informaciones</title></head><body>\n");
            // Escribir la etiqueta de apertura de la tabla
            writer.write("<table border=\"1\">\n");
            // Escribir el encabezado de la tabla
            writer.write("<tr><th>Lexema</th><th>Nombre</th><th>Línea</th><th>Columna</th></tr>\n");

            // Iterar sobre las informaciones y escribir las filas de la tabla
 

              Lexer.listaTokens.forEach((token_t) -> {
             
                try {
                    writer.write("<tr><td>" + token_t.getLexema() + "</td><td>" + token_t.getNombre() + "</td><td>"
                            + token_t.getLinea() + "</td><td>" + token_t.getColumna() + "</td></tr>\n");
                } catch (IOException ex) {
                    Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
                }
                });
                

            // Escribir la etiqueta de cierre de la tabla y del HTML
            writer.write("</table></body></html>");
            System.out.println("Archivo HTML generado: " + "tokens.html");
        } catch (IOException e) {
            e.printStackTrace();
        }
    

    
        
        
        
    }//GEN-LAST:event_botonReportesActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        
        try (FileWriter writer = new FileWriter("errosLexicos.html")) {
            // Escribir el encabezado del HTML
            writer.write("<html><head><title>Tabla de Errores</title></head><body>\n");
            // Escribir la etiqueta de apertura de la tabla
            writer.write("<table border=\"1\">\n");
            // Escribir el encabezado de la tabla
            writer.write("<tr><th>Lexema</th><th>Tipo</th><th>Línea</th><th>Columna</th></tr>\n");

            // Iterar sobre los errores y escribir las filas de la tabla
          
              Lexer.lista_errores.forEach((error_t) -> {
             
                try {
                    writer.write("<tr><td>" + error_t.getLexema() + "</td><td>" + error_t.getTipo() + "</td><td>"
                            + error_t.getLinea() + "</td><td>" + error_t.getColumna() + "</td></tr>\n");
                } catch (IOException ex) {
                    Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
                }
                });

            // Escribir la etiqueta de cierre de la tabla y del HTML
            writer.write("</table></body></html>");
            System.out.println("Archivo HTML generado: " +"errosLexicos.html" );
        } catch (IOException e) {
            e.printStackTrace();
        }
    
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Interfaz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Interfaz().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem abrir_archivo;
    private javax.swing.JTextArea area_texto;
    private javax.swing.JMenuItem botonReportes;
    private javax.swing.JMenu boton_r;
    private javax.swing.JMenuItem ejecucion_analisis;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea text_error;
    // End of variables declaration//GEN-END:variables
}
