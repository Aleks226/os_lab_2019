clear
cd lab6/src

echo "Запуск makefile"
mkdir bin
mkdir bin/static
gcc -c multmodulo.c -o bin/static/multmodulo.o
ar rcs bin/static/libmult.a bin/static/multmodulo.o
make all

# 1
echo "Задание №1"
./start
make clean


# end
echo "Конец"
cd ..
git add ./src/makefile
git add ./src/client.c
git add ./src/server.c
git add ./src/multmodulo.c
git add ./src/multmodulo.h
git add ./script.sh
git commit -m "добавлен makefile,  изменены client.c, server.c"
git push
cd ..