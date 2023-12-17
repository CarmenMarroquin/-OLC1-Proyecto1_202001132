/*--------------------------------------------------
 ------------  1ra Area: Codigo de Usuario ---------
 ---------------------------------------------------*/


//------> Paquetes,importaciones
package analizadorJC;
import java_cup.runtime.*;
import java.util.ArrayList;
import errores.Error_;
import tokens_.Tokens_;




/*----------------------------------------------------------
  ------------  2da Area: Opciones y Declaraciones ---------
  ----------------------------------------------------------*/
%%
%{
  // ---> Codigo usuario
public static ArrayList<Tokens_> listaTokens = new ArrayList<Tokens_> ();
public static ArrayList<Error_> lista_errores = new ArrayList<Error_> ();



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
comentario_lineas= (\<)(\!)[^\"]*(\>)(\!) 
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
{comentario_lineas} {System.out.println("Se reconocio token comentario multiple " + " Lexema: " + yytext());}

{string} {System.out.println("Se reconocio token  llave A" + " Lexema: " + yytext());   listaTokens.add( new Tokens_ ( yytext(),"STRING",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.STRING, yycolumn, yyline, yytext());}
{llaveA} {System.out.println("Se reconocio token  llave A" + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"LLAVE A",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.LLAVEA, yycolumn, yyline, yytext());}
{llaveC} {System.out.println("Se reconocio token llave C " + " Lexema: " + yytext());listaTokens.add( new Tokens_ ( yytext(),"LLAVE C",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.LLAVEC, yycolumn, yyline, yytext()); }
{numero}  {System.out.println("Se reconocio token numero " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"NUMERO",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.NUMERO, yycolumn, yyline, yytext()); }
{igual} {System.out.println("Se reconocio token igual " + " Lexema: " + yytext());listaTokens.add( new Tokens_ ( yytext(),"IGUAL",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.IGUAL, yycolumn, yyline, yytext()); }
{puntocoma} {System.out.println("Se reconocio token puntoComa " + " Lexema: " + yytext());listaTokens.add( new Tokens_ ( yytext(),"PUNTO COMO",Integer.toString(yyline),Integer.toString(yycolumn))) ;  return new Symbol(sym.PUNTO_COMA, yycolumn, yyline, yytext()); }
{coma} {System.out.println("Se reconocio token Coma " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"COMA",Integer.toString(yyline),Integer.toString(yycolumn))) ;  return new Symbol(sym.COMA, yycolumn, yyline, yytext()); }
{dos_puntos} {System.out.println("Se reconocio token dos puntos " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"DOS PUNTOS",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.DOS_PUNTOS, yycolumn, yyline, yytext()); }

{disyuncion} {System.out.println("Se reconocio token disyuncion " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"OR",Integer.toString(yyline),Integer.toString(yycolumn))) ;  return new Symbol(sym.OR, yycolumn, yyline, yytext()); }
{positivo} {System.out.println("Se reconocio token positivo " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"POSITIVO",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.POSITIVO, yycolumn, yyline, yytext()); }
{concatenacion} {System.out.println("Se reconocio token concatenacion " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"CONCATENACION",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.CONCATENACION, yycolumn, yyline, yytext());  }
{kleene} {System.out.println("Se reconocio token kleene " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"KLEENE",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.KLEENE, yycolumn, yyline, yytext()); }
{opcional} {System.out.println("Se reconocio token opcional " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"OPCIONAL",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.OPCIONAL, yycolumn, yyline, yytext()); }

{comilla_doble} {System.out.println("Se reconocio token COMILLA doble " + " Lexema: " + yytext());listaTokens.add( new Tokens_ ( yytext(),"COMILLLA DOBLE",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.COMILLA_DOBLE, yycolumn, yyline, yytext());  }
{comilla_simple} {System.out.println("Se reconocio token comilla simple" + " Lexema: " + yytext());listaTokens.add( new Tokens_ ( yytext(),"COMILLA SIMPLE",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.COMILLA_SIMPLE, yycolumn, yyline, yytext()); }
{salto} {System.out.println("Se reconocio token salto" + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"SALTO",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.SALTO, yycolumn, yyline, yytext()); }

{parentesisA} {System.out.println("Se reconocio token parentesis A " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"PARENTESIS A",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.PARENTESIS_A, yycolumn, yyline, yytext());  }
{parentesisC} {System.out.println("Se reconocio token parentesis C " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"PARENTESIS C",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.PARENTESIS_C, yycolumn, yyline, yytext()); }

{guion} {System.out.println("Se reconocio token guion " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"GUION",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.GUION, yycolumn, yyline, yytext());}
{guion_n} {System.out.println("Se reconocio token guion ñ " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"GUION Ñ",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.GUION_N, yycolumn, yyline, yytext());}
//{punto} {System.out.println("Se reconocio token punto  " + " Lexema: " + yytext()); }
{letra_mayuscula} {System.out.println("Se reconocio token letra mayuscula " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"MAYUSCULAS",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.LETRA_MAYUSCULA, yycolumn, yyline, yytext());}
{letra_minuscula} {System.out.println("Se reconocio token letra minuscula " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"MINUSCULA",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.LETRA_MINUSCULA, yycolumn, yyline, yytext());}
{conj} {System.out.println("Se reconocio token conj " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"CONJ",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.CONJ, yycolumn, yyline, yytext());}
{identificador} {System.out.println("Se reconocio token identificador " + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"ID",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.IDENTIFICADOR, yycolumn, yyline, yytext());} 
{ascii} {System.out.println("Se reconocio token  ascii" + " Lexema: " + yytext()); listaTokens.add( new Tokens_ ( yytext(),"ASCII",Integer.toString(yyline),Integer.toString(yycolumn))) ; return new Symbol(sym.ASCII, yycolumn, yyline, yytext());}


[\s\t\r\n] {}
. {System.out.println("Error encontrado: " + yytext()); Error_ errores_ = new Error_ ( yytext(),"error lexico",Integer.toString(yyline),Integer.toString(yycolumn));  lista_errores.add(errores_) ;}
