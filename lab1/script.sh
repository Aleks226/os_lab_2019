cd lab1
# 1
cd src
#./background.sh &
touch empty # написал в файле empty "Something in file! ;)"
cat empty
# clear
wc empty -c
# 2
grep "cake" cake_rhymes.txt > with_cake.txt
rm file.txt &> /dev/null
# 3
chmod u+x ./hello.sh
bash ./hello.sh
touch path.sh # написал скрипт
bash ./path.sh
# 4
touch average.sh # написал скрипт
touch numbers.txt
touch generate.sh # написал скрипт
bash ./generate.sh
bash ./average.sh < ./numbers.txt
# end
cd ..
git add ./src/average.sh
git add ./src/generate.sh
git add ./script.sh
git commit -m "добавлен average.sh и generate.sh"
git push
cd ..