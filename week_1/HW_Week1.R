#1.20
data("islands")
sort(islands, decreasing=T, na.last = T)[1:7]
##[    Asia        Africa North America South America    Antarctica        Europe     Australia 
##    16988         11506          9390          6795          5500          3745          2968  ]


#1.21
library(UsingR)
data("primes")
head(primes)      
str(primes)
dim(primes)
length(primes)  #304
primes[1:100]
primes[primes<=100]
length(primes[1:100])
length(primes[primes<=100]) # 25
length(primes[primes>=100 & primes<=1000])  # 143


#1.22
data("primes")
head(primes)
head(primes[-1])  # 3  5  7 11 13 17 [It won't return 1st element (defined element) of the primes ]   
head(primes[-2])
n<- length(primes)
n
primes[-n]  #It won't return nth element of the primes
primes[-(n-1)]  #It won't return nth-1 element of the primes
primes[-1]-primes[-n]
sum(primes[-1]-primes[-n]==2)   #64


#1.23
data("treering")
length(treering)  #7980
min(treering)     #0
max(treering)     #1.908
sum(treering>1.5) #219


#1.24
data("mandms")
mandms
names(mandms)
rowSums(mandms==0)
names(which(rowSums(mandms==0)==1))   #Peanut Butter
rowMeans(mandms)
names(which(rowSums(mandms==rowMeans(mandms))==6))    # Almond , Kid Minis
max(mandms)
names(which(colSums(mandms==30)==1))      # brown
#or
names(which(colSums(mandms==max(mandms))==1))
#or
names(which(rowSums(mandms==max(mandms))==1))
names(which(colSums(mandms==max(mandms))==1))


#1.25
data("nym.2002")
head(nym.2002)
length(nym.2002$time)   #1000
fastest_time<- min(nym.2002$time)
fastest_time            #147.3333
paste(fastest_time %/% 60, round(fastest_time %% 60), sep = ":")  #2:27
slowest_time<- max(nym.2002$time)   
slowest_time    #566.7833
paste(slowest_time %/% 60, round(slowest_time %% 60), sep=":")    #9:27


#1.26
data("rivers")
head(rivers)
max(rivers)   #3710
min(rivers)   #135 


#1.27
data("uspop")
uspop
names(uspop)<- seq(1790,1970, by=10)  
# [ Time Series:
#   Start = 1790 
#   End = 1970 
#   Frequency = 0.1 
#   1790   1800   1810   1820   1830   1840   1850   1860   1870   1880   1890   1900   1910   1920   1930   1940   1950   1960   1970 
#   3.93   5.31   7.24   9.64  12.90  17.10  23.20  31.40  39.80  50.20  62.90  76.00  92.00 105.70 122.80 131.70 151.30 179.30 203.20 ]

uspop
decade<- diff(uspop)
decade
max(decade)   # 1950 to 1960 , greatest increase of 28
uspop
uspop[c(which.max(decade), which.max(decade)+1)]
max(decade)
decade
decade>0  #according to dataset, difference is incresed with each decade.

