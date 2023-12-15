clear
cd lab8

echo "Задание"
gcc -o mutexAssembler mutexAssembler.c -pthread
#./mutexAssembler

# end
echo "Конец"
cd ..
git add ./lab8/script.sh
git add ./lab8/mutexAssembler.c
git commit -m "добавлен mutexAssembler.c"
git push
cd ..