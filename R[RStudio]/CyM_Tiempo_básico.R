#Si no se tiene instalado el paquete que genera las iteraciones de combinaciones, se instala
if(! is.element("arrangements", installed.packages()[,1])){
  install.packages("arrangements")
}
library("arrangements")

#Librería que se iba a utilizar para coger ruta relativa a través de CMD. 
#(No funciona si se ejecuta fuera de éste)

#if(! is.element("rstudioapi", installed.packages()[,1])){
#  install.packages("rstudioapi")
#}
#library("rstudioapi")
#setwd(dirname(getActiveDocumentContext()$path))


#NºCanibales
Numero_Canibales <- function(x){
  if (length(x) == 0){
    return (0);
  }
  res <- 0
  for (i in 1:length(x)){
    if (x[i] == 2){
      res = res + 1
    }
  }
  return (res)
}

#NºMisioneros
Numero_Misioneros <- function(x){
  if (length(x) == 0){
    return (0);
  }
  res <- 0
  for (i in 1:length(x)){
    if (x[i] == 1){  
      res = res + 1
    }
  }
  return (res)
}

#Caníbales = 2
#Misioneros = 1
print("############################################################################")
print("INICIO DE LOS TESTS")
print("############################################################################")
archivo=0
#Se lee el una línea del fichero y se trata como un vector
orillaA = read.table("fichero_básico.txt", skip=archivo, nrow=1)
orillaA = as.numeric(orillaA)
#Se crea el vector tiempo que almacenará los tiempos del algoritmo con todos los vectores del fichero.
vectorTiempo <- c()
#Mientras que lo que haya leído no sea un "-1"...
while(orillaA[1] != -1){
  print("==========================================================================")
  orillaB = c()
  print(paste("Caso Número: ", archivo+1))
  archivo=archivo+1
  print("==========================================================================")
  #Comprobación de parámetros que impedirían el éxito del algoritmo.
  if((Numero_Canibales(orillaA) + Numero_Misioneros(orillaA)) %% 3 != 0){
    print("ERROR: El número de personas no es múltiplo de 3.")
  }else if(Numero_Canibales(orillaA) > Numero_Misioneros(orillaA)){
    print("ERROR: Hay más caníbales que misioneros.")
  }else{
    flag = 1;
    #Mientras siga habiendo personas en la orilla A...
    tiempoInicio <- proc.time()
    while (length(orillaA) != 0) {
      #Se crea el iterador y se coge la primera combinación.
      iter = icombinations(orillaA,3)
      lista = iter$getnext()
      sizeFlag = length(orillaA);
      #Mientras que la combinación escogida no sea nula (Exista alguna combinación aún).
      while (length(lista) != 0){
        auxA <- orillaA
        auxB <- orillaB
        #Se crean dos vectores auxiliares que simulan el crecimiento y decrecimiento de las orillas con esa combinación.
        for(i in 1:length(lista)){
          auxA = auxA[-match(lista[i],auxA)]
          auxB = append(auxB,lista[i])
        }
        #Si una serie de condiciones se cumplen, la combinación es válida.
        if((Numero_Misioneros(lista) > Numero_Canibales(lista) || Numero_Misioneros(lista) == 0) &&
           Numero_Misioneros(auxA) != 1 && (Numero_Canibales(auxA) <= Numero_Misioneros(auxA) || Numero_Misioneros(auxA) == 0) &&
           Numero_Canibales(auxB) <= Numero_Misioneros(auxB)){
          #Se procede a llevarla a cabo en las orillas de verdad.
          for (j in 1:length(lista)){
            orillaA = orillaA[-match(lista[j],orillaA)]
            orillaB = append(orillaB,lista[j])
          }
          #Se recoge la siguiente combinación y se sale del while más interno.
          iter = icombinations(orillaA,3)
          lista = iter$getnext
          break
        }
        #En caso de no tener éxito, simplemente se recoge la siguiente combinación.
        lista = iter$getnext()
      }
      #Si la longitud de la Orilla de A no ha cambiado con ninguna combinación, es que el problema no se puede
      #resolver con la combinación de personas que hay en la Orilla de A.
      if(length(orillaA) == sizeFlag){
        print("############################################################################")
        print("Combinación Imposible de Resolver")
        print("############################################################################")
        flag = 0
        break
      }
    }
    #Si ha habido éxito, se imprimen los resultados y se añade al vector tiempo.
    if (flag == 1){
      tiempo = proc.time() - tiempoInicio
      print("Medida de tiempos en segundos: ")
      print(tiempo)
      vectorTiempo = append(vectorTiempo, as.vector(tiempo[1]))
    }
  }
  #Se recoge el siguiente vector del fichero
  orillaA = read.table("fichero_básico.txt", skip=archivo, nrow=1)
  orillaA = as.numeric(orillaA)
}
#Se calcula el tiempo total
i = 0
tiempoFinal = 0
for (i in 1:length(vectorTiempo)){
  tiempoFinal = tiempoFinal + vectorTiempo[i]
}
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(paste("Suma del Tiempo Total en segundos del Algoritmo con las Combinaciones entrantes: ", tiempoFinal))
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("############################################################################")
print("FINAL DE LOS TESTS")
print("############################################################################")
