u.data <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.data", header=FALSE)
u.user <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.user", sep="|", header=FALSE)
u.item <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.item", sep="|", header=FALSE, quote="\"")

u.genre <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.genre", sep="|", header=FALSE)  ##incomplete list
u.info <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.info", sep="", header=FALSE)  ##summary of data; #users, #movies, #ratings
u.occupation <- read.table("C:/Users/User/Desktop/Capstone/ml-100k/u.occupation", sep="|", header=FALSE)##not useful, list of occupations

ratings0 <- u.data
movies0 <- u.item
userdemo <- u.user

names(ratings0)  ##u.data
colnames(ratings0)[colnames(ratings0)=="V1"] <- "userid"
colnames(ratings0)[colnames(ratings0)=="V2"] <- "movieid"
colnames(ratings0)[colnames(ratings0)=="V3"] <- "rating"
colnames(ratings0)[colnames(ratings0)=="V4"] <- "timestamp"

anyNA(ratings0$userid)  ##FALSE
anyNA(ratings0$movieid) ##FALSE
anyNA(ratings0$rating)  ##FALSE
anyNA(ratings0$timestamp)  ##FALSE

names(userdemo)  ##u.user
colnames(userdemo)[colnames(userdemo)=="V1"] <- "userid"
colnames(userdemo)[colnames(userdemo)=="V2"] <- "age"
colnames(userdemo)[colnames(userdemo)=="V3"] <- "gender"
colnames(userdemo)[colnames(userdemo)=="V4"] <- "occupation"
colnames(userdemo)[colnames(userdemo)=="V5"] <- "zipcode"

anyNA(userdemo$userid)  ##FALSE
anyNA(userdemo$age)  ##FALSE
anyNA(userdemo$gender)  ##FALSE
anyNA(userdemo$occupation)  ##FALSE
anyNA(userdemo$zipcode)  ##FALSE

names(movies0)  ##u.item
colnames(movies0)[colnames(movies0)=="V1"] <- "movieid"
colnames(movies0)[colnames(movies0)=="V2"] <- "movietitle"
colnames(movies0)[colnames(movies0)=="V3"] <- "rdate"
colnames(movies0)[colnames(movies0)=="V4"] <- "vrdate"
colnames(movies0)[colnames(movies0)=="V5"] <- "imdburl"
colnames(movies0)[colnames(movies0)=="V6"] <- "unknown"
colnames(movies0)[colnames(movies0)=="V7"] <- "Action"
colnames(movies0)[colnames(movies0)=="V8"] <- "Adventure"
colnames(movies0)[colnames(movies0)=="V9"] <- "Animation"
colnames(movies0)[colnames(movies0)=="V10"] <- "Childrens"
colnames(movies0)[colnames(movies0)=="V11"] <- "Comedy"
colnames(movies0)[colnames(movies0)=="V12"] <- "Crime"
colnames(movies0)[colnames(movies0)=="V13"] <- "Documentary"
colnames(movies0)[colnames(movies0)=="V14"] <- "Drama"
colnames(movies0)[colnames(movies0)=="V15"] <- "Fantasy"
colnames(movies0)[colnames(movies0)=="V16"] <- "FilmNoir"
colnames(movies0)[colnames(movies0)=="V17"] <- "Horror"
colnames(movies0)[colnames(movies0)=="V18"] <- "Musical"
colnames(movies0)[colnames(movies0)=="V19"] <- "Mystery"
colnames(movies0)[colnames(movies0)=="V20"] <- "Romance"
colnames(movies0)[colnames(movies0)=="V21"] <- "SciFi"
colnames(movies0)[colnames(movies0)=="V22"] <- "Thriller"
colnames(movies0)[colnames(movies0)=="V23"] <- "War"
colnames(movies0)[colnames(movies0)=="V24"] <- "Western"

