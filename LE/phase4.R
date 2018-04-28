#!/usr/bin/Rscript

a = read.table("phase3.txt",header=FALSE)
a$new_column <- ((a$V3 * a$V5)+(a$V6 * a$V8)+(a$V9 * a$V11) )
b=a[,c("V1","new_column")]
write.table(x,"phase4.txt",sep="\t",row.names=FALSE)

