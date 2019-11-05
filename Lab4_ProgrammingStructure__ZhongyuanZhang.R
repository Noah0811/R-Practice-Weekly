#Lab 04

# Read in the text for Alice in Wonderland
aiw <- readLines(con = "https://www.gutenberg.org/files/11/11-0.txt",encoding="UTF-8")
# Set it up as a list with one word per element.
aiw <- as.list(strsplit(paste(aiw, collapse = " "), split = " ")[[1]])

#Question 1
#a
grep(pattern="ALICE",aiw,ignore.case = FALSE)
grep(pattern="ADVENTURE",aiw,ignore.case = FALSE)
grep(pattern="Lewis",aiw,ignore.case = FALSE)  
#these three words should be closely connected, thus we noted that the text started at index 115

alice_starter<-115

grep(pattern="days.",aiw,ignore.case = FALSE) #estimated that the  legal boilerplate cannot contain too many characters, thus the second index returned would be the ending index of the whole text
alice_end<-28490
aiw2<-aiw[alice_starter:alice_end]
length(aiw2) #match the answer that aiw2 has 28376 elements


#b
grep(pattern="[[:upper:]]",aiw2,value = TRUE) #checking on what the result look like
mean(grepl(pattern="[[:upper:]]",aiw2)) 
#12.57753% of the words in the book (i.e., use aiw2) contain at least one uppercase letter.

#c
grep(pattern="[[:punct:]]",aiw2,value = TRUE) #checking on what the result look like
mean(grepl(pattern="[[:punct:]]",aiw2))
#22.2512% of the words in the book (i.e., use aiw2) contain some form of punctuation

#d
mushrooms<-grep("mushroom",aiw2) # 8 indexes in this vector
for (i in mushrooms) {
  a<-i-10
  b<-i+11
  print(paste(unlist(aiw2[a:b]),sep="",collapse = " "))
} #print ten words to the left and ten to the right of the word mushroom as a single character string
  #And find the two last lines indicateing that Alice ate mushrooms
mushrooms[c(7,8)] #We get 14489 & 16910
print(paste(unlist(aiw2[14479:14500]),sep="",collapse = " "))
print(paste(unlist(aiw2[16900:16921]),sep="",collapse = " "))
#Question 2
#a
f1 <- function(a=1,b=2) {
  output<-a+b
  output
}

#b
f1() #function with no arguments and show that it behaves based on default values:3

#c
f1(a=15,b=-20) #it ruturns the sum of 15 and -20 as expected

#d
f1(a=15,b="yes")
#show error: Error in a + b : non-numeric argument to binary operator

#e
f2 <- function(a=1,b=2) {
  if (is.character(a)==FALSE & is.character(b)==FALSE) {
    f1(a,b)
  } else {print("Error: only numeric and logical arguments accepted")}
}

#f
f2() #with no arguments and show that it behaves based on default values:3

#g
f2(a=15,b=-20) #it ruturns the sum of 15 and -20 as expected since neither of the arguments is characeter.

#h
f2(a=15,b="yes") #print out the error I wrote.

#Question3
#a 
for (i in 1:200) {
  print(i^2)
}  #the first 200 perfect squares

#b 
i<-0
while(i^2<2000){
  print(i^2)
  i<-i+1} #print the perfect squares less than 2000

#c
set.seed(4233) # set the random seed for reproducibility
vec1 <- sample(x = 0:9, size = 1000, replace = TRUE)

check <- function(arg) {if (arg%%2==0){0} else{1}
}
#solution 1 Run the function on vec1
application<-unlist(lapply(vec1, FUN = check))
1-mean(application)   # proportion: even .493 
1000-sum(application) #even number: 493

#solution 2 Run the function on vec1
odd_even_vec<-c(NULL)
count_num<-1
for (i in vec1 ) {odd_even_vec[count_num]<-check(i)
count_num<-count_num+1  
}

num_even<-1000-sum(odd_even_vec) # number of even number :493
mean(odd_even_vec)
1-mean(odd_even_vec) # proportion: even .493 , odd .507
table(odd_even_vec) #even number: 493,odd number: 507

#BONUS
even_count<-0
for (i in vec1) {if (i%%2==0) {even_count<-even_count+1}
  
}
print(even_count)  #even number: 493




