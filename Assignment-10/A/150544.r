num<-50000
vec<-rexp(num,0.2)
tab1<-data.frame(x=seq(1,num,1),y=sort(vec))
plot(tab1,xlab="Vector Index",ylab="Vector Value")
title("Scatter Plot of a Random Vector generated from Exp Dist(Lambda=0.2)")

Mat<-matrix(vec,100)
#print(Mat)
for(i in 1:5){
 p<-ecdf(Mat[,i])
 q<-density(Mat[,i])
 plot(p,main=(paste("Cumulative Distribution Function of Vector ",i)),xlab="Vector Value",ylab="CDF Value")
 #title(paste("Cumulative Distribution Function of ",i," vector"))  
 plot(q,main=(paste("Probability Density Function of Vector ",i)),xlab="Vector Value",ylab="PDF Value")
}

m<-rep(0,500)
s<-rep(0,500)
#print(Mat[,1])

for(i in 1:500){
m[i] = m[i] + mean(Mat[,i])
s[i] = s[i] + sd(Mat[,i])

if(i==5){
print(paste("The mean of vector ",(1:5),": ",m[1:5]))
print(paste("The standard deviation of vector ",(1:5),": ",s[1:5]))
 
}
}

tab1 <- table(m)
str(tab1)
plot(tab1, "h", xlab="Vector Value", ylab="Frequency")
title("Frequency Distribution of Means")


 j<-ecdf(m)
 k<-density(m,na.rm=TRUE)
 plot(j,main=(paste("Cumulative Distribution Function of Means ")),xlab="Vector Value",ylab="CDF Value")
 #title(paste("Cumulative Distribution Function of ",i," vector"))  
 plot(k,main=(paste("Probability Density Function of Means ")),xlab="Vector Value",ylab="PDF Value")
#print(m)
a=mean(vec)
b=mean(m)
c=sd(vec)
d=mean(s)

print(paste("Mean of original distribution :",a))
print(paste("Mean of sample mean distribution :",b))
print(paste("Standard Deviation of original distribution :",c))
print(paste("Standard Deviation of sample mean distribution :",d))
print("The values are nearly same, hence Central Limit Theorem stands verified.")

