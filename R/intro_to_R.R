
# Rstudio environment -----------------------------------------------------

Rstudio != R


# R as a calculator -------------------------------------------------------

3 + 4
7 * 5
6 ^ 3


# assignment --------------------------------------------------------------

All R statements where you create objects -- "assignments" -- have this form:
objectName <- value
and in my head I hear, e.g., "x gets 12".

x <- 12 
x <- 3 * 4


# data structures ---------------------------------------------------------

1. vector: sequence of data elements of the same type

c(1,2,3)
c(1,"two",3)

c(1,2,3)[2]
c(1,"two",3)[2]
c(1,"two",3)[c(1,2)]

a <- c(1,2,3)[2]
a <- c(1,"two",3)[2]

2. matrix: two-dimensional, rectangular arrangement of objects of the same type

3. list: one-dimensional group of R objects

n <- c(2, 3, 5) 
n <- c(2, "three", 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
b <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 

x <- list(n, s, b, 3) # x contains copies of n, s, b

4. factor: store predefined and categorical data

x <- factor(c("single", "married", "married", "single"))

x <- factor(c("single", "married", "married", "single"), 
            levels = c("single", "married", "divorced"))

6. data frame: a list of vectors of equal length

n <- c(2, 3, 5) 
n <- c(2, "three", 5) 
s <- c("aa", "bb", "cc") 
b <- c(TRUE, FALSE, TRUE) 

data.frame(n, s, b)
data.frame(n = c(2, 3, 5), s = c("aa", "bb", "cc"), b = c(TRUE, FALSE, TRUE))
data.frame(n = c(2, 3, 5), s = c("aa", "bb", "cc"), b = c(TRUE, FALSE, TRUE), z = 4)
data.frame(n = c(2, 3, 5), s = c("aa", "bb", "cc"), b = c(TRUE, FALSE, TRUE), z = c(4, 8))

ourFrame <- data.frame(n = c(2, 3, 5),
                       s= c("aa", "bb", "cc"),
                       b = c(TRUE, FALSE, TRUE),
                       z = 4)

class(ourFrame)
str(ourFrame)
names(ourFrame)

ourFrame$n
ourFrame$s
ourFrame$b
ourFrame$n[2]


# functions ---------------------------------------------------------------

functionName(arg1 = val1, arg2 = val2, and so on)

Let us try using the sequence function:
seq(1, 10)

try it with assignment
y <- seq(1, 10)

Not all functions have (or require) arguments:
date()

nesting functions:
mean(seq(1:10))
round(mean(seq(1:10)), 0)


# build your own ----------------------------------------------------------

convert farenheit to Kelvin:
  
  fahr_to_kelvin <- function(temp) {
    kelvin <- ((temp - 32) * (5 / 9)) + 273.15
    return(kelvin)
  }

fahr_to_kelvin(32)

waterFreezesKelvin <- fahr_to_kelvin(32)
