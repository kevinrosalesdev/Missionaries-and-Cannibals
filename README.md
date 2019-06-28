# Cannibals and Missionaries Algorithm implemented in three Languages: R [RStudio], Python and Java!

<img src="https://img.shields.io/badge/license-MIT-green.svg" />  <img src="https://img.shields.io/badge/version-1.0-red.svg" /> 

*Python & R* algorithm is based on **Brute-Force** Strategy.

*Java* algorithm uses **Brute Force** and **Backtracking Iterator** Strategies.

All algorithms include a **time option!**

This project has been done by these contributors, be sure to **check them out!**:

- [Kevin David Rosales Santana](https://github.com/kevinrosalesdev)
- [Miguel Ángel Medina Ramírez](https://github.com/miguel-kjh)
- [Héctor Henríquez Cabrera](https://github.com/HectorHc2014)

***

## Problem Statement

> These algorithms try to solve a [Missionaries and Cannibals Problem](https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem) modification. 
> Our problem consists about a boat that **has to cross a river**. Boat must carry **always 3 passengers**. 
>
> However, there can't be more cannibals than missionaries on both riverbanks as cannibals would eat them. There is another constraint: **Boat can't carry more cannibals than missionaries too** (2 cannibals and 1 missionary is not allowed).
>
> In summary, algorithm must create X travels with a full-capacity boat to get Y missionaries and Z cannibals to the other extreme of the river.

### Problem Features

- Missionaries and Cannibals **must** sum a multiple of 3 different from 0.
- Algorithm must take **the number of cannibals and missionaries from input files *fichero\*.txt*.**
  - These files have this **format**:
    - 1 2 1 1 2 [First Case]
    - 2 1 1 1 1 2 2 2 1 [Second Case]
    - etc.
  - Nevertheless, **R Files must have at the end this line:**
    - -1 '\<CR LF>'
- Usually, **first number** will indicate approximately the number of people that have to cross the river [Missionaries + Cannibals] and **the second one** will indicate the number of cases . For example:
  - *fichero10_1.txt* means 1 case of 10 people approximately crossing the river.
- All algorithms must follow **[brute-force strategy](https://en.wikipedia.org/wiki/Brute-force_search) rules.** 
- There has been implemented a **[backtracking iterator strategy](https://en.wikipedia.org/wiki/Backtracking) in Java.**
- All algorithms must have an option (**parameter *-t***) to show its time and must print possible errors if input parameters **are wrong or infeasible.**
- All algorithms must print **used combination and remaining Cannibals and Missioners in each travel**. In that Output:
  - **Missioners will equal to '1'.**
  - **Cannibals will equal to '2'.**

## Requirements

All algorithms were tested using these Versions:

- **Java 8**
- **Python 3.7**
- **RStudio 1.1.463 & R 3.5.1**

## Some Stats

Stats using 'fichero_avanzado.txt' file:

| Language & Strategy                             |   Time    |
| :---------------------------------------------- | :-------: |
| Python [Using Brute-Force Strategy]             |   6.92s   |
| R [Using Brute-Force Strategy]                  |  13.27s   |
| Java [Using Brute-Force Strategy]               |  21.82s   |
| **Java [Using Backtracking Iterator Strategy]** | **1.12s** |

## How to execute all algorithms

Be sure to have `java` and `python` in OS Path!

### Python [Brute-Force Strategy]

Go to /Missionaries-and-Cannibals/Python/ and execute in console:

`python Misioneros_canibales.py [-t] input_file_1 [input_file_2][input_file_N]`

### Java [Brute-Force Strategy]

Go to /Missionaries-and-Cannibals/Java-BruteFroce/Misioneros_Canibales/dist/ and execute in console:

`java -jar Misioneros_Canibales.jar [-t] input_file_1 [input_file_2][input_file_N]`

### Java [Backtracking Strategy]

Go to /Missionaries-and-Cannibals/Java-Backtracking/Misioneros_Canibales/dist/ and execute in console:

`java -jar Misioneros_Canibales.jar [-t] input_file_1 [input_file_2][input_file_N]`

### R [RStudio] [Brute-Force Strategy]

1. Open **RStudio.**
2. Select a **Script.** (Script depends on Input File. For example, *CyM_10_1.R* reads from *fichero10_1.txt*).
3. Go to Session > Set Working Directory > To Source Files Location.
4. Click on 'Source' button!

## Outputs

**Outputs are similar between them.** 

- If you are **not executing '-t'** option, output will be something like:

```bash
################ 0 iteración ################   <= Case 1
El número de misioneros: 4        <= Number of Missionaries
El número de caníbales: 2         <= Number of Cannibals
ORILLA_A -->[1, 1, 1, 1, 2, 2]    <= Riverbank A
ORILLA_B -->[]                    <= Riverbank B
Combinación ganadora:[1, 1, 2]    <= Selected Combination
ORILLA_A -->[1, 1, 2]             <= Riverbank A
ORILLA_B -->[1, 1, 2]             <= Riverbank B
Combinación ganadora:[1, 1, 2]    <= Selected Combination
Resultado de la orilla A:[]       <= Final Riverbank A (Empty) 
Resultado de la orilla B:[1, 1, 2, 1, 1, 2]   <= Final Riverbank B
################ 1 iteración ################ <= Case 2
El número de misioneros: 5
El número de caníbales: 4
ORILLA_A -->[2, 2, 2, 1, 1, 1, 2, 1, 1]
ORILLA_B -->[]
Combinación ganadora:[2, 1, 1]
ORILLA_A -->[2, 2, 1, 2, 1, 1]
ORILLA_B -->[2, 1, 1]
Combinación ganadora:[1, 1, 1]
ORILLA_A -->[2, 2, 2]
ORILLA_B -->[2, 1, 1, 1, 1, 1]
Combinación ganadora:[2, 2, 2]
Resultado de la orilla A:[]
Resultado de la orilla B:[2, 1, 1, 1, 1, 1, 2, 2, 2]
[Etc.]
################ 6 iteración ################
El número de caníbales no puede superar al de misioneros <= Input number of Cannibals can't be greater than input number of missionaries.
[Etc.]
```

- If you **are executing '-t'** option, output will be something like:

```bash
############################==0==#############################  <= Case 1
Iteración: 0
El número de misioneros: 4450             <= Number of Missionaries
El número de caníbales: 3560              <= Number of Cannibals		
Tiempo en milisegundos: 1098.457547       <= Case Time (ms)
##########################==FINAL==###########################  <= Summary
Tiempo final en segundos:1.098457547      <= Total Time (s)
##########################=========###########################
```
