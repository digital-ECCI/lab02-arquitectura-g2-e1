[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Px-uYaj2)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=23107576&assignment_repo_type=AssignmentRepo)
# Lab02 - Sumador/Restador de 4 bits

# Integrantes
* Omar David Garay Osorio cod. 133729
* Cesar Agusto Carrasco Hastamorir 130783
* Gerardo Steven Loaiza Ortiz 134549

# Informe


Indice:

1. [Documentación](#documentación-de-los-circuitos-implementados-implementado)
2. [Simulaciones](#simulaciones)
3. [Evidencias de implementación](#evidencias-de-implementación)
4. [Preguntas](#preguntas)
5. [Conclusiones](#conclusiones)
6. [Referencias](#referencias)

## Documentación del diseño implementado

### 1. Sumador/Restador

#### 1.1 Descripción
El presente laboratorio detalla la implementación en hardware de un circuito capaz de realizar operaciones aritméticas de suma y resta con palabras de 4 bits. Para optimizar los recursos del hardware, se utilizó el principio matemático del complemento a 2, el cual permite codificar números negativos en binario y transformar las restas en sumas. Esto hizo posible reutilizar la arquitectura de un sumador estándar, añadiendo únicamente compuertas lógicas y una señal de control, simplificando significativamente el diseño.

El diseño se realizó de forma modular en lenguaje de descripción de hardware (HDL) Verilog, estructurándose en tres niveles:

/*
Descripción del diseño

1.Módulo sumador_1:
Es la unidad fundamental (Full Adder) que suma dos bits individuales (A y B)
junto con un acarreo de entrada (Ci), produciendo un bit de suma (So) y un
acarreo de salida (Co).

2.Módulo sumador_4bits:
Se construyó instanciando cuatro módulos sumador_1 conectados en cascada
(Ripple Carry Adder). El acarreo de salida de cada bit menos significativo
se conecta a la entrada de acarreo del bit inmediatamente superior.

3.Módulo sumador_restador (Top Level):
Es el circuito final que integra el sumador de 4 bits y la lógica para el
complemento a 2. Incorpora una señal de control Sel (Selector) donde:
Sel = 0 → realiza una suma
Sel = 1 → realiza una resta

Fundamento lógico de la resta (Complemento a 2)

Matemáticamente, la resta A - B se transforma en una suma mediante:

A - B = A + (~B + 1)

donde ~B representa la inversión de bits (complemento a 1).

En el código esto se implementa de la siguiente manera:

Paso 1 (Inversión):
Se utilizan compuertas XOR:

assign B_xor[0] = B[0] ^ Sel;

Si Sel = 1, la compuerta invierte los bits del operando B.
Si Sel = 0, los bits pasan sin modificarse.

Paso 2 (+1):
La señal Sel se conecta directamente a la entrada de acarreo inicial (Ci)
del sumador_4bits. Por lo tanto, cuando Sel = 1 (resta), se suma
automáticamente un 1 al resultado invertido, completando así
la operación de complemento a 2.

El bit de acarreo final (Co) permite interpretar el resultado en las
operaciones de resta.
*/
#### 1.2 Diagramas


## Simulaciones 

### 1. Simulación del sumador/restador

#### 1.1 Descripción

#### 1.2 Diagrama


## Evidencias de implementación


## Conclusiones


## Referencias
