
# Question 1:
funn <- function(x){
     if(x<1){
     y <- (5/((x-1)^2))
    print(y) 
  }
    if(x==1){
    y<- 2
    print(y)
  }
    if(x>1){
    y <- (5/((x-1)^3))
    print(y)
    }
}

funn(1)
# [1] 2
funn(10)
# [1] 0.006858711
funn(0.3)
# [1] 10.20408


# Question 2:
fib <- function(n) {
   a = 0
   b = 1
  current = 2
  
      if(n <= 0) {
        print("Enter a +ve integer")
        }
  else if(n == 1) {
         print("Fibonacci seq Nth value:")
       print(a)
       } 
  else if(n == 2) {
      print("Fibonacci seq Nth value:")
      print(b) 
      }
    else{
          while(current < n) {
          num = a + b
          a=b
          b=num
          current = current +1 
      }
      print("Fibonacci sequence Nth value:")
      print(num)
    }
}

fib(1)
# [1] "Fibonacci sequence nth value:"
# [1] 0
fib(2)
# [1] "Fibonacci sequence Nth value:"
# [1] 1
fib(100)
# [1] "Fibonacci sequence Nth value:"
# [1] 2.18923e+20   



# Question 3:
S1 = c(1,3,5,7)
S2 =c(2,4,6,10)
c(rbind(S1, S2))
# [1]  1  2  3  4  5  6  7 10



# Question 4:
part <- function(pivot,vect){
     p1 <- vect[vect < pivot | vect == pivot]
     p2 <- vect[vect > pivot]
   return(list(p1,p2))
  }
part(6,c(1, 5, 3, 7, 9, 6, 4, 2, 10, 8)) 
# [[1]]
# [1] 1 5 3 6 4 2
# [[2]]
# [1]  7  9 10  8

part(50,sample(1:100, 100, replace=FALSE))        
# [[1]]
# [1] 39 45 26 49 32 28 43 13  9  6 35 29 12 40 48  3 19  2 16 27 44  7  1 10  5 24 18 47 20 23 41 34 50 22  4 37  8 46 11 38 30 25 15 14
# [45] 33 31 36 21 42 17

# [[2]]
# [1]  94  86  73  82  60  63  77  78  93  67  79  89  58  54  87  97  84 100  92  55  56  88  74  64  71  52  90  68  70  72  81  91  59
# [34]  57  76  85  61  53  98  83  99  66  62  80  96  69  51  75  95  65