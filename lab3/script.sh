clear
cd lab3/src

# 1
echo "Задание №1"
gcc -o sequential_1 sequential_min_max.c find_min_max.c utils.c
./sequential_1 2 8

# 2-3
echo "Задание №2-3"
gcc -o parallel_23 parallel_min_max.c find_min_max.c utils.c
./parallel_23 --seed "2" --array_size "8" --pnum "4"
./parallel_23 --seed "2" --array_size "8" --pnum "4" -f

# 4
echo "Задание №4"
make all
./sequential_m 2 8
./parallel_m --seed "2" --array_size "8" --pnum "4"

# 5
echo "Задание №5"
./start_m 2 8
make clean

# end
echo "Конец"
cd ..
git add ./src/find_min_max.c
git add ./src/parallel_min_max.c
git add ./src/makefile
git add ./src/start.c
git add ./script.sh
git commit -m "изменены find_min_max.c, parallel_min_max.c, start.c и makefile"
git push
cd ..