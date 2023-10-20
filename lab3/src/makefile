CC=gcc
CFLAGS=-I. # для подключения библиотек

objects = start sequential parallel	# 1

all: $(objects)	# 1

sequential_m : utils.o find_min_max.o utils.h find_min_max.h	# 2
	$(CC) -o sequential find_min_max.o utils.o sequential_min_max.c $(CFLAGS)

parallel_m: utils.o find_min_max.o utils.h find_min_max.h	# 2
	$(CC) -o parallel utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

start_m: utils.o find_min_max.o utils.h find_min_max.h		# 2
	$(CC) -o start utils.o find_min_max.o start.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

clean :
	rm utils.o find_min_max.o sequential parallel start
