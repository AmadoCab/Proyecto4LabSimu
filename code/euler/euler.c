#include <stdio.h>
#include <math.h>

double edo(double x, double y) {
    return 0.16 * y;
}

int main() {
    FILE *fptr;
    int i, n;
    double x_i, y_i, x_f, h;

    // Asignaciónes para el problema
    x_i = 0;
    y_i = 367;
    x_f = 20;
    n = 100;

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

