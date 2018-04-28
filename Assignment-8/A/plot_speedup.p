#set terminal postscript eps enhanced color size 3.9,2.9
set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "bargraph.eps"

#set format x "10^{%L}"
set key font ",22"
set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set format x "10^{%L}"
set xlabel "No. of Elements"
set ylabel "Average SpeedUp"
set yrange[0:]
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border
plot 'bargraph.out' u 2:xticlabels(1) title "Threads-1",\
'' u 3 title "Threads-2" fillstyle pattern 7,\
'' u 4 title "Threads-4" fillstyle pattern 12,\
'' u 5 title "Threads-8" fillstyle pattern 14,\
'' u 6 title "Threads-16" fillstyle pattern 15
#set terminal postscript eps enhanced color size 3.9,2.9
#set output "speedup_color.eps"
#plot 'speedup.out' u 2:xticlabels(1) title "Baseline",\
#'' u 3 title "Policy(A)" fillstyle pattern 7,\
#'' u 4 title "Policy(B)" fillstyle pattern 12,\
#'' u 5 title "Policy(C)" fillstyle pattern 14

set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set output "errorbar.eps"
set xtics rotate by -45
set style histogram errorbars lw 3
set style data histogram

plot 'bargraph.out' u 2:7:xticlabels(1) title "Threads-1",\
'' u 3:8 title "Threads-2" fillstyle pattern 7,\
'' u 4:9 title "Threads-4" fillstyle pattern 12,\
'' u 5:10 title "Threads-8" fillstyle pattern 14,\
'' u 6:11 title "Threads-16" fillstyle pattern 15