anyNA(movies0$movieid)  ##FALSE
anyNA(movies0$movietitle)  ##FALSE
anyNA(movies0$rdate)  ##FALSE
anyNA(movies0$vrdate)  ##TRUE but DONT CARE, WONT USE
anyNA(movies0$imdburl)  ##FALSE
anyNA(movies0$unknown)  ##FALSE
anyNA(movies0$Action)  ##FALSE
anyNA(movies0$Adventure)  ##FALSE
anyNA(movies0$Animation)  ##FALSE
anyNA(movies0$Childrens)  ##FALSE
anyNA(movies0$Comedy)  ##FALSE
anyNA(movies0$Crime)  ##FALSE
anyNA(movies0$Documentary)  ##FALSE
anyNA(movies0$Drama)  ##FALSE
anyNA(movies0$Fantasy)  ##FALSE
anyNA(movies0$FilmNoir)  ##FALSE
anyNA(movies0$Horror)  ##FALSE
anyNA(movies0$Musical)  ##FALSE
anyNA(movies0$Mystery)  ##FALSE
anyNA(movies0$Romance)  ##FALSE
anyNA(movies0$SciFi)  ##FALSE
anyNA(movies0$Thriller)  ##FALSE
anyNA(movies0$War)  ##FALSE
anyNA(movies0$Western)  ##FALSE

##colSums(movies0.unknown)##

###movies0[!complete.cases(movies0),]

str(movies0)

sum(movies0$unknown) ##2 DONT USE   % of ratings not % of movies 19 genres
sum(movies0$Action) ##251      8.7%
sum(movies0$Adventure) ##135   4.7%
sum(movies0$Animation) ##42    1.5%
sum(movies0$Childrens) ## 122  4.2%
sum(movies0$Comedy)  ##505     17.5%
sum(movies0$Crime)  ##109      3.7%
sum(movies0$Documentary)  ##50  1.7%
sum(movies0$Drama)  ##725       25%
sum(movies0$Fantasy) ##22       .7%
sum(movies0$FilmNoir)  ##24     .8%
sum(movies0$Horror)  ##92      3.1%
sum(movies0$Musical)  ##56     1.9%
sum(movies0$Mystery)  ##61     2%
sum(movies0$Romance)  ##247    8.5%
sum(movies0$SciFi)  ##101      3.5%
sum(movies0$Thriller)  ##251   8.7%
sum(movies0$War)  ##71         2.4%
sum(movies0$Western)  ##27     .9%
+2+251+135+42+122+505+109+50+725+22+24+92+56+61+247+101+251+71+27  ##2893  some movies qualify as multiple genres(double/triple/etc counts)
2/2893  ##0         0
251/2893  ##0.0867  8.7
135/2893  ##0.0466  4.7
42/2893  ##0.0145  1.5
122/2893  ##0.042  4.2
505/2893  ##.1745  17.5
109/2893  ##0.037  3.7
50/2893  ##0.017  1.7
725/2893  ##0.25  25
22/2893  ##0.007  .7
24/2893  ##0.008  .8
92/2893  ##0.031  3.1
56/2893  ##0.019  1.9
61/2893  ##0.02  2
247/2893  ##0.085  8.5
101/2893  ##0.0349 3.5
251/2893  ##0.0867  8.7
71/2893  ##0.024  2.4
27/2893  ##0.009  .9
+0+8.7+4.7+1.5+4.2+17.5+3.7+1.7+25+.7+.8+3.1+1.9+2+8.5+3.5+8.7+2.4+.9  ##99.5


sum(movies0$unknown)


mean(ratings0$rating)                                                        ##3.52986  half data fall between 3 and 4 (1stQ=3, 3rd quartile=4)
median(ratings0$rating)                                                      ##4
hist(ratings0$rating)
summary(ratings0$rating)

hist(userdemo$zipcode)  ######

hist(userdemo$age)
mean(userdemo$age)  ##34.05
median(userdemo$age)  ##31
min(userdemo$age)  ##7?
max(userdemo$age)  ##73
summary(userdemo$age)  ##QUALITY DATA
tiff(filename="histuserdemo$age.tiff") ##Visualization hist(Userdemo$age)
getwd()
setwd("c:/users/user/desktop/capstone")

userdemo2 <-userdemo
###userdemo2$zipcode2 <- as.factor(userdemo2$zipcode)  ##
###userdemo2$occupation2 <- as.factor(userdemo2$occupation)  ##
userdemo2$gender2 <- as.numeric(userdemo2$gender)  ##new column gender as numeric
summary(userdemo2$gender2)
str(userdemo2$gender2)
hist(userdemo2$gender2)   #####

