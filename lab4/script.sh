clear
cd lab4/src

# 1
echo "Задание №1-3"
gcc -c sumfunc.c -o ./bin/sumfunc.o
ar rcs ./bin/libsum.a ./bin/sumfunc.o
make all
./parallel --seed "2" --array_size "8" --pnum "4" --time "10"
make clean

# 4
echo "Задание №4"


# 5
echo "Задание №5"


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