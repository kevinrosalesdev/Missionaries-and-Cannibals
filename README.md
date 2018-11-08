# Cannibals and Missionaries Algorithm implemented in three Languages: R [RStudio], Python and Java!
### This brute-force Algorithm includes its Analysis.

### Historia de Caníbales y Misioneros Original

El algoritmo original consiste en una barca que debe cruzar un río. Dicha barca puede abarcar como máximo 1 o 2 personas. Sin embargo, la gracia está en que en las orillas o extremos de los ríos nunca puede haber más caníbales que misioneros o éstos se los comerán.

### Adaptación para Programación III

Dándole una pequeña vuelta de hoja y en honor a la asignatura *Fundamentos de los Sistemas Operativos* y su concurrencia, se ha optado por realizar el problema de una manera distinta:

Consiste en realizar viajes con una barca **siempre llena** para llevar a los caníbales y a los misioneros de un extremo a otro del río. En nuestro problema, la orilla da igual dado a que el problema se origina en la propia barca, dado a que esta **NO PUEDE LLEVAR MÁS CANÍBALES QUE MISIONEROS**.

Así pues, se han de realizar *X viajes* con una barca siempre llena para llevar a *Y misioneros* y *Z caníbales* al otro extremo.

### Pre-Condiciones

    -El número de personas totales debe ser múltiplo de tres y distinto de 0.
    -No puede haber nunca una combinación de dos caníbales y un misionero.
    -El algoritmo debe recoger cuántos caníbales y cuántos misioneros existen a través 
    de los ficheros de entrada 'personasN.txt' común a los tres lenguajes. Dicho fichero tendrá el formato:
    1
    2
    1
    1
    2
    2
    1
    etc.
    
### Post-Condiciones

    -El algoritmo debe priorizar, entre todas las combinaciones posibles, 
    que los misioneros sean los primeros en llegar a la otra orilla. (¡Viva la Burguesía!)
    -El algoritmo debe calcular TODAS Y CADA UNA de las condiciones disponibles según el 
    número de Caníbales y Misioneros (de eso trata la estrategia de Fuerza Bruta)
    -El algoritmo debe tener un contador que mida el tiempo que tarda en realizar todas las operaciones.
    -El algoritmo debe ser capaz de, después de averigüar todas las combinaciones, 
    imprimir un mensaje de error si la combinación no es válida.

### Sistema de Puntuación

    -Sólo una combinación válida debe ser el resultado. Por este motivo, como se explicó antes,
    aquella combinación que priorice más que más misioneros lleguen al otro extremo antes que los
    caníbales será "la mejor".
    -Para implemenentar esto, cada combinación tendra una variable punt. Dicha variable punt
    se incrementará en (NºMisioneros/NºBarca) cada vez que se itere sobre tres elementos (Se trate la combinación
    de una de las barcas). Gracias a esta división, se incrementará cada vez menos dado a que NºBarca incrementará.
    Por ello, se incrementará más si hay dos misioneros en la primera barca (2/1) que si hay tres en la segunda 
    barca (3/2).
    -Cada vez que se acabe de iterar una combinación válida entera, se comparará con la variable maxPunt. Dicha 
    variable tiene la puntuación más alta hasta ese momento. Si es mayor la de la nueva combinación, se sustituye. 
    Si no, no se hace nada. En caso de ser sustituida la combinación tendrá que ser guardada en un vector bestRes.
    
### Datos Extra
    -El algoritmo debe imprimir por pantalla, después de cada viaje, 
    la combinación que ha usado y el número de caníbales y misioneros restantes por realizar éste. 
    Para dicha representación, se usará la sintaxis de: 
        1 = Misionero
        2 = Caníbal

### Fechas de Entrega
    -El trabajo tiene como fecha de entrega el 16/11, lo que nos da dos clases prácticas 
    de dos horas de PR3. Por ello, se asignan las siguientes fechas (Antes de las fechas el trabajo
    debería estar hecho):
    8/11: Algoritmo completamente operativo en Python (Últimos retoques en clase).
    12/11: Algoritmo completamente operativo en RStudio (O C++ si la cosa se complica) y Java.
    15/11: Análisis de la estrategia y sus resultados en los tres lenguajes (Últimos retoques en clase).

### Salida
  -> OPCIÓN MONSTRAR TODO(sin nada)
    -primero la orrilaA
    -por cada combinación: la combinación satisfactoria
                           el numero de canibales y misioneros en la orillaA
    -orillaB
    -Tiempo total
  -> OPCIÓN MONSTAR SOLO TIEMPO(-t)
    -Tiempo total
