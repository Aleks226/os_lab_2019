clear
cd lab4/src

# 1
echo "Задание №1-5"
mkdir bin
gcc -c sumfunc.c -o ./bin/sumfunc.o
ar rcs ./bin/libsum.a ./bin/sumfunc.o
make all
./parallel --seed 2 --array_size 8 --pnum 4 --time 10
./psum  --seed 1 --array_size 1 --threads_num 1
make clean


# end
echo "Конец"
cd ..
git add ./src/makefile
git add ./src/sumfunc.c
git add ./src/sumfunc.h
git add ./src/parallel_sum.c
git add ./src/process_memory.c
git add ./script.sh
git commit -m "добавлен makefile, sumfunc.c, sumfunc.h и изменён parallel_sum.c"
git push
cd ..