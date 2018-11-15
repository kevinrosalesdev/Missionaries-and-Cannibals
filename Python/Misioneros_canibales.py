#!/usr/bin/env python
import sys
import time
from timeit import default_timer as timer
import itertools

"""
Misioneros 1
Canibales  2
"""
vectortiempo = []


def numero_misioneros(lista):
    aux = 0
    for l in lista:
        if l == 1: aux = aux + 1
    return aux


def numero_canibales(lista):
    aux = 0
    for l in lista:
        if l == 2: aux = aux + 1
    return aux


def Misioneros_Canibales(fichero):
    iteraciones = 0
    for linea in open(fichero, "r"):
        iteraciones = iteraciones + 1
        print("################ " +
              str(iteraciones) +
              " iteracion ##############")
        orillaA = []
        for palabra in linea.split():
            orillaA.append(int(palabra))
        orillaB = []
        if numero_canibales(orillaA) > numero_misioneros(orillaA):
            print("El número de canibales no pude superar al e misioneros")
            continue
        if len(orillaA) % 3 != 0:
            print("NO ES MULTIPLO DE TRES")
            continue
        print("El número de misioneros: " + str(numero_misioneros(orillaA)))
        print("El número de canibales: " + str(numero_canibales(orillaA)))
        while orillaA != []:
            sizeFlag=len(orillaA)
            print("ORILLA_A -->" + str(orillaA))
            print("ORILLA_B -->" + str(orillaB))
            for elemento in itertools.combinations(orillaA, 3):
                # casteo de tupla a lista
                it = list(elemento)
                # copia auxiliar
                aux = orillaA.copy()
                auxB = orillaB.copy()
                # print("Combinaciones posibles:" + str(it))
                # simulación de la siguente lista posible
                for i in it:
                    aux.remove(i)
                    auxB.append(i)
                # condiciones
                if ((numero_misioneros(it) > numero_canibales(it) or numero_misioneros(it) == 0)
                        and numero_misioneros(aux) != 1
                        and (numero_canibales(aux) <= numero_misioneros(aux) or numero_misioneros(aux) == 0)
                        and (numero_canibales(auxB) <= numero_misioneros(auxB))):
                    print("Combinación ganadora:" + str(it))
                    # simulación del bote
                    for i in it:
                        orillaA.remove(i)
                        orillaB.append(i)
                    break
            if len(orillaA) == sizeFlag:
                print("Combinación imposible")
                break
        print("Resultado de la orilla A:" + str(orillaA))
        print("Resultado de la orilla B:" + str(orillaB))


def Misioneros_Canibales_tiempo(fichero):
    iteraciones = 0
    for linea in open(fichero, "r"):
        iteraciones = iteraciones + 1
        print("################ " +
              str(iteraciones) +
              " iteracion ##############")
        orillaA = []
        for palabra in linea.split():
            orillaA.append(int(palabra))
        orillaB = []
        if numero_canibales(orillaA) > numero_misioneros(orillaA):
            print("El número de canibales no pude superar al de misioneros")
            continue
        if len(orillaA) % 3 != 0:
            print("NO ES MUTIPLO DE TRES")
            continue
        flag = True
        start_time = time.perf_counter()
        while orillaA != []:
            sizeFlag=len(orillaA)
            for elemento in itertools.combinations(orillaA, 3):
                # casteo de tupla a lista
                it = list(elemento)
                # copia auxiliar
                aux = orillaA.copy()
                auxB = orillaB.copy()
                # simulación de la siguente lista posible
                for i in it:
                    aux.remove(i)
                    auxB.append(i)
                # condiciones
                if ((numero_misioneros(it) > numero_canibales(it) or numero_misioneros(it) == 0)
                        and numero_misioneros(aux) != 1
                        and (numero_canibales(aux) <= numero_misioneros(aux) or numero_misioneros(aux) == 0)
                        and (numero_canibales(auxB) <= numero_misioneros(auxB))):
                    # simulación del bote
                    for i in it:
                        orillaA.remove(i)
                        orillaB.append(i)
                    break
            if len(orillaA) == sizeFlag:
                print("Combinación imposible")
                flag=False
                break
        if flag:
            elapsed_time = time.perf_counter() - start_time
            print(elapsed_time)
            vectortiempo.append(elapsed_time)
    sum = 0
    for i in vectortiempo:
        sum = sum + i
    print("Suma del tiempo total del algoritmo con las combinaciones entrantes: " + str(sum))
    vectortiempo.clear()


if __name__ == '__main__':
    if len(sys.argv) > 1:
        if sys.argv[1] == "-t":
            for i in range(2, len(sys.argv)):
                print("------------------------------------------------------- "
                      + str(i - 1) +
                      "Fichero -------------------------------------------------------------------------------------------")
                Misioneros_Canibales_tiempo(sys.argv[i])
        else:
            for i in range(1, len(sys.argv)):
                print("------------------------------------------------------- "
                      + str(i) +
                      "Fichero -------------------------------------------------------------------------------------------")
                Misioneros_Canibales(sys.argv[i])
    else:
        print("FALLO EN EL ARGUMENTO")
        exit(1)
