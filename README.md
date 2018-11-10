# Cannibals and Missionaries Algorithm implemented in three Languages: R [RStudio], Python and Java!
### This brute-force Algorithm includes its Analysis.

### NOTAS CONCRETAS DE LOS TRES LENGUAJES 
    Por si quieren aclarar algo del funcionamiento de alguno)

#### R
    -Se pueden ejecutar Scripts mediante cualquier consola. El problema es que a la hora
    de instalar paquetes puede dar problemas o colgarse R y no volver a funcionar. De momento
    hasta preguntar he dejado ambos Scripts separados (Ambos 100% operativos)
    -La ruta relativa sí que la he podido coger para que no dependa del ordenador en el que
    se está ejecutando.
    -El proyecto además está limpio en ambos Scripts.

#### PYTHON

#### JAVA

### Informe

El informe se encuentra en Google Docs. Ya tienen su invitación para editarlo.

### Historia de Caníbales y Misioneros Original

El algoritmo original consiste en una barca que debe cruzar un río. Dicha barca puede abarcar como máximo 1 o 2 personas. Sin embargo, la gracia está en que en las orillas o extremos de los ríos nunca puede haber más caníbales que misioneros o éstos se los comerán.

### Adaptación para Programación III

Dándole una pequeña vuelta de hoja y en honor a la asignatura *Fundamentos de los Sistemas Operativos* y su concurrencia, se ha optado por realizar el problema de una manera distinta:

Consiste en realizar viajes con una barca **siempre llena** para llevar a los caníbales y a los misioneros de un extremo a otro del río. En nuestro problema, **en ninguna de ambas orillas pueden haber nunca más caníbales que misioneros** y ademas hay otro problema que se origina en la propia barca, dado a que esta **NO PUEDE LLEVAR MÁS CANÍBALES QUE MISIONEROS**.

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

### Fechas de Entrega
    -El trabajo tiene como fecha de entrega el 16/11, lo que nos da dos clases prácticas 
    de dos horas de PR3. Por ello, se asignan las siguientes fechas (Antes de las fechas el trabajo
    debería estar hecho):
    8/11: Algoritmo completamente operativo en Python (Últimos retoques en clase).
    12/11: Algoritmo completamente operativo en RStudio y Java.
    15/11: Informe completado e intento de Greedy en los tres lenguajes (Últimos retoques en clase).

### Salida [Mirar Código en Python o R]
    -OPCIÓN MONSTRAR TODO(sin nada)
    Primero la OrillaA
    Por cada combinación: la combinación satisfactoria
                          el número de canibales y misioneros en la orillaA
    OrillaB
    -Tiempo total
    -OPCIÓN MONSTAR SOLO TIEMPO(-t)
    -Tiempo total
