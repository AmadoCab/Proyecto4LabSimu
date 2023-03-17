#!/usr/bin/env bash

# Compilar archivos .c
cd code/euler/
gcc euler.c -o euler.out -lm
cd ../taylor/
gcc taylor.c -o taylor.out -lm
cd ../runge_kutta
gcc runge_kutta.c -o runge_kutta.out -lm
cd ..

# Ejecutar compilados
./euler/euler.out
./taylor/taylor.out
./runge_kutta/runge_kutta.out
cd ..

# Mover al lugar correcto
mv code/*.csv data/
