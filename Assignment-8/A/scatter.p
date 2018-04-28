set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set format x "10^{%L}"
set xlabel "No. of Elements"
set ylabel "Execution Time"
set yrange[0:]
set xrange[0:]
set ytic auto
set xtic auto

set key top right
set output "sctplt-1.eps"
plot 'td-1.out' using 1:2 title "Threads-1" with points pt 1 ps 1.5

set key top right
set output "sctplt-2.eps"
plot 'td-2.out' using 1:2 title "Threads-2" with points pt 1 ps 1.5

set key top right
set output "sctplt-3.eps"
plot 'td-3.out' using 1:2 title "Threads-4" with points pt 1 ps 1.5

set key top right
set output "sctplt-4.eps"
plot 'td-4.out' using 1:2 title "Threads-8" with points pt 1 ps 1.5

set key top right
set output "sctplt-5.eps"
plot 'td-5.out' using 1:2 title "Threads-16"  with points pt 1 ps 1.5

