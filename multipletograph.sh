#!/bin/bash

cluster1=$1
cluster2=$2
cluster3=$3
cluster4=$4

tail -n +8 $1 > data1.csv
tail -n +8 $2 > data2.csv
tail -n +8 $3 > data3.csv
tail -n +8 $4 > data4.csv

gnuplot <<- EOF
        set terminal png
        set output "$(basename $1 .csv).png"
        set title "memory usage"
        set xlabel "time"
        set ylabel "Memory (MB)"
        set xdata time
        set timefmt "%H:%M:%S"
        set format x "%M:%S"
        set datafile separator ","
        plot "data1.csv" using 1:(\$2/1024/1024) title "Cluster1" with lines, "data2.csv" using 1:(\$2/1024/1024) title "Cluster2" with lines, "data3.csv" using 1:(\$2/1024/1024) title "Cluster3" with lines, "data4.csv" using 1:(\$2/1024/1024) title "Cluster4" with lines
EOF

rm data1.csv
rm data2.csv
rm data3.csv
rm data4.csv
