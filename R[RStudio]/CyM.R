if(! is.element("arrangements", installed.packages()[,1])){
  install.packages("arrangements")
}
library("arrangements")

if(! is.element("rstudioapi", installed.packages()[,1])){
  install.packages("rstudioapi")
}
library("rstudioapi")
setwd(dirname(getActiveDocumentContext()$path))


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
orillaA = read.table("fichero_básico.txt", skip=archivo, nrow=1)
orillaA = as.numeric(orillaA)
while(orillaA[1] != -1){
  print("==========================================================================")
  orillaB = c()
  print(paste("Caso Número: ", archivo+1))
  print("==========================================================================")
  if((Numero_Canibales(orillaA) + Numero_Misioneros(orillaA)) %% 3 != 0){
    print("ERROR: El número de personas no es múltiplo de 3.")
    quit()
  }
  if(Numero_Canibales(orillaA) > Numero_Misioneros(orillaA)){
    print("ERROR: Hay más caníbales que misioneros.")
    quit()
  }
  if(Numero_Misioneros(orillaA) == 10 && Numero_Canibales(orillaA) == 8){
    print("ERROR: Esa combinación no se puede llevar a cabo.")
    quit()
  }
  archivo=archivo+1
  tiempoInicio <- proc.time()
  while (length(orillaA) != 0) {
    print(paste("Numero de Misioneros: ", Numero_Misioneros(orillaA)))
    print(paste("Numero de Caníbales: ", Numero_Canibales(orillaA)))
    print("ORILLA A -->")
    print(orillaA)
    print("ORILLA B -->")
    print(orillaB)
    iter = icombinations(orillaA,3)
    lista = iter$getnext()
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
          print("La combinación ganadora es: ")
          print(lista)
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
    print("############################################################################")
  }
  print("Medida de tiempos: ")
  print(proc.time() - tiempoInicio)
  print("El resultado final de la Orilla A es:")
  print(orillaA)
  print("El resultado final de la Orilla B es:")
  print(orillaB)
  orillaA = read.table("fichero_básico.txt", skip=archivo, nrow=1)
  orillaA = as.numeric(orillaA)
}
print("############################################################################")
print("FINAL DE LOS TESTS")
print("############################################################################")
