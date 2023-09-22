while read arg
do
    sum=$(($sum + $arg))
    count=$(($count + 1))
done
average=$(($sum / $count))
echo "Average: $average"
echo "Count: $count"