summary(userdemo$zipcode)  ##DONT USE TOO VARIED
count(userdemo$zipcode)  ##
(5*17)+14  ##99
99+699  ##798 zipcodes for 943 users, 99(10%) have at least 2 users
99/943


movies02 <- movies0
movies02$year <-c(substr(movies0$rdate, start=8, stop=11))  ##convert release date to just year
movies02$year2 <- as.numeric(movies02$year)  ##
mean(movies02$year2)  ##XXX
hist(movies02$year, breaks=c(900,1860,1880,1900,1920,1940,1960,1980,2000, 2020))  ##
min(movies02$year2)  ##
density(movies02$year2)  ##
summary(movies02$year2)  ###DO NOT USE YEAR MOSTLY 1993-1998


summary(userdemo$gender)
670/(273+670)  ##71% Male DONT USE??
hist(userdemo3$gender2, breaks=c(0,1,2))

summary(userdemo$occupation)
79+28+7+95+67+18+32+16+7+12+51+26+9+105+66+14+12+31+196+27+45
943/21  ##AvG 44.9
79/943  ##0.08   Admin  8%
28/943  ##0.0296 Artist 3%
7/943  ##0.007   Doctor .7%
95/943  ##0.1    Educators 10%
67/943  ##0.07   Engineer 7%
18/943  ##0.019  Entertainment 2%
32/943  ##0.033  Executive 3.3%
16/943 ##0.0169  Healthcare 1.7%
7/943  ##0.007   Homemaker .7%
12/943  ##0.0127  Lawyer 1.3%
51/943  ##0.05   Librarians 5%
26/943  ##0.0275 Marketing 2.8%
9/943  ##0.009   None  0.9%
105/943  ##0.111  Other  11%
66/943  ##0.0699  Programmer  7%
14/943  ##0.0148  Retired 1.5%
12/943  ##0.0127  Salesman  1.27%
31/943  ##0.0328  Scientist 3.3%
196/943  ##0.2078  Students 21%
27/943  ##0.0286  Technician 2.9%
45/943  ##0.0477  Writers 4.8%
8+3+.7+10+7+2+3.3+1.7+.7+1.3+5+2.8+.9+11+7+1.5+1.3+3.3+21+2.9+4.8  ##99.2%


userdemo2$occupation2 <- as.numeric(userdemo2$occupation)  ##convert occupation to numeric
str(userdemo2$occupation)
summary(userdemo2$occupation)
str(userdemo2$occupation2)
summary(userdemo2$occupation2)
hist(userdemo2$occupation2)  #######


hist(userdemo3$occupation2, breaks=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22))
hist(as.factor(userdemo$occupation))###

names(userdemo2)
ratings2 <- (ratings0[, c("userid", "movieid", "rating")])  ##selected attributes to be used
userdemo3 <- (userdemo2[, c("userid", "age", "gender2", "occupation2")])
movies2 <- (movies0[, c("movieid", "Action", "Adventure", "Animation", "Childrens", "Comedy", "Crime", "Documentary", "Drama", "Fantasy", "FilmNoir", "Horror", "Musical", "Mystery", "Romance", "SciFi", "Thriller", "War", "Western")])


names(userdemo3)
names(movies2)

merge2 <- merge(ratings2, userdemo3)
merge3 <- merge(ratings2, movies2)
###merge1 <- merge(ratings2, userdemo3, movies2)
merge1 <- merge(merge2, merge3)

summary(merge1)
str(merge1)


install.packages("knitr")
library (knitr)
install.packages("RCurl")
library(RCurl)
install.packages("MASS")
library(MASS)
install.packages("leaps")
library(leaps)
install.packages("glmnet")
library(glmnet) 
install.packages("caret")
library(caret)


names(merge1)
##Stepwise Analysis
full <- lm(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western,data=merge1)
null <- lm(rating~1,data=merge1)
stepF <- stepAIC(null, scope=list(lower=null, upper=full), 
                 direction= "forward", trace=TRUE)
summary(stepF)

