#include <stdio.h>
#include <math.h>

double edo(double x, double y) {
    return y - pow(x, 2) + 1;
}

int main () {
    FILE *fptr;
    int i, n;
    double k_1, k_2, k_3, k_4;
    double x_i, y_i, x_f, h;

    // Asignaciónes para el problema
    x_i = 0;
    y_i = 0.5;
    x_f = 2;
    n = 10;

    // Lógica
    fptr = fopen("./data-runge_kutta.csv", "w");
    h = (x_f - x_i)/n;

    fprintf(fptr, "i,xi,yi\n");
    for (i = 0; i <= n; i++){
        fprintf(fptr, "%d,%.16lf,%.16lf\n", i, x_i, y_i);

        // Variables auxiliares
        k_1 = h * edo(x_i, y_i);
        k_2 = h * edo(x_i+h/2, y_i+k_1/2);
        k_3 = h * edo(x_i+h/2, y_i+k_2/2);
        k_4 = h * edo(x_i+h, y_i+k_3);
        // ...

        y_i += (k_1 + 2*k_2 + 2*k_3 + k_4)/6;
        x_i += h;
    }
    fclose(fptr);

    return 0;
}

