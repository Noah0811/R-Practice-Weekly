#Lab 6

#loading file:
ecls <- read.csv("Lab_06_ecls.csv")
#ecls <- read.csv(file="/Users/Administrator/Desktop/Intro to R/Lab_06_ecls.csv")
#ecls <- read.csv(file = file.choose()) open up a browser

# Once you have successfully loaded the .csv file into R, you might wish to save it as an .Rdata file
# somewhere convenient so that the next time you want to access these data, you only have
# to open the .Rdata file instead of loading the .csv.
save(ecls, file = "/Users/Administrator/Desktop/Intro to R/Lab_06_ecls.Rdata")

#Question 1
#a
plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores")

#b 
plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",col="red",pch=0)
# plot with open red squares

#c
plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",pch=16,cex=0.5)
# plot with points as filled black circles of half size relative to the default size


#rgb
rgb(red = 1/5, green = 3/5, blue = 4/5)

#d
plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",col=rgb(red = 1/5, green = 3/5, blue = 4/5),pch=17)
#plot with solid triangles that are specified to be the color defined above using rgb().

#e
plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",col=rgb(red = 0.396, green = 0.263, blue = 0.129,alpha=0.5),pch=19)
# plot with solid brown circles with 5% transparency

#f
color<- c()
num <-1
for ( i in 1:length(ecls$F5SPECS)){
  ifelse(ecls$F5SPECS[i] == 1,color[num]<-rgb(1,0,0,1),color[num]<-rgb(0,0,1,.2))
  num<-num+1
}

# for ( i in 1:length(ecls$F5SPECS)){
#   ifelse(ecls$F5SPECS[i] == 1,color[i]<-rgb(1,0,0,1),color[i]<-rgb(0,0,1,.2))
# }

plot(ecls$MIRT,ecls$C6R4MSCL,type="p",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",pch=19,col=color)
#ecls$F5SPECS == 1,col=rgb(1,0,0,1)  w/ special education, red solid circles 
#ecls$F5SPECS == 0 col=rgb(0,0,1,.2) no special education, blue solid circles with 20% transparency

#g
plot(ecls$MIRT,ecls$C6R4MSCL,type="n",xlab="Kindergarten Math Score",ylab="Fifth Grade
Math Score",main="Scatterplot of ECLS Math Scores",pch=19,col=color)

library(dplyr)
ecls_spec<-ecls%>%
  filter(F5SPECS == 1)
ecls_non_spec<-ecls%>%
  filter(F5SPECS == 0)

points(ecls_non_spec$MIRT,ecls_non_spec$C6R4MSCL,pch=19,col=rgb(0,0,1,.2))
points(ecls_spec$MIRT,ecls_spec$C6R4MSCL,pch=19,col=rgb(1,0,0,.3))

#Question 2
#a
t1<-table(ecls$P1HMAFB)

#b
barplot(t1,xlab = "Mother¡¯s Age at First Birth",main = "Barplot of ECLS Mothers¡¯ Ages at First
Birth")

#c
t2<-table(ecls$P1FSTAMP,ecls$P1HMAFB)
barplot(t2,col=c("blue","green"))

#d
t2<-table(ecls$P1FSTAMP,ecls$P1HMAFB)
barplot(t2,col=c("blue","green"),legend.text=c("No Food Stamps","Food Stamps"))
``




