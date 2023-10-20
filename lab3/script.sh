clear
cd lab3/src

# 1
echo "Задание №1"
gcc -o seq sequential_min_max.c find_min_max.c utils.c
./seq 2 8

# 2-3
echo "Задание №2-3"
gcc -o parallel parallel_min_max.c find_min_max.c utils.c
./parallel --seed "2" --array_size "8" --pnum "4"
./parallel --seed "2" --array_size "8" --pnum "4" -f

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