CC=gcc
CFLAGS=-I. # для подключения библиотек

objects = start sequential parallel	# 1

all: $(objects)	# 1

sequential : utils.o find_min_max.o utils.h find_min_max.h	# 2
	$(CC) -o sequential_m find_min_max.o utils.o sequential_min_max.c $(CFLAGS)

parallel: utils.o find_min_max.o utils.h find_min_max.h	# 2
	$(CC) -o parallel_m utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

start: utils.o find_min_max.o utils.h find_min_max.h		# 2
	$(CC) -o start_m utils.o find_min_max.o start.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

clean :
	rm utils.o find_min_max.o sequential_m parallel_m start_m
