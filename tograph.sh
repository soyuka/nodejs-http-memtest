#!/bin/bash

file=$1
tail -n +8 $1 > data.csv

gnuplot <<- EOF
        set terminal png
        set output "$(basename $file .csv).png"
        set title "memory usage"
        set xlabel "time"
        set ylabel "Memory (MB)"
        set xdata time
        set timefmt "%H:%M:%S"
        set format x "%M:%S"
        set datafile separator ","
        plot "data.csv" using 1:(\$2/1024/1024) title "Used" with lines
EOF

rm data.csv
