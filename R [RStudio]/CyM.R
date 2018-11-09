#install.packages("arrangements")
library("arrangements")

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
orillaA <- c(2,2,2,2,1,1,1,1,1,2,2,2,2,1,1,1,1,1,2,2,2,2,1,1,1,1,1,2,2,2,2,1,1,1,1,1)
orillaB <- c()
tiempoInicio <- proc.time()
print("############################################################################")
while (length(orillaA) != 0) {
  print("Numero de Misioneros:")
  print(Numero_Misioneros(orillaA))
  print("Numero de Caníbales:")
  print(Numero_Canibales(orillaA))
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

