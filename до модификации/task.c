#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double function(double x) {
    return x*x*x*x+2*x*x*x-x-1;
}

double Task(const double e) {
    double a = 0;
    double b = 1;
    double c;
    while (b - a > e) {
        c = (a + b) / 2;
        if (function(a) * function(b) < 0) {
            a = c;
        } else {
            b = c;
        }
    }
    return (a + b) / 2;
}

double Task_random() {
    srand(clock());
    double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
    printf("Generated epsilon: %lf\n", eps);
	return Task(eps);
}
