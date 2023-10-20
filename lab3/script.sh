clear
cd lab3/src

# 1
echo "Задание №1"
cd src
gcc -o FindMinMax find_min_max.c find_min_max.h utils.h
./src

# end
echo "Конец"
cd ..
git add ./src/find_min_max.c
git add ./src/parrallel+min_max.c
git add ./src/makefile
git add ./src/start.c
git add ./script.sh
git commit -m "изменены find_min_max.c, parrallel+min_max.c, start.c и makefile"
git push
cd ..