#Lab 01-Vectors
#Zhongyuan Zhang (uni:zz2641)
#Question 1 

#(a)
fib1<-c(1,1,2,3,5,8,13,21,34,55)  #first 10 elements vector in fib1

#(b)
fib2<-c(89,144,233,377,610,987,1597,2584,4181,6765) # 11th to 20th elements in fib2

#(c)
fib3<- c(fib1,fib2) # combination of fib1 and fib2

#(d)
fib3[13:14]  #extract thee values of the 13th and 14th elements 
fib3(c(13,14)) # either way is okay but in this case, the first one looks more concise

#(e)
fib3*3 #multiply fib3 by 3, each element within the vector will all be multiplied by 3
# The behaviour is called vectorization.

#(f)
fib3*c(1,2) #multiply fib3 by the vector of c(1,2),each two elements in fib3 will be multiplied by 1 and 2 seperately in order
# the behaviour is called Recycling

#Question2 
#(a)
wait<-faithful$waiting  #pull the vector of waiting times and call it wait

#(b)
min(wait)
max(wait)
which(wait==min(wait)) #the index of the shortest wait times observed
which(wait==max(wait)) #the index of the longest wait times observed

#(c)
length(which(wait>60)) #check out with the logical vector in which to gain indexes that indicate values over 60 mins and calcualte the number by length()

#(d)
mean(wait>60)  #using mean to calculate all the booleen values within the logical vector to get the propotion

#(e)
mean(wait>=70 & wait <=80) #using mean to calculate all the booleen values within the logical vector to get the propotion

#Question 3
txt <- c("The", "licenses", "for", "most", "software", "are",
         "designed", "to", "take", "away", "your", "freedom",
         "to", "share", "and", "change", "it.",
         "", "By", "contrast,", "the", "GNU", "General", "Public", "License",
         "is", "intended", "to", "guarantee", "your", "freedom", "to",
         "share", "and", "change", "free", "software", "--",
         "to", "make", "sure", "the", "software", "is",
         "free", "for", "all", "its", "users")
#(a)
length(txt)  #length of tge vector text

#(b)
?nchar #open the help page for the function nchar()
nchar(txt)  #this function mainly checks the number of characters

#(c)
which(nchar(txt)==max(nchar(txt))) #which element of txt has the most characters(locating)
max(nchar(txt)) #the most characters
txt[which(nchar(txt)==max(nchar(txt)))] # the value with the most characters,cool! we have two

#(d)
grep(pattern="free",x=txt,ignore.case=TRUE,value=FALSE) 
#search for the positions of all elements that contain the string "free", with other arguments already set

#(e)
grep(pattern="free",x=txt,ignore.case=TRUE,value=TRUE)
#return all elements that contain the string "free", with other arguments already set

#(f)
gsub(pattern="to",x=txt,replacement = "TO") #find the string "to" and replace it with the string "TO".
gsub(pattern="to",replacement = "TO",x=txt) #it seems that as long as the argument's name is matched, the position won't matter(confirmed!)
