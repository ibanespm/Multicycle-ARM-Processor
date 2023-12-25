# MULTICYCLE ARM PROCESSOR IMPLEMENTATION

Este proyecto presenta una implementación de un procesador ARM en modo multi-ciclo. El procesador ejecuta diversas operaciones utilizando una arquitectura de conjunto de instrucciones reducido (RISC).

## Instrucciones Soportadas

- ADD
- SUB
- AND
- OR
- MUL
- UMUL
- SMUL

## Estructura del Proyecto

La implementación consta de varios módulos, entre ellos:

- `arm`: Representa la lógica de control y la unidad de procesamiento del procesador ARM multi-ciclo.
- `mem`: Simula la memoria del sistema.

## Descripción de la Implementación Multi-Ciclo de ARM:

En una implementación multi-ciclo de ARM, cada instrucción se ejecuta en varias etapas (ciclos de reloj). Las etapas típicas incluyen:

1. **Fetch (Buscar):** La instrucción se obtiene de la memoria y se almacena en el registro de instrucciones (PC).
2. **Decode (Decodificar):** La instrucción se decodifica para determinar la operación y los operandos involucrados.
3. **Execute (Ejecutar):** La operación se realiza, y los resultados se calculan si es necesario.
4. **Memory Access (Acceso a Memoria):** Si es necesario acceder a la memoria, se realiza esta operación.
5. **Write Back (Escribir en Registros):** Los resultados finales se escriben de vuelta en los registros.

## Requisitos

- Icarus Verilog
- GTKWave

## Ejecución de la Simulación

1. Compilar los archivos Verilog:
    ```bash
    iverilog *.v
    ```
2. Ejecutar la simulación:
    ```bash
    vvp a.out
    ```
3. Ver los resultados con GTKWave:
    ```bash
    gtkwave alu.vcd
    ```

Asegúrate de tener instalados Icarus Verilog y GTKWave antes de ejecutar la simulación.


