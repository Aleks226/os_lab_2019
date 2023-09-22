clear
cd lab0

# 2
echo "Задание №2"
mkdir hello &> /dev/null
cd hello
touch empty
cp ../src/hello.c hello.c
mv hello.c newhello.c

# 3
echo "Задание №3"
sh ../../update.sh

# 4
echo "Задание №4"
gcc newhello.c -o hello_world
./hello_world

# end
echo "Конец"
cd ..
git add ./hello/empty
git add ./hello/newhello.c
git add ./script.sh
git commit -m "добавлены empty и newhello.c"
git push
cd ..