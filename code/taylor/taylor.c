#include <stdio.h>
#include <math.h>

// Retahíla de derivadas
double edo(double x, double y) {
    return y - pow(x, 2) + 1;
} 

double d_edo(double x, double y) {
    return edo(x, y) - 2*x;
}

double dd_edo(double x, double y) {
    return d_edo(x, y) - 2;
}

double ddd_edo(double x, double y) {
    return dd_edo(x, y);
}


int main () {
    FILE *fptr;
    int i, n;
    double x_i, y_i, x_f, h;

    // Asignaciónes para el problema
    x_i = 0;
    y_i = 0.5;
    x_f = 2;
    n = 10;
    
    // Lógica
    fptr = fopen("./data-taylor.csv", "w");
    h = (x_f - x_i)/n;

    fprintf(fptr, "i,xi,yi\n");
    for (i = 0; i <= n; i++){
        fprintf(fptr, "%d,%.16lf,%.16f\n", i, x_i, y_i);

        y_i += h*(edo(x_i, y_i) + h*d_edo(x_i, y_i)/2 + pow(h,2)*dd_edo(x_i, y_i)/6 + pow(h,3)*ddd_edo(x_i, y_i)/24);
        x_i += h;
    }
    fclose(fptr);

    return 0;
}

