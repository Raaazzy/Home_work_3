# ИДЗ №3 по АВС (на 9 баллов)
Омирбекова Дария, группа БПИ-217<br>
Вариант 34

# Используемые файлы:
- До модификации:
> главный файл с функцией main - [main.c](), [main.s]()<br>
побочный файл с функцией task для вычисления корня уравнения - [task.c](), [task.s]()<br>
- После модификации:
> главный файл с функцией main - [main.c](), [main.s]()<br>
побочный файл с функцией task для вычисления корня уравнения - [task.c](), [task.s]()<br>

# <a name="explanation">Пояснения к запуску и эксплуатации:</a>
Чтобы запустить программу необходимо с необходимым режимом следует ввести следующие команды:<br>
- С использованием аргументов командной строки:

Если нужно работать с вводом с консоли:
```s
./program.exe epsilon
# где epsilon - константа, определяющая точность вычисления корня
# константу необхожимо выбрать из диапазона [0.001, 0.00000001] и обязательно использовать для ввода точку
```
Если нужно работать с вводом с файла:
```s
./program.exe input.txt output.txt
# где input.txt - это название файла, с которого нужно считать информацию
# где output.txt - это название файла, в который нужно записать информацию
```
Если нужно работать с рандомно сгенерированной точностью вычисления:
```s
./program.exe
```
# На 4 балла:
### - Приведено решение задачи на C.
> главный файл с функцией main (после модификации) - [main.c]()<br>
побочный файл с функцией task для вычисления корня уравнения (после модификации) - [task.c]()<br>

### - В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C.
> главный файл с функцией main (после модификации) - [main.s]()<br>
побочный файл с функцией task для вычисления корня уравнения (после модификации) - [task.s]()<br>

### - Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки:
> главный файл с функцией main (после модификации) - [main.s]()<br>
побочный файл с функцией task для проверки строки на палиндром (после модификации) - [task.s]()<br>

Убраны следующие строчки кода в файле main.s:<br>
```s
	endbr64                                                           
```
Убраны следующие строчки кода в файле task.s:<br>
```s
	endbr64				     	  
```

### - Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки.
Скомпоновала программу, с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./task.c -S -o ./task.s
gcc ./main.s -c -o main.o
gcc ./task.s -c -o task.o
gcc ./task.o main.o -o program.exe
```

### - Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах.
Программы были протестированы на следующих тестовых данных:
```
0.1
0.001
0.00000001
0.00034
0.0000099
```
- Все тесты обе программы выполнили успешно, выдав одинаковый результат:
1. ![image](https://user-images.githubusercontent.com/111382627/203544049-7338f091-d50b-477e-bef9-7329658ed1df.png)
2. ![image](https://user-images.githubusercontent.com/111382627/203544174-ba13f72f-f466-4c32-a530-3ea74e5eeaa5.png)
3. ![image](https://user-images.githubusercontent.com/111382627/203544260-8f1827c7-bfaa-469c-bfda-403c443c9959.png)
4. ![image](https://user-images.githubusercontent.com/111382627/203544389-fa1fad3a-f104-4247-8d5f-b67ee5e8da12.png)
5. ![image](https://user-images.githubusercontent.com/111382627/203544486-66c0bb4f-1aaa-4ac6-bb4e-e97cb7eacfad.png)

# На 5 баллов:
### - В реализованной программе использовать функции с передачей данных через параметры.
> файл с функцией task - [task.c]()<br>

Для реализации данного пункта использовалась отдельные функции Task(const double e) и function(double x):
```c
double function(double x)
double Task(const double e)