install.packages("mlbench")
library(mlbench)
folds<-createFolds(merge1$rating)  ##Stepwise recommended model
for (f in folds){
       train1 <- merge1[-f,] 
       test1 <- merge1[f,]}
model_mlr1 <- lm(rating~userid+movieid+age+gender2+Action+Adventure+Animation+Childrens+Comedy+Documentary+Drama+Fantasy+FilmNoir+Horror+Mystery+Romance+War+Western, data=train1)
prediction1 <- predict(model_mlr1, interval="prediction", 
                                             newdata =test1)
errors1 <- prediction1[,"fit"] - test1$rating
hist(errors1)
rmse1 <- sqrt(sum((prediction1[,"fit"] - test1$rating)^2)/nrow(test1))
rel_change1 <- 1 - ((test1$rating - abs(errors1)) / test1$rating)
pred251 <- table(rel_change1<0.25)["TRUE"] / nrow(test1)
rmse1  ##1.097871
pred251  ##0.6253375
rel_change1
model_mlr1 <- lm(rating~userid+movieid+age+gender2+Action+Adventure+Animation+Childrens+Comedy+Documentary+Drama+Fantasy+FilmNoir+Horror+Mystery+Romance+War+Western, merge1)
summary(model_mlr1)

#####
##test1$scores <- predict(as.integer(prediction1), type="response",
                       newdata=test1)
##pred<-prediction(test1$scores, test1$rating)
summary(prediction1[,"fit"])
testscores1 <- as.integer(prediction1[,"fit"])
table(testscores1, test1$rating)
##or
table(factor(testscores1, levels=min(test1$rating):max(test1$rating)),factor(test1$rating, levels=min(test1$rating):max(test1$rating)))

###
folds<-createFolds(merge1$rating)  ##ALL variables model for comparison
for (f in folds){
       train0 <- merge1[-f,] 
       test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                                             newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.088869
pred250  ##.6234
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.399-4.34
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)
table(factor(testscores1, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))

summary(test0$rating)
table(factor(test0$rating, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))

folds<-createFolds(merge1$rating)  ## no genre variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.10641
pred250  ##0.609539
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.6-3.95
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)
table(factor(testscores1, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))

folds<-createFolds(merge1$rating)  ## no genre, no occupation2 variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+age+gender2, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.097769
pred250  ##0.609539
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.6-3.97
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)

folds<-createFolds(merge1$rating)  ##No user variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.08566
pred250  ##0.6262
rel_change0
model_mlr0 <- lm(rating~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.46-4.337
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)
table(factor(testscores1, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))
##
table(factor(test0$rating, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))
summary(test0$rating)
hist(test0$rating)
hist(testscores1)
summary(testscores1)
##table(test0$ratings, test0$rating)

folds<-createFolds(merge1$rating)  ##No user or movie variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.104857
pred250  ##0.6132387
rel_change0
model_mlr0 <- lm(rating~userid+movieid, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.71-3.818
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)
table(factor(testscores1, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))

folds<-createFolds(merge1$rating)  ##no occupation model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+age+gender2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.08733
pred250  ##.6289
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.25-4.366
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)
table(factor(testscores1, levels=min(test0$rating):max(test0$rating)),factor(test0$rating, levels=min(test0$rating):max(test0$rating)))

folds<-createFolds(merge1$rating)  ##no occupation, no gender model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+age+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.092032
pred250  ##.6255374
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.384-4.33
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)

