#Lab 03
install.packages("Matching")
library(Matching)
?lalonde
data(lalonde)

#Question 1
#a
str(lalonde)

#b
#lalonde<-lalonde[,-c(u74,u75)] #dont understand why this does not work either way
#lalonde<-lalonde[,-c("u74","u75")]
lalonde<- subset(lalonde,select=-c(u74,u75))  #dropping two colunms:u74,u75

#c
mean(lalonde$re74==0) #proportion of the 445 participants had $0 income at baseline:0.7325843

#d
sum(lalonde$married[which(lalonde$treat==1)]==1)
#35 participants in the treated group are married
sum(lalonde$married[which(lalonde$treat==0)]==1)
#40 participants in the control group are married
mean(lalonde$married[which(lalonde$treat==1)]==1)
#0.1891892 in the treated group are married
mean(lalonde$married[which(lalonde$treat==0)]==1)
#0.1538462 in the treated group are married

#e
lalondeT<-lalonde[which(lalonde$treat==1),]  #treat cases
lalondeC<-lalonde[which(lalonde$treat==0),]  #control cases

#f
apply(lalondeT,2,mean)  #column means for the treated cases
#same types of data  num== int?
apply(lalondeC,2,mean)  #column means for the control cases

#g
by(data = lalonde,
   INDICES = lalonde$treat,
   FUN = apply,
   2, mean)
#What is the purpose of the arguments 2 and mean on the last line of the call to by()?
#arguments 2 requires a factor or a list of factors input, helping to groupby the data into different categories.
#mean on the last line is actually one of the agruments aligned with function apply(),indicating to apply mean() vertically on the columns

#Question 2
#a
lm(treat~re78,lalonde) #a linear regression model of the outcome, re78, on the treatment group indicator, treat.
summary(lm(treat~re78,lalonde))

#b
str(lalonde)
plot(lalonde$treat,lalonde$re78,xlab="Treat or Control",ylab="Revernue in 1978") #a scatterplot with 1978 annual earnings on the vertical axis and treatment group on the horizontal axis

#c
?boxplot()
boxplot(re78~treat,lalonde, horizontal=TRUE)

#Question 3
#a
table(lalonde$treat)#one-way tables of the treatment status variable

#b
table(lalonde$married) #one-way tables of the marital status variable

#c
t1<-table(lalonde$treat,
          lalonde$married) #a two-way table of the treatment variable by the marital status variable

#d
?margin.table() #For a contingency table in array form, compute the sum of table entries for a given index
margin.table(t1,margin=1)

#e
margin.table(t1,margin=2) #by columns

#f
p1<-prop.table(t1,margin=1)
p1  #the answers are the same
