/*--------------------------------------------------
 ------------  1ra Area: Codigo de Usuario ---------
 ---------------------------------------------------*/


//------> Paquetes,importaciones
package analizadorJC;
import java_cup.runtime.*;



/*----------------------------------------------------------
  ------------  2da Area: Opciones y Declaraciones ---------
  ----------------------------------------------------------*/
%%
%{
  // ---> Codigo usuario

%}

//-------> Directivas
%public
%class Lexer
%cup
%char
%column
%line
%ignorecase

//------> Expresiones Regulares

llaveA ="{"
llaveC="}"
string = (\")[^\"\n](\")
//numero = [0-9]+(\.[0-9]+)?
numero = [0-9]
igual = "->"
puntocoma = ";"
punto = "."
parentesisA ="("
parentesisC =")"
coma=","
positivo="+"
kleene="*"
concatenacion="."
opcional="?"
disyuncion ="|"
comilla_doble="\\\""              
comilla_simple="\\\'"              
salto="\\n"



//especiales =[\u0021 - \u002f | \u003a - \u0040 | \u007b - \u007d] 

letra_mayuscula =[A-Z]
letra_minuscula =[a-z]
guion= "-"
guion_n= "~"

dos_puntos = ":"
conj= "CONJ"
contario_lineas= (\<)(\!)[^\"]*(\>)(\!) 
comentario =(\/)(\/)[^\n]*\n
identificador = [A-Za-z][A-Za-z0-9]*
//especiales =[\u0021 - \u002f | \u003a - \u0040 | \u007b - \u007d] o ASCII = [!-\/:-@\[-`{-\}]
//especiales=[!-\/:-@\[-`{-\}]
ascii = [!-\/:-@\[-`{-\}]




%%

/*------------------------------------------------
  ------------  3ra Area: Reglas Lexicas ---------
  ------------------------------------------------*/

//{identificador} {System.out.println("Se reconocio token identificador " + " Lexema: " + yytext());} 

{comentario} {System.out.println("Se reconocio token comentario " + " Lexema: " + yytext());}
{string} {System.out.println("Se reconocio token  llave A" + " Lexema: " + yytext()); return new Symbol(sym.STRING, yycolumn, yyline, yytext());}
{llaveA} {System.out.println("Se reconocio token  llave A" + " Lexema: " + yytext()); return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
{llaveC} {System.out.println("Se reconocio token llave C " + " Lexema: " + yytext());return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext()); }
{numero}  {System.out.println("Se reconocio token numero " + " Lexema: " + yytext());return new Symbol(sym.NUMERO, yycolumn, yyline, yytext()); }
{igual} {System.out.println("Se reconocio token igual " + " Lexema: " + yytext());return new Symbol(sym.IGUAL, yycolumn, yyline, yytext()); }
{puntocoma} {System.out.println("Se reconocio token puntoComa " + " Lexema: " + yytext());return new Symbol(sym.PUNTO_COMA, yycolumn, yyline, yytext()); }
{coma} {System.out.println("Se reconocio token Coma " + " Lexema: " + yytext());return new Symbol(sym.COMA, yycolumn, yyline, yytext()); }
{dos_puntos} {System.out.println("Se reconocio token dos puntos " + " Lexema: " + yytext());return new Symbol(sym.DOS_PUNTOS, yycolumn, yyline, yytext()); }

{disyuncion} {System.out.println("Se reconocio token disyuncion " + " Lexema: " + yytext()); return new Symbol(sym.OR, yycolumn, yyline, yytext()); }
{positivo} {System.out.println("Se reconocio token positivo " + " Lexema: " + yytext()); return new Symbol(sym.POSITIVO, yycolumn, yyline, yytext()); }
{concatenacion} {System.out.println("Se reconocio token concatenacion " + " Lexema: " + yytext());return new Symbol(sym.CONCATENACION, yycolumn, yyline, yytext());  }
{kleene} {System.out.println("Se reconocio token kleene " + " Lexema: " + yytext()); return new Symbol(sym.KLEENE, yycolumn, yyline, yytext()); }
{opcional} {System.out.println("Se reconocio token opcional " + " Lexema: " + yytext()); return new Symbol(sym.OPCIONAL, yycolumn, yyline, yytext()); }

{comilla_doble} {System.out.println("Se reconocio token COMILLA doble " + " Lexema: " + yytext());return new Symbol(sym.COMILLA_DOBLE, yycolumn, yyline, yytext());  }
{comilla_simple} {System.out.println("Se reconocio token comilla simple" + " Lexema: " + yytext()); return new Symbol(sym.COMILLA_SIMPLE, yycolumn, yyline, yytext()); }
{salto} {System.out.println("Se reconocio token salto" + " Lexema: " + yytext()); return new Symbol(sym.SALTO, yycolumn, yyline, yytext()); }

{parentesisA} {System.out.println("Se reconocio token parentesis A " + " Lexema: " + yytext()); return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());  }
{parentesisC} {System.out.println("Se reconocio token parentesis C " + " Lexema: " + yytext()); return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext()); }

{guion} {System.out.println("Se reconocio token guion " + " Lexema: " + yytext()); return new Symbol(sym.GUION, yycolumn, yyline, yytext());}
{guion_n} {System.out.println("Se reconocio token guion ñ " + " Lexema: " + yytext());return new Symbol(sym.GUION_N, yycolumn, yyline, yytext());}
//{punto} {System.out.println("Se reconocio token punto  " + " Lexema: " + yytext()); }
{letra_mayuscula} {System.out.println("Se reconocio token letra mayuscula " + " Lexema: " + yytext());return new Symbol(sym.LETRA_MAYUSCULA, yycolumn, yyline, yytext());}
{letra_minuscula} {System.out.println("Se reconocio token letra minuscula " + " Lexema: " + yytext()); return new Symbol(sym.LETRA_MINUSCULA, yycolumn, yyline, yytext());}
{conj} {System.out.println("Se reconocio token conj " + " Lexema: " + yytext());return new Symbol(sym.CONJ, yycolumn, yyline, yytext());}
{identificador} {System.out.println("Se reconocio token identificador " + " Lexema: " + yytext()); return new Symbol(sym.IDENTIFICADOR, yycolumn, yyline, yytext());} 
{ascii} {System.out.println("Se reconocio token  ascii" + " Lexema: " + yytext()); return new Symbol(sym.ASCII, yycolumn, yyline, yytext());}


[\s\t\r\n] {}
//. {System.out.println("Error encontrado: " + yytext()); Proyecto.errores.add(yytext());}
