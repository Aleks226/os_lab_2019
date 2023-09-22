cd lab0
# 2
mkdir hello
cd hello
touch empty
cp ../src/hello.c hello.c
mv hello.c newhello.c
# 3
sh ../../update.sh
# 4
gcc newhello.c -o hello_world
# end
cd ..
git add ./hello/empty
git add ./hello/newhello.c
git add ./script.sh
git commit -m "добавлен empty и newhello.c"
git push
cd ..