folds<-createFolds(merge1$rating)  ##no occupation, no age model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- lm(rating~userid+movieid+gender2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.093877
pred250  ##.6224378
rel_change0
model_mlr0 <- lm(rating~userid+movieid+gender2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

summary(prediction0[,"fit"])  ##2.43-4.36
testscores1 <- as.integer(prediction0[,"fit"])
table(testscores1, test0$rating)


library("knitr")
library("RWeka") # rweka 
library("kknn") # knn library



rn_train <- sample(nrow(merge1), floor(nrow(merge1)*0.8))  ##k=10
train5 <- merge1[rn_train,]
test5 <- merge1[-rn_train,]

classifier <- IBk(rating ~., data = train5,
                  control = Weka_control(K = 10))  ##8 minutes to claculate
evaluate_Weka_classifier(classifier, newdata = test5, numFolds = 10)  ##RMSE: 1.1052, 4 minutes to calculate

###table(fitted(classifier), test5$rating)

rn_train <- sample(nrow(merge1), floor(nrow(merge1)*0.8))  ##k=5
train5 <- merge1[rn_train,]
test5 <- merge1[-rn_train,]

classifier <- IBk(rating ~., data = train5,
                  control = Weka_control(K = 5))  ##8 minutes to calculate
evaluate_Weka_classifier(classifier, newdata = test5, numFolds = 10)  ##RMSE: 1.1385, 2 minutes to calculate

rn_train <- sample(nrow(merge1), floor(nrow(merge1)*0.8))  ##k=15
train5 <- merge1[rn_train,]
test5 <- merge1[-rn_train,]

classifier <- IBk(rating ~., data = train5,
                  control = Weka_control(K = 15))  ##8 minutes to calculate
evaluate_Weka_classifier(classifier, newdata = test5, numFolds = 10)  ##RMSE: 1.082, 2 minutes to calculate  ##no confusion matrix in results, can you trust results?


rn_train <- sample(nrow(merge1), floor(nrow(merge1)*0.8))  ##k=20
train5 <- merge1[rn_train,]
test5 <- merge1[-rn_train,]

classifier <- IBk(rating ~., data = train5,
                  control = Weka_control(K = 20))  ##8.5 minutes to calculate
evaluate_Weka_classifier(classifier, newdata = test5, numFolds = 10)  ##RMSE: 1.0739, 2 minutes to calculate   ##no confusion matrix in results, can you trust results?



library(mlbench)
install.packages("mgcv")
library(mgcv)                     ###GAM Attempt
folds<-createFolds(merge1$rating)  ##ALL variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}

model_mlr0 <- gam(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
summary(model_mlr0)
sqrt(mean(residuals(model_mlr0)^2))  ###1.08799 RMSE

errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.088869
pred250  ##.6234
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

folds<-createFolds(merge1$rating)  ##GAM Attempt - No user variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- gam(rating~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)

summary(model_mlr0)
sqrt(mean(residuals(model_mlr0)^2))  ###1.088736 RMSE


errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.08566
pred250  ##0.6262
rel_change0
model_mlr0 <- lm(rating~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)


##
library(mlbench)
library(MASS)                     ###MASS polr Attempt
folds<-createFolds(merge1$rating)  ##ALL variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}

model_mlr0 <- polr(as.factor(rating)~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, Hess=TRUE, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)
summary(model_mlr0)         ###AIC: 258263.08
sqrt(mean(residuals(model_mlr0)^2))  ###NaN RMSE

errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.088869
pred250  ##.6234
rel_change0
model_mlr0 <- lm(rating~userid+movieid+age+gender2+occupation2+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)

folds<-createFolds(merge1$rating)  ##MASS polr Attempt - No user variables model for comparison
for (f in folds){
  train0 <- merge1[-f,] 
  test0 <- merge1[f,]}
model_mlr0 <- polr(as.factor(rating)~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, Hess=TRUE, data=train0)
prediction0 <- predict(model_mlr0, interval="prediction", 
                       newdata =test0)

summary(model_mlr0)                  ###AIC: 258342.28
sqrt(mean(residuals(model_mlr0)^2))  ###NaN RMSE
##z<- rmse[is.nan(sqrt(mean(residuals(model_mlr0)^2)))]=NA

errors0 <- prediction0[,"fit"] - test0$rating
hist(errors0)
rmse0 <- sqrt(sum((prediction0[,"fit"] - test0$rating)^2)/nrow(test0))
rel_change0 <- 1 - ((test0$rating - abs(errors0)) / test0$rating)
pred250 <- table(rel_change0<0.25)["TRUE"] / nrow(test0)
rmse0  ##1.08566
pred250  ##0.6262
rel_change0
model_mlr0 <- lm(rating~userid+movieid+Action+Adventure+Animation+Childrens+Comedy+Crime+Documentary+Drama+Fantasy+FilmNoir+Horror+Musical+Mystery+Romance+SciFi+Thriller+War+Western, merge1)
summary(model_mlr0)
