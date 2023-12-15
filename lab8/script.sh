clear
cd lab8

# end
echo "Конец"
cd ..
git add lab8
git add ./lab8/script.sh
git add ./lab8/mutexAssembler.c
git commit -m "добавлен mutexAssembler.c"
git push
cd ..