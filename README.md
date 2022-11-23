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
	
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	3539053052
	.long	1062232653
	.align 8
.LC2:
	.long	3794832442
	.long	1044740494
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:                                                                
```
Убраны следующие строчки кода в файле task.s:<br>
```s
	endbr64
	
	.size	Task_random, .-Task_random
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	371865828
	.long	1062232643
	.align 8
.LC5:
	.long	3794832442
	.long	1044740494
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:						     	  
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
