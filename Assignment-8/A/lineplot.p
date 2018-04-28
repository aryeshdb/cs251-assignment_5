set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

#set format y "10^{%L}"
set format x "10^{%L}"
set xlabel "No. of Elements"
set ylabel "Average Execution Time"
set yrange[0:]
set xrange[0:]
set ytic auto
set xtic auto

set key top right

set output "lineplt.eps"
plot 'lineplt.out' using 1:($2) title "Threads-1" with linespoints, \
     '' using 1:($3) title "Threads-2" with linespoints pt 5 lc 4,\
     '' using 1:($4) title "Threads-4" with linespoints lc 3,\
     '' using 1:($5) title "Threads-8" with linespoints lc 5,\
     '' using 1:($6) title "Threads-16" with linespoints lc 6
  
set key top right
#set output "musage_single_line.eps"
#plot 'usage.out' using 1:($2/256) title "Application 1" with lines lw 2
