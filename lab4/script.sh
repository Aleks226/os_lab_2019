clear
cd lab4/src

# 1
echo "Задание №1-3"
make all
./parallel --seed "2" --array_size "8" --pnum "4" --time "10"
make clean

# 4
echo "Задание №4"


# 5
echo "Задание №5"


# end
echo "Конец"
cd ..
git add ./src/makefile
git add ./script.sh
git commit -m "добавлен makefile"
git push
cd ..