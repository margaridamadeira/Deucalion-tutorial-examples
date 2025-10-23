/* source:  Figure 2.4: A simple multithreaded program in C
 in
 Operating Systems and Middleware: Supporting Controlled Interaction
 Max Hailperin
 Gustavus Adolphus College
 Revised Edition 1.3.1
 June 4, 2019 
 */
 
 #include <pthread.h>
 #include <unistd.h>
 #include <stdio.h>
 
 static void *child(void *ignored){
	 sleep(3);
	 printf("Child is done sleeping 3 seconds.\n");
	 return NULL;
 }
 
 
 int main(int argc, char *argv[]){
	pthread_t child_thread;
	int code;
	code = pthread_create(&child_thread, NULL, child, NULL);
	if(code){
		fprintf(stderr, "pthread_create failed with code %d\n", code);
	}
	sleep(5);
	printf("Parent is done sleeping 5 seconds.\n");
	return 0;
 }

