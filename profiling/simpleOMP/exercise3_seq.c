#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

/* SOMATÓRIO
Somatório de um intervalo
*/
int sum_interval(int min, int max)
{
    int result = 0;
    for (int i = min; i <= max; i++)
	     result += i;
    return result;
}

int somatorio(double n)
{
int result = 0, id = 999;

// Queria criar uma região paralela que será percorrida por
// N threads. Porque não é assim? Corrija.
int N = omp_get_num_threads();
printf("(function) Number of threads = %d\n", N);

#pragma omp parallel num_threads(N)
    {	
	N = omp_get_num_threads();	
	printf("	(parallel) Number of threads = %d\n", N);
// Inicializa a variável id, que representa o número do thread
	
	int id = omp_get_thread_num();
// Inicializa o mínimo e o máximo que o thread vai contar
	int min = id * n / N + 1;
	int max = (id + 1) * n / N;
	
	
// Como a obtenção do resultado é uma "mini" secção crítica,
// foi declarada uma zona atómica, onde o resultado irá ser incrementado
	int sum = sum_interval(min, max);
	printf("[%d] min = %d ; max = %d; sum=%d\n", id, min, max, sum);
	
    
    // #pragma omp atomic
	result = result + sum;
    }
    return result;

}

int main(int argc, char **argv)
{
    int n = 0, N = 0;
    printf("Valor: ");
    scanf("%d", &n);
	
	N = omp_get_num_threads();
	printf("(main) Number of threads = %d\n", N);
	
    printf("%d \n", somatorio(n));
    return 0;
}

