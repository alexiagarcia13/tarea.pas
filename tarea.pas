program LeerPalabraLargo;

const
    SEPARADOR = ' ';
    FINALIZADOR = '.';

procedure leerPalabraLargo(var largo: integer; var fin: boolean);
var
    caracter: char;
begin
    largo := 0; // Inicializamos el largo de la palabra
    fin := false; // Inicializamos fin en falso

    repeat
        Read(caracter); // Leemos un carácter
        if (caracter <> SEPARADOR) and (caracter <> FINALIZADOR) then
            largo := largo + 1; // Incrementamos el largo si el caracter no es SEPARADOR ni FINALIZADOR
    until (caracter = SEPARADOR) or (caracter = FINALIZADOR);

    if caracter = FINALIZADOR then
        fin := true; // Si el último carácter leído es FINALIZADOR, actualizamos fin a true
end;

procedure leerOracionDatos(var cantPalabras, masLarga, masCorta: integer);
var
    largo, palabraMasLarga, palabraMasCorta: integer;
    fin: boolean;
begin
    cantPalabras := 0; // Inicializamos la cantidad de palabras
    palabraMasLarga := 0; // Inicializamos la longitud de la palabra más larga
    palabraMasCorta := MaxInt; // Inicializamos la longitud de la palabra más corta como el valor máximo posible

    repeat
        leerPalabraLargo(largo, fin); // Llamamos al procedimiento leerPalabraLargo para leer una palabra y obtener su longitud
        if largo > 0 then // Si la longitud de la palabra es mayor que cero, es una palabra válida
        begin
            cantPalabras := cantPalabras + 1; // Incrementamos la cantidad de palabras
            if largo > palabraMasLarga then
                palabraMasLarga := largo; // Actualizamos la longitud de la palabra más larga si es necesario
            if largo < palabraMasCorta then
                palabraMasCorta := largo; // Actualizamos la longitud de la palabra más corta si es necesario
        end;
    until fin; // Continuamos hasta que leamos el carácter FINALIZADOR

    masLarga := palabraMasLarga; // Asignamos la longitud de la palabra más larga al parámetro de salida masLarga
    masCorta := palabraMasCorta; // Asignamos la longitud de la palabra más corta al parámetro de salida masCorta
end;

var
    cantPalabras, masLarga, masCorta: integer;
begin
    leerOracionDatos(cantPalabras, masLarga, masCorta);
    writeln('Cantidad de palabras:', cantPalabras);
    writeln('Longitud de la palabra mas larga:', masLarga);
    writeln('Longitud de la palabra mas corta:', masCorta);
end.
