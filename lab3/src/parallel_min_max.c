#include <ctype.h>
#include <limits.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <getopt.h>

#include "find_sum.h"
#include "find_min_max.h"
#include "utils.h"


void kill_child(pid_t id);

int main(int argc, char **argv) {
  int seed = -1;
  int array_size = -1;
  int pnum = -1;
  int timeout = -1;
  bool with_files = false;

  while (true) {
   

  //обработка входных аргументов
    int current_optind = optind ? optind : 1;

    static struct option options[] = {{"seed", required_argument, 0, 0},
                                      {"array_size", required_argument, 0, 0},
                                      {"pnum", required_argument, 0, 0},
                                      {"by_files", no_argument, 0, 'f'},
                                      {"timeout", required_argument, 0, 0},
                                      {0, 0, 0, 0}};

    int option_index = 0;
    int c = getopt_long(argc, argv, "f", options, &option_index);

    if (c == -1) break;

    switch (c) {
      case 0:
        switch (option_index) {
          case 0:
            seed = atoi(optarg);
           if (seed <= 0) {
              printf("seed must be a positive number\n");
              return 1;
            }
            break;
          case 1:
            array_size = atoi(optarg);
             if (array_size <= 0) {
              printf("array_size must be a positive number\n");
              return 1;
            }
            break;
          case 2:
            pnum = atoi(optarg);
             if (pnum <= 0) {
              printf("pnum must be a positive number\n");
              return 1;
            }
            break;
          case 3:
            with_files = true;
            break;
          case 4:
            timeout = atoi(optarg);
            if (timeout <= 0) {
              printf("timeout must be a positive number\n");
              return 1;
            }
            break;
          defalut:
            printf("Index %d is out of options\n", option_index);
        }
        break;
      case 'f':
        with_files = true;
        break;

      case '?':
        break;

      default:
        printf("getopt returned character code 0%o?\n", c);
    }
  }

  if (optind < argc) {
    printf("Has at least one no option argument\n");
    return 1;
  }

  if (seed == -1 || array_size == -1 || pnum == -1 || timeout == -1) {
    printf("Usage: %s --seed \"num\" --array_size \"num\" --pnum \"num\" \n",
           argv[0]);
    return 1;
  }

//инициализация массива и данных
  int *array = malloc(sizeof(int) * array_size);
  GenerateArray(array, array_size, seed);
  int active_child_processes = 0;

  struct timeval start_time;
  gettimeofday(&start_time, NULL);


//заводим будильник
alarm(timeout);
sleep(timeout/2);


//подготовка к синхронизации
  int proc_elements_num = array_size / pnum; // количество элементов которые будет обрабатывать каждый процесс
  pid_t kill_pid = -1;

  FILE *file;
  if(with_files) {
    file = fopen("sync_file.txt", "w");
  }

  int pipefd[2];
  if(!with_files){
    pipe(pipefd);
  }


//распараллеливаем

  int start_ind, end_ind;
  
  for (int i = 0; i < pnum; i++) {
    pid_t child_pid = fork();
    if (child_pid >= 0) {
      // successful fork
      active_child_processes += 1;
      //prinft("make %d child",active_child_processes);
      if (child_pid == 0) {
        // child process
        start_ind = i * proc_elements_num;
        if(i == pnum - 1) end_ind = array_size;
        else end_ind = (i+1)*proc_elements_num;

        struct MinMax min_max = GetMinMax(array, start_ind, end_ind);

// синхронизация
  //с использованием файлов
        if (with_files) {
          fprintf(file, "%d %d\n",min_max.min, min_max.max);
        } 
  //с использованием pipe
        else {
          write(pipefd[1], &min_max.min, sizeof(int));
          write(pipefd[1], &min_max.max, sizeof(int));
          close(pipefd[0]);
        }
        return 0;
      }
      else {
        kill_pid = child_pid;
        signal(SIGALRM, kill_child);
      }
    } 
    else {
      printf("Fork failed!\n");
      return 1;
    }
  }

if(with_files) fclose(file);

//убиваем детей
  while (active_child_processes > 0) {
    //printf("amount of kids: %d\n", active_child_processes);
    signal (SIGALRM, kill_child);
    active_child_processes -= 1;
  }


//находим конечный минимум и максимум
  if(with_files) file = fopen("sync_file.txt", "r");
  struct MinMax min_max;
  min_max.min = INT_MAX;
  min_max.max = INT_MIN;

  for (int i = 0; i < pnum; i++) {
    int min = INT_MAX;
    int max = INT_MIN;

    if (with_files) {
      //read from file
      fscanf(file,"%d %d", &min, &max);
    } else {
      // read from pipes
      read(pipefd[0], &min_max.min, sizeof(int));
      read(pipefd[0], &min_max.max, sizeof(int));
    }

    if (min < min_max.min) min_max.min = min;
    if (max > min_max.max) min_max.max = max;
  }
  //if(with_files) fclose(file);

  struct timeval finish_time;
  gettimeofday(&finish_time, NULL);

  double elapsed_time = (finish_time.tv_sec - start_time.tv_sec) * 1000.0;
  elapsed_time += (finish_time.tv_usec - start_time.tv_usec) / 1000.0;

  free(array);

  printf("Min: %d\n", min_max.min);
  printf("Max: %d\n", min_max.max);
  printf("Elapsed time: %fms\n", elapsed_time);
  fflush(NULL);


  return 0;
}

void kill_child(pid_t id){
  kill(id, SIGKILL);
  printf("child die\t");
  int status;
  wait(&status);
}



