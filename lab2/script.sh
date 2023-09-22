clear
cd lab2/src

# 1
echo "Задание №1"
cd swap
gcc -o swap main.c swap.h swap.c
./swap
cd ..

# 2
echo "Задание №2"
cd revert_string
gcc -o revert main.c revert_string.c
./revert qwe123
cd ..

# 3
echo "Задание №3"
mkdir bin &> /dev/null
gcc -c revert_string/main.c -o bin/main.o
# статическая библиотека
mkdir bin/static &> /dev/null
gcc -c revert_string/revert_string.c -o bin/static/revert_string.o # 
ar rcs bin/static/librevert.a bin/static/revert_string.o
gcc bin/main.o -Lbin/static -lrevert -o bin/statically-linked
./bin/statically-linked qwe123
#  динамичекая библиотека
mkdir bin/shared &> /dev/null
gcc -c -fPIC revert_string/revert_string.c -o bin/shared/revert_string.o
gcc -shared bin/shared/revert_string.o -o bin/shared/librevert.so
gcc bin/main.o -Lbin/shared -lrevert -o bin/use-shared-library
LD_LIBRARY_PATH=$(pwd)/bin/shared bin/use-shared-library "qwe123"

# 4
echo "Задание №4"
mkdir tests &> /dev/null
#gcc -c tests/tests.c -o tests/tests.o
#gcc tests/tests.o -lcunit -Lbin/shared -lrevert -o test

# end
echo "Конец"
cd ..
git add ./src/swap/swap.c
git add ./src/revert_string/revert_string.c
git add ./script.sh
git commit -m "изменены swap.c и revert_string.c"
git push
cd ..