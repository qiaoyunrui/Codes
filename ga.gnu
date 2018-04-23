#!/usr/local/bin/gnuplot
set term pngcairo
set size ratio 0.75
set output 'ga.png'
plot "ga.log" using 1:2 title "max" with lines, \
     "ga.log" using 1:3 title "ave" with lines, \
     "ga.log" using 1:4 title "min" with lines
