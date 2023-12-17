/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package errores;

/**
 *
 * @author carme
 */

public class Error_ {
    
    String lexema;
    String tipo;
    String linea;
    String columna;

    
    
    public Error_(String lexema,String tipo,String linea, String columna){
    
         this. lexema = lexema;
         this.tipo = tipo;
         this.linea = linea;
          this.columna = columna;
    
    }
    
     public String getTipo() {
        return tipo;
    }

    public String getLexema() {
        return lexema;
    }

    public String getLinea() {
        return linea;
    }

    public String getColumna() {
        return columna;
    }
}