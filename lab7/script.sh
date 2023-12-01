clear
cd lab7/src

echo "Запуск makefile"
#make all

#make clean


# end
echo "Конец"
cd ..
git add ./src/makefile
git add ./script.sh
git commit -m "добавлен makefile"
git push
cd ..