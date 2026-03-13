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
En el  presente laboratorio se realiza la implementación de un sumador restador  capaz de realizar operaciones aritméticas de suma y resta con 4 bits. Para optimizar los recursos del hardware, se utilizó el principio matemático del complemento a 2, el cual permite codificar números negativos en binario y transformar las restas en sumas. Esto hizo posible reutilizar la arquitectura de un sumador estándar, añadiendo únicamente compuertas lógicas y una señal de control, simplificando significativamente el diseño.

El diseño se realizó de forma modular en lenguaje de descripción  (HDL) Verilog, estructurándose en tres niveles:

1.Módulo `sumador_1`:
Es la unidad fundamental (Full Adder) que suma dos bits individuales (A y B)
junto con un acarreo de entrada (`Ci`), produciendo un bit de suma (`So`) y un
acarreo de salida (`Co`).

2.Módulo `sumador_4bits`:
Se construyó instanciando cuatro módulos `sumador_1` conectados en cascada
(Ripple Carry Adder). El acarreo de salida de cada bit menos significativo
se conecta a la entrada de acarreo del bit inmediatamente superior.

3.Módulo sumador_restador (Top Level):
Es el circuito final que integra el sumador de 4 bits y la lógica para el
complemento a 2. Incorpora una señal de control Sel (Selector) donde:

`Sel = 0` → realiza una suma
`Sel = 1` → realiza una resta

Fundamento lógico de la resta (Complemento a 2)

Matemáticamente, la resta A - B se transforma en una suma mediante:


A - B = A + (~B + 1)

donde ~B representa la inversión de bits (complemento a 1).

En el código esto se implementa de la siguiente manera:

Paso 1 (Inversión):
Se utilizan compuertas XOR:

`assign B_xor[0] = B[0] ^ Sel;`

Si     `Sel = 1`, la compuerta invierte los bits del operando B.
Si     `Sel = 0`, los bits pasan sin modificarse.

Paso 2 (+1):
La señal Sel se conecta directamente a la entrada de acarreo inicial (`Ci`)
del sumador_4bits. Por lo tanto, cuando     `Sel = 1` (resta), se suma
automáticamente un 1 al resultado invertido, completando así
la operación de complemento a 2.

El bit de acarreo final (`Co`) permite interpretar el resultado en las
operaciones de resta. Un `Co = 1` indica un resultado positivo, mientras que un `Co = 0` indica un resultado negativo expresado en complemento a 2.

#### 1.2 Diagramas

DIAGRAMA RTL 

## Simulaciones 

### 1. Simulación del sumador/restador

#### 1.1 Descripción
Para verificar y validar el correcto funcionamiento del diseño antes de su implementación física, se realizó una simulación empleando el software Icarus Verilog. La simulación es un paso importante en el diseño digital, ya que permite identificar y corregir errores de lógica observando el comportamiento de las señales en el tiempo.Se elaboró un testbench (banco de pruebas) para estimular las entradas `A`, `B` y `Sel` del módulo Vsumador_restadorV. Se probaron diferentes casos de uso:Suma normal (`Sel = 0`): Se verificó que el circuito sumara correctamente números sin generar alteraciones en el operando B.Resta con resultado positivo (`Sel = 1`): Ejemplo conceptual como $7 - 5$, donde el sistema calcula el complemento a 2 de 5 ($0101_2 \rightarrow 1010_2 + 1 = 1011_2$) y realiza la suma $0111_2 + 1011_2 = 10010_2$. Se descartó el acarreo final (MSB) para obtener el resultado de $0010_2$ (2 en decimal).Resta con resultado negativo (Sel = 1): Casos donde el minuendo es menor que el sustraendo (ej. $3 - 7$), verificando que el acarreo de salida sea 0 y el resultado se presente correctamente en formato complemento a 2

#### 1.2 Diagrama
Diagrama de icarus verilog

## Evidencias de implementación


## Conclusiones


## Referencias
