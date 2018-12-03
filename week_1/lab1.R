# calculate

#1.1
sum(1+2*(3+4))
sum(4^3 + 3^(2+1))
sqrt((4+3)*(2+1))
((1+2)/(3+4))^2


#1.2
((2+3)-4)
((2+(3*4)))
(2/3/4)
2^3^4


#1.3
(1+(2*3^4))/((5/6)-7)


#1.4
(0.25-0.2)/(sqrt(0.2*((1-0.2)/100)))


a<-2
b<-3
c<-4
d<-5

mul<- a*b*c*d
mul


rivers  #1770


library(UsingR)
exec.pay
max(exec.pay)


mean(exec.pay)  #59.88
min(exec.pay)
max(exec.pay)


meann<- mean(exec.pay)
meann
meantrim<- mean(exec.pay, trim = 0.10)
meantrim
meanDiff<- meann - meantrim
meanDiff



Orange
#Tree , age, circumference


mean(Orange$age)


max(Orange$circumference)


x<- c(1,3,5,7,9)
y<- c(2,3,5,7,11,13)
x+1
y*2
length(x)
length(y)
x+y
sum(x>5)
sum(x[x>5])
sum(x>5|x<3)
y[3]
y[-3]
y[x]
y[y>=7]

save.image("Lab1.RData")
load("Lab1.RDATA")

