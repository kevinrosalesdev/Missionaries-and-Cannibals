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
orillaA = read.table("fichero20_2.txt", skip=archivo, nrow=1)
orillaA = as.numeric(orillaA)
vectorTiempo <- c()
while(orillaA[1] != -1){
  print("==========================================================================")
  orillaB = c()
  print(paste("Caso Número: ", archivo+1))
  archivo=archivo+1
  print("==========================================================================")
  if((Numero_Canibales(orillaA) + Numero_Misioneros(orillaA)) %% 3 != 0){
    print("ERROR: El número de personas no es múltiplo de 3.")
  }else if(Numero_Canibales(orillaA) > Numero_Misioneros(orillaA)){
    print("ERROR: Hay más caníbales que misioneros.")
  }else{
    flag = 1;
    tiempoInicio <- proc.time()
    while (length(orillaA) != 0) {
      iter = icombinations(orillaA,3)
      lista = iter$getnext()
      sizeFlag = length(orillaA);
      while (length(lista) != 0){
        auxA <- orillaA
        auxB <- orillaB
        for(i in 1:length(lista)){
          auxA = auxA[-match(lista[i],auxA)]
          auxB = append(auxB,lista[i])
        }
        if((Numero_Misioneros(lista) > Numero_Canibales(lista) || Numero_Misioneros(lista) == 0) &&
           Numero_Misioneros(auxA) != 1 && (Numero_Canibales(auxA) <= Numero_Misioneros(auxA) || Numero_Misioneros(auxA) == 0) &&
           Numero_Canibales(auxB) <= Numero_Misioneros(auxB)){
          for (j in 1:length(lista)){
            orillaA = orillaA[-match(lista[j],orillaA)]
            orillaB = append(orillaB,lista[j])
          }
          iter = icombinations(orillaA,3)
          lista = iter$getnext
          break
        }
        lista = iter$getnext()
      }
      if(length(orillaA) == sizeFlag){
        print("############################################################################")
        print("Combinación Imposible de Resolver")
        print("############################################################################")
        flag = 0
        break
      }
    }
    if (flag == 1){
      tiempo = proc.time() - tiempoInicio
      print("Medida de tiempos: ")
      print(tiempo)
      print("El resultado final de la Orilla A es:")
      print(orillaA)
      print("El resultado final de la Orilla B es:")
      print(orillaB)
      vectorTiempo = append(vectorTiempo, as.vector(tiempo[1]))
    }
  }
  orillaA = read.table("fichero20_2.txt", skip=archivo, nrow=1)
  orillaA = as.numeric(orillaA)
}
i = 0
tiempoFinal = 0
for (i in 1:length(vectorTiempo)){
  tiempoFinal = tiempoFinal + vectorTiempo[i]
}
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print(paste("Suma del Tiempo Total del Algoritmo con las Combinaciones entrantes: ", tiempoFinal))
print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("############################################################################")
print("FINAL DE LOS TESTS")
print("############################################################################")
