clear
cd lab5/src

echo "Запуск makefile"
make all

# 1
echo "Задание №1"
echo "Без mutex"
gcc -o without_mutex without_mutex.c -pthread
./without_mutex
echo "С mutex"
gcc -o with_mutex with_mutex.c -pthread
./with_mutex

# 2
echo "Задание №2"
./fact  --k 10 --pnum 4 --mod 10

# 3
echo "Задание №3"

make clean


# end
echo "Конец"
cd ..
git add ./src/makefile
git add ./src/without_mutex.c
git add ./src/with_mutex.c
git add ./src/deadlock.c
git add ./src/fact.c
git add ./script.sh
git commit -m "добавлен makefile, deadlock.c, fact.c"
git push
cd ..