#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern double Task(const double e);
extern double Task_random();

int main(int argc, char *argv[])
{
    double epsilon;
    // Ввод с помощью рандома
    if (argc == 1) {
        char *file_name;
        printf("Input name of the output file: ");
        scanf("%s", file_name);
        FILE *output_stream = fopen(file_name, "w");
        if (output_stream == NULL) {
            printf("The name of the output file was entered incorrectly.\n");
            return 0;
        }
        fprintf(output_stream, "%lf ", Task_random());
        fclose(output_stream);
        return 0;
    }
    // Ввод с помощью консоли
    if (argc == 2) {
        char* temp = NULL;
        epsilon = strtod(argv[1], &temp);
        if (epsilon > 0.001 || epsilon < 0.00000001) {
            printf("The entered epsilon is not in range [0.00000001; 0.001].\n");
            return 0;
        }
        time_t t_start = clock();
        for (int i = 0; i < 25000000; ++i) {
            Task(epsilon);
        }
        time_t t_end = clock();
        printf("Program execution time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
        printf("Result: %lf\n", Task(epsilon));
        return 0;
    }
    // Ввод с помощью файла
    if (argc == 3) {
        FILE *input_stream = fopen(argv[1], "r");
        if (input_stream == NULL) {
            printf("The name of the data entry file was entered incorrectly.\n");
            return 0;
        }
        fscanf(input_stream, "%lf", &epsilon);
        fclose(input_stream);
        if (epsilon > 0.001 || epsilon < 0.00000001) {
            printf("The entered epsilon is not in range [0.00000001; 0.001].\n");
            return 0;
        }
        FILE *output_stream = fopen(argv[2], "w");
        if (output_stream == NULL) {
            printf("The name of the output file was entered incorrectly.\n");
            return 0;
        }
        fprintf(output_stream, "%lf ", Task(epsilon));
        fclose(output_stream);
        return 0;
    }
    printf("Please try entering you details again, but correctly.\n");
    return 0;
}
