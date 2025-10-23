#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

/* SOMATÓRIO
Somatório de um intervalo
Teste os seus conhecimentos sobre o uso de reduction e atomic. 
Verifique as suas conclusões.
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
	int nthreads, tid, sum;
	int result = 0; 
	
	int N = omp_get_num_threads();
	printf("(function) Number of threads = %d\n", N);

// Cria uma região paralela que será percorrida por N threads
// Haverá diferença entre usar a claúsula reduction ou a diretiva atomic?

#pragma omp parallel private(nthreads, tid, sum) // reduction(+:result)
    {	
	N = omp_get_num_threads();	
	printf("	(parallel) Number of threads = %d\n", N);
	nthreads = N;
	
	// Inicializa a variável id, que representa o número do thread
	int tid = omp_get_thread_num();
	
	// Inicializa o mínimo e o máximo que o thread vai contar
	int min = tid * n / N + 1;
	int max = (tid + 1) * n / N;
	// Como a obtenção do resultado é uma "mini" secção crítica,
	// foi declarada uma zona atómica, onde o resultado irá ser incrementado
	int sum = sum_interval(min, max);
	printf("[%d] min = %d ; max = %d; sum=%d\n", tid, min, max, sum);
	
	#pragma omp atomic
	result = result + sum;
    }
	
    return result;

}

int main(int argc, char **argv)
{
    int n = 0;
	
	int N = omp_get_num_threads();
	printf("(main) Number of threads = %d\n", N);
	
    printf("Valor: ");
	scanf("%d", &n);
    printf("%d \n", somatorio(n));
    return 0;
}
