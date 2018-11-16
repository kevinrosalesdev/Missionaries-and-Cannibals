# Cannibals and Missionaries Algorithm implemented in three Languages: R [RStudio], Python and Java!
### This brute-force Algorithm can show its time too!

### Historia de Caníbales y Misioneros Original

El algoritmo original consiste en una barca que debe cruzar un río. Dicha barca puede abarcar como máximo 1 o 2 personas. Sin embargo, la gracia está en que en las orillas o extremos de los ríos nunca puede haber más caníbales que misioneros o éstos se los comerán.

### Adaptación para Programación III

Dándole una pequeña vuelta de hoja y en honor a la asignatura *Fundamentos de los Sistemas Operativos* y su concurrencia, se ha optado por realizar el problema de una manera distinta:

Consiste en realizar viajes con una barca **siempre llena** para llevar a los caníbales y a los misioneros de un extremo a otro del río. En nuestro problema, **en ninguna de ambas orillas pueden haber nunca más caníbales que misioneros** y ademas hay otro problema que se origina en la propia barca, dado a que esta **no puede llevar más caníbales que misioneros**.

Así pues, se han de realizar *X viajes* con una barca siempre llena para llevar a *Y misioneros* y *Z caníbales* al otro extremo.

### Pre-Condiciones

    -El número de personas totales debe ser múltiplo de tres y distinto de 0.
    -No puede haber nunca una combinación de dos caníbales y un misionero.
    -El algoritmo debe recoger cuántos caníbales y cuántos misioneros existen a través 
    de los ficheros de entrada 'fichero_básico.txt' muy parecido en los tres lenguajes. 
    Dicho fichero tendrá el formato (Por ejemplo):
    1 2 1 1 1 2 [vec1]
    2 1 1 1 1 2 2 2 [vec2]
    1 2 1 2 1 1 2 2 1 [vec3]
    1 1 1 1 1 2 2 1 2 1 [vec4]
    2 2 1 1 2 1 2 1 1 1 1 1 [vec5]
    etc.
    
### Post-Condiciones

    -El algoritmo debe respetar que en ambas orillas nunca hayan más caníbales que misioneros.
    -El algoritmo debe calcular cada combinación hasta que una sea válida [Estrategia de Fuerza Bruta]
    -El algoritmo debe tener un contador que mida el tiempo que tarda en realizar todas las operaciones.
    -El algoritmo debe ser capaz de imprimir un mensaje de error si la combinación de entrada no es válida.
    
### Datos Extra
    -El algoritmo debe imprimir por pantalla, después de cada viaje, 
    la combinación que ha usado y el número de caníbales y misioneros restantes por realizar éste. 
    Para dicha representación, se usará la sintaxis de: 
        1 = Misionero
        2 = Caníbal

### Salida [Mirar Código en Python o R]
    -OPCIÓN MONSTRAR TODO(sin nada)
    Primero la OrillaA
    Por cada combinación: la combinación satisfactoria
                          el número de canibales y misioneros en la orillaA
    OrillaB
    -OPCIÓN MONSTAR SOLO TIEMPO(-t)
    Tiempo total
