#Lab 2

#Question 1
#a
v1<-c(3,9,5,11,7,13)
m1<-matrix(v1,nrow=2,ncol=3,byrow = FALSE)  #matrix() function with argument byrow = FALSE

#b
v2<-c(3,5,7,9,11,13)
m2<-matrix(v2,nrow = 2,ncol = 3,byrow = TRUE) #matrix() function with argument byrow = TRUE


#c
v3<-c(3,5,7)
v4<-c(9,11,13)
m3<-rbind(v3,v4)# row combining v3,v4

#d
v5<-c(3,9)
v6<-c(5,11)
v7<-c(7,13)
m4<-cbind(v5,v6,v7)  #column combining v5,v6,v7

#e
rownames(m4)<-c("1","2")
colnames(m4)<-c("col1","col2","col3") #naming rows and columns

#question2
#a
?volcano
#Maunga Whau (Mt Eden) is one of about 50 volcanos in the Auckland volcanic field. This data set gives topographic information for Maunga Whau on a 10m by 10m grid.
filled.contour(volcano) #heatmap visualization of the topography

#b
dim(volcano) #assess the dimension of the matrix

#c
volcano[5,10] #5th row, 10th column

#d
which(volcano==max(volcano),arr.ind = TRUE) #position of the highest point
max(volcano) #highest point
which(volcano==min(volcano),arr.ind = TRUE) #position of the lowest point
min(volcano) #highest point

#e
which(volcano==max(volcano),arr.ind = TRUE)+c(-1) 
which(volcano==max(volcano),arr.ind = TRUE)+c(1)
volcano[19:21,30:32]  #using indexing to create a 3 by 3 grid around the highest value

#f
round(apply(X=volcano,MARGIN = 2,FUN = var)) #round the variances after applying var function across the columns
#Based on the contour plot and what you know about variances, does the pattern of
#increase and decrease in the columns variances make sense with these data? Why?
#Yes, the pattern of increase and decrease in the columns variance makes sense with the data since the variance results indicate a increase first and decrease later pattern. 


#Question 3
load(url("http://www.columbia.edu/~bsk2131/list3.Rdata"))
list3
#a
length(list3)  #length of the list

#b
list3[[1]]
list3[[2]] #the first and second elements of the list

#c
dim1<- lapply(X= list3,FUN= dim) #lapply() function along with dim to get the dimensions of every matrix in the list.

#d
dim2<- sapply(X= list3,FUN= dim, simplify= TRUE) #sapply() function along with dim and specify simplify = TRUE.

#e
dim1 #list of 100 elements within which there are 2 attributes
dim2 # column combining vectorof attributes into matrix

#f
which(dim2[1,]==apply(X=dim2,MARGIN = 1,FUN= max)[1])
# the matrix with the most rows is at 1st row, 40th column within the dim2 40th in the list3
