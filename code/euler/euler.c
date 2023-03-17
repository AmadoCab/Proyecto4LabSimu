#include <stdio.h>
#include <math.h>

double edo(double x, double y) {
    return y - pow(x, 2) + 1;
}

int main() {
    FILE *fptr;
    int i, n;
    double x_i, y_i, x_f, h;

    // Asignaciónes para el problema
    x_i = 0;
    y_i = 0.5;
    x_f = 2;
    n = 10;

    // Lógica
    fptr = fopen("./data-euler.csv", "w");
    h = (x_f - x_i)/n;

    fprintf(fptr, "i,xi,yi\n");
    for (i = 0; i <= n; i++){
        fprintf(fptr, "%d,%.16lf,%.16f\n", i, x_i, y_i);

        y_i += h * edo(x_i, y_i);
        x_i += h;
    }
    fclose(fptr);

    return 0;
}

