clear
cd lab3/src

# 1
echo "Задание №1"
gcc -o seq sequential_min_max.c find_min_max.c utils.c
./seq 3 1

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