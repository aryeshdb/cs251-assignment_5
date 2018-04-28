all:App runtest analyse plot report clean

#App:prog.o thread_function.o 
#	gcc prog.o thread_function.o -o App    

App:prog.c thread_function.c common.h
	gcc prog.c thread_function.c -lpthread -lm -o App

runtest: exe_gnrp.sh 
#	./exe_gnrp.sh params.txt threads.txt

exe_gnrp.sh: params.txt threads.txt
	./exe_gnrp.sh params.txt threads.txt	

analyse: analyse-1 analyse-2 analyse-3
analyse-1: analyse-1.awk log.txt
	awk -f analyse-1.awk log.txt
analyse-2: analyse-2.awk log.txt
	awk -f analyse-2.awk log.txt
analyse-3: analyse-3.awk log.txt
	awk -f analyse-3.awk log.txt

plot: plot-1 plot-2 plot-3
plot-1: scatter.p  analyse-1
	gnuplot scatter.p
plot-2: lineplot.p analyse-2
	gnuplot lineplot.p
plot-3: plot_speedup.p analyse-3
	gnuplot plot_speedup.p

report: final-report.tex plot-1 plot-2 plot-3
	pdflatex final-report.tex
	pdflatex final-report.tex
clean:
	rm -f App *.out *.eps log.txt final-report.log final-report.aux final-report.lof 
	
	
       
	
