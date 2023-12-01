clear
cd lab4/src

echo "Запуск makefile"
mkdir bin
gcc -c sumfunc.c -o ./bin/sumfunc.o
ar rcs ./bin/libsum.a ./bin/sumfunc.o
make all

# 1
echo "Задание №1"
./parallel --seed 2 --array_size 2000 --pnum 8000 --time 1

# 2
echo "Задание №2"
gcc -o zombie zombie.c
./zombie

# 3
echo "Задание №3"
./process

# 5
echo "Задание №5"
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
git add ./src/zombie.c
git add ./script.sh
git commit -m "добавлен makefile, sumfunc.c, sumfunc.h, zombie.c и изменён parallel_sum.c"
git push
cd ..