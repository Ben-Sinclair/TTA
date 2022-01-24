#1.Write an R program to create three vectors a, b, c with 5 integers.
#Combine the three vectors to become a 3×5 matrix where each column
#represents a vector. Print the content of the matrix. Plot a graph
#and label correctly.

a <- c(1L,2L,3L,4L,5L)
b <- c(2L,4L,6L,8L,10L)
c <- c(3L,6L,9L,12L,15L)

matrix <- matrix(c(a,b,c),nrow=5,ncol=3)

print(matrix)

matplot(matrix,type="o",pch=16,col=1:3,yaxt="n",xlab="x",ylab="y")

axis(2,at=1:15,lab=seq(1:15))

title(main = "Plots of the column vectors y = column number * x", col.main="Red")


#2.Write a R program to create a Data frames which contain details of
#5 employees and display the details.  (Name, Age, Role and Length of
#service).

name <- c("Ben","Steve","Emily","Olivia","Beth")
age <- c(22L,34L,27L,39L,30L)
role <- c("Statistician","Nurse","Lecturer","Lawyer","Journalist")
length_of_service_in_months <- c(0L,36L,23L,65L,45L)

frame <- data.frame(name,age,role,length_of_service_in_months)

print(frame)


#3.Import the GGPLOT 2 library and plot a graph using the 
#qplotfunction.  X axis is the sequence of 1:20 and the y axis is the
#x ^ 2.  Label the graph appropriately.
#install.packages("ggplot2", dependencies = TRUE)

library(ggplot2)

# The function below plots x^2 for integers between xlower and xupper

xsquared <- function(xlower,xupper){
  x <- xlower:xupper
  y <- x^2
  qplot(x,y)
}

xsquared(1,20)


#4.Create a simple bar plot of five subjects

marks_for_subjects <- c(95,57,78,86,71)
subjects <- c("Maths","French","Chemistry","Physics","English")

barplot(marks_for_subjects,xlab="Subject",ylab="Percentage Mark",
        main="A bar plot of a student's mark in 5 subjects",
        names.arg=subjects,yaxt="n",col=2:6)

axis(2,at=seq(0,200,10),lab=seq(0,200,10))


#5.Write a R program to take input from the user (name and age) and
#display the values.

name <- readline("What is your name?")
age <- readline("What is your age?")

print(paste("Your name is",name,"and you are",age,"years old."))

#6.Write a R program to create a sequence of numbers from 20 to 50
#and find the mean of numbers from 20 to 50 and sum of numbers.

numbers <- seq(20,50)

mean(numbers)

sum(numbers)


#7.Write a R program to create a vector which contains 10 random
#integer values between -50 and +50

sample(seq(-50,50),10,replace=TRUE)

# replace=TRUE is used so previously chosen numbers can be
# chosen again in a random choice of 10 numbers
