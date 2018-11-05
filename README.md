# Cannibals and Missionaries Algorithm implemented in three Languages: R [RStudio], Python and Java!
### This brute-force Algorithm includes its Analysis.

El algoritmo original consiste en una barca que debe cruzar un río. Dicha barca puede abarcar como máximo 1 o 2 personas. Sin embargo, la gracia está en que en las orillas o extremos de los ríos nunca puede haber más caníbales que misioneros o éstos se los comerán.

Dándole una pequeña vuelta de hoja y en honor a la asignatura *Fundamentos de los Sistemas Operativos* y su concurrencia, se ha optado por realizar el problema de una manera distinta:

Consiste en realizar viajes con una barca **siempre llena** para llevar a los caníbales y a los misioneros de un extremo a otro del río. En nuestro problema, la orilla da igual dado a que el problema se origina en la propia barca, dado a que esta **NO PUEDE LLEVAR MÁS CANÍBALES QUE MISIONEROS**.

Así pues, se han de realizar *X viajes* con una barca siempre llena para llevar a *Y misioneros* y *Z caníbales* al otro extremo.

### Pre-Condiciones

    -El número de personas totales debe ser múltiplo de tres y distinto de 0.
    -No puede haber nunca una combinación de dos caníbales y un misionero.
    
### Post-Condiciones

    -El algoritmo debe priorizar, entre todas las combinaciones posibles, que los misioneros sean los primeros en llegar a la otra orilla. (¡Viva la Burguesía!)
    -El algoritmo debe calcular TODAS Y CADA UNA de las condiciones disponibles según el número de Caníbales y Misioneros (de eso trata la estrategia de Fuerza Bruta)
    -El algoritmo debe recoger cuántos caníbales y cuántos misioneros existen a través de los ficheros de entrada 'personasN.txt' común a los tres lenguajes. [Mirar Nota]
    -El algoritmo debe tener un contador que mida el tiempo que tarda en realizar todas las operaciones.
    -El algoritmo debe ser capaz de, después de averigüar todas las combinaciones, imprimir un mensaje de error si la combinación no es válida.
[NOTA]    
- Hay que hablar si el formato de dicho fichero será como el explicado en clase para iterar, es decir:
  - 1 -> 1
  - 2 -> 1
  - 3 -> 2
  - 4 -> 1
  - 5 -> 2
- O si en su defecto, será:
  - (Nº Misioneros) -> 6
  - (Nº Caníbales) -> 9

### Datos Extra
    -El algoritmo debe imprimir por pantalla, después de cada viaje, la combinación que ha usado y el número de caníbales y misioneros restantes por realizar éste. Para dicha representación, se usará la sintaxis de: 
        1 = Misionero
        2 = Caníbal

### Fechas de Entrega
    -El trabajo tiene como fecha de entrega el 16/11, lo que nos da dos clases prácticas de dos horas de PR3. Por ello, se asignan las siguientes fechas (Antes de las fechas el trabajo debería estar hecho):
    -8/11: Algoritmo completamente operativo en Python (Últimos retoques en clase).
    -12/11: Algoritmo completamente operativo en RStudio (O C++ si la cosa se complica) y Java.
    -15/11: Análisis de la estrategia y sus resultados en los tres lenguajes (Últimos retoques en clase).
