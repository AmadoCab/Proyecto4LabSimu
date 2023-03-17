#!/usr/bin/env bash

# Compilar archivos .c
cd code/euler/
gcc euler.c -o euler.out -lm
cd ../runge_kutta
gcc runge_kutta.c -o runge_kutta.out -lm
cd ..

# Ejecutar compilados
./euler/euler.out
./runge_kutta/runge_kutta.out
cd ..

# Mover al lugar correcto
rm data/*.csv
mv code/*.csv data/
