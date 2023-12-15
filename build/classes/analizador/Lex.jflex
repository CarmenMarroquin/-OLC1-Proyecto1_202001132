/*--------------------------------------------------
 ------------  1ra Area: Codigo de Usuario ---------
 ---------------------------------------------------*/


//------> Paquetes,importaciones
package analizador_json;
import java_cup.runtime.*;
import proyecto1.Proyecto1;

/*----------------------------------------------------------
  ------------  2da Area: Opciones y Declaraciones ---------
  ----------------------------------------------------------*/
%%
%{
  // ---> Codigo usuario
%}

//-------> Directivas
%public
%class Lexico
%cupsym Tokens
%cup
%char
%column
%full
%line
%ignorecase

//------> Expresiones Regulares
//identificador = [A-Za-z]+[A-Za-z0-9]*
strings = (\")[^\"\n]+(\")
numero = [0-9]+(\.[0-9]+)?
//igual = "="
puntocoma = ";"
dospuntos =":"
llaveapertura ="{"
llavecierradura = "}"
coma = ","

%%

/*------------------------------------------------
  ------------  3ra Area: Reglas Lexicas ---------
  ------------------------------------------------*/

{numero}  {System.out.println("Se reconocio token numero " + " Lexema: " + yytext()); return new Symbol(Tokens.NUMERO, yycolumn, yyline, yytext());}
{strings} {System.out.println("Se reconocio token string " + " Lexema: " + yytext()); return new Symbol(Tokens.STRING, yycolumn, yyline, yytext());}
//{identificador} {System.out.println("Se reconocio token identificador " + " Lexema: " + yytext()); return new Symbol(Tokens.IDENTIFICADOR, yycolumn, yyline, yytext());}
//{igual} {System.out.println("Se reconocio token igual " + " Lexema: " + yytext()); return new Symbol(Tokens.IGUAL, yycolumn, yyline, yytext());}
{puntocoma} {System.out.println("Se reconocio token puntoComa " + " Lexema: " + yytext()); return new Symbol(Tokens.PUNTOCOMA, yycolumn, yyline, yytext());}
{dospuntos} {System.out.println("Se reconocio token dosPuntos " + " Lexema: " + yytext());return new Symbol(Tokens.DOSPUNTOS, yycolumn, yyline, yytext());}
{llaveapertura} {System.out.println("Se reconocio token llave apertura " + " Lexema: " + yytext()); return new Symbol(Tokens.LLAVEA, yycolumn, yyline, yytext());}
{llavecierradura} {System.out.println("Se reconocio token llave cierra " + " Lexema: " + yytext()); return new Symbol(Tokens.LLAVEC, yycolumn, yyline, yytext());}
{coma} {System.out.println("Se reconocio token coma " + " Lexema: " + yytext());return new Symbol(Tokens.COMA, yycolumn, yyline, yytext());}
[\s\t\r\n] {}
. {System.out.println("Error encontrado: " + yytext()); Proyecto1.errores.add(yytext());}