```

### - Использовать локальные переменные.
> главный файл с функцией main - [main.c]()<br>
побочный файл с функцией task - [task.c]()<br>

Локальные переменные, которые были использованы в функции main:
```c
int i;
double epsilon;
char* temp;
time_t t_start;
time_t t_end;
FILE *input_stream;
FILE *output_stream;
```
Локальные переменные, которые были использованы в функции task:
```c
double x;
double e;
double a;
double b;
double c;
double eps;
```
### - В ассемблерную программу при вызове функции добавить комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.
> главный файл с функцией main - [main.s]()<br>
побочный файл с функцией task - [task.s]()<br>

### - В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
> главный файл с функцией main - [main.s]()<br>
побочный файл с функцией task - [task.s]()<br>

# На 6 баллов:
### - Рефакторинг программы на ассемблере за счет максимального использования регистров процессора.
Все локальные переменные заменены на регистры. Добавлены соответствующие комментарии в коде программ.<br>
> В файле с функцией main - [main.s]():<br>
```
# r15d - i 
# rbp-16 - input_stream
# rbp-24 - output_stream
# rbp-32 - t_start
# rbp-40 - t_end
# rbp-48 - epsilon
# rbp-56 - temp
# rbp-68 - argc 
# rbp-80 - argv
```
> В файле с функцией task - [task.s]():<br>
```
# rbp-8 - x
# rbp-40 - e
# rbp-8 - a
# rbp-16 - b
# rbp-24 - c
# rbp-8 - eps
```

### - Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C.
> главный файл с функцией main - [main.s]()<br>
побочный файл с функцией task - [task.s]()<br>

### - Представлены тестовые прогоны для разработанной программы.
Программа была протестирована на следующих тестовых данных:
```
0.1
0.001
0.00000001
0.00034
0.0000099
```
- Все тесты программа выполнила успешно, выдав корректный результат:
1. ![image](https://user-images.githubusercontent.com/111382627/203544049-7338f091-d50b-477e-bef9-7329658ed1df.png)
2. ![image](https://user-images.githubusercontent.com/111382627/203544174-ba13f72f-f466-4c32-a530-3ea74e5eeaa5.png)
3. ![image](https://user-images.githubusercontent.com/111382627/203544260-8f1827c7-bfaa-469c-bfda-403c443c9959.png)
4. ![image](https://user-images.githubusercontent.com/111382627/203544389-fa1fad3a-f104-4247-8d5f-b67ee5e8da12.png)
5. ![image](https://user-images.githubusercontent.com/111382627/203544486-66c0bb4f-1aaa-4ac6-bb4e-e97cb7eacfad.png)

### - Сопоставим размеры программы до модификации и после:
- В модифицированной программе содержится приблизительно 423 строк кода без учета комментариев. При этом ее вес составляет 13 KiB.<br>
- В не модифицированной программе содержиться приблизительно 447 строк кода без учета комментариев. При этом ее вес составляет 14 KiB.<br>

# На 7 баллов:
### - Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.
Было получено 2 единицы компиляции: 
> главный файл с функцией main - [main.s]()<br>
побочный файл с функцией task для определения палиндрома - [task.s]()<br>

Программа скомпанована с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./task.c -S -o ./task.s
gcc ./main.s -c -o main.o
gcc ./task.s -c -o task.o
gcc ./task.o main.o -o program.exe
```
### - Задание файлов с исходными данными и файла для вывода результатов с использованием аргументов командной строки.
> главный файл с функцией main - [main.c]()<br>
побочный файл с функцией task - [task.c]()<br>

Данный пункт реализован с помощью добавления фрагмента кода в функцию main:
```c
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
```

### - Результат работы с тестовыми данными:
С данными файлами можно протестировать программу лично: [тестовые данные]()<br>

Тип входных данных: десятичная дробь, лежащая в диапазоне [0.00000001, 0.001].<br>
Тип выходных данных: десятичная дробь.<br>

Если входные данные поступили из файла, то и выведутся в файл.<br>
Если входные данные поступили из консоли, то и будут вывеены в консоль.<br>

![image](https://user-images.githubusercontent.com/111382627/203645554-0bb5a02b-2530-4641-8aca-d75b687e6efa.png)
![image](https://user-images.githubusercontent.com/111382627/203645741-6e38580c-baa7-48f0-b4cf-103be730468c.png)
![image](https://user-images.githubusercontent.com/111382627/203645847-6cb57cb2-c14f-4911-b0bf-13523b912976.png)
![image](https://user-images.githubusercontent.com/111382627/203645968-aea00373-8209-427b-8731-cfbc0a2d81d9.png)
![image](https://user-images.githubusercontent.com/111382627/203646053-c77c0771-85cd-4e6a-9295-48619c9800b1.png)

