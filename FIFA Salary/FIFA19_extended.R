setwd("D:/_College/Github/FIFA 19/archive")

library(car)


data <- read.csv(file="cleaned1.csv", header=TRUE, sep=",")
data

colnames(data)


#################Linear Model considering Value as target variable######################

fullFit = lm(Value ~ ., data=data)
summary(fullFit)

#dropping below columns because the values were coming as NA after fitting into the model
#ST,RS,CF,RF,RW, CAM, RAM, CM, RCM, RM, CDM, RDM, RWB, CB, RCB, RB, Position_ST

data = subset(data, select = -c(ST,RS,CF,RF,RW, CAM, RAM, CM, RCM, RM, CDM, RDM, RWB, CB, RCB, RB, Position_ST, Body_Type_C..Ronaldo, Body_Type_Messi, 
                                Body_Type_Neymar, Body_Type_PLAYER_BODY_TYPE_25, Body_Type_Shaqiri, Body_Type_Stocky))

fullFit = lm(Value ~ ., data=data)
summary(fullFit)

vif(fullFit)


#dropping the columns iteratively by checking the VIF values
#columns having highest value of VIF is dropped first.


data = subset(data, select = -c(Special))
data = subset(data, select = -c(LCB))
data = subset(data, select = -c(LDM))
data = subset(data, select = -c(LW))



data = subset(data, select = -c(LB))
data = subset(data, select = -c(LAM))


data = subset(data, select = -c(LF))
data = subset(data, select = -c(LM))


data = subset(data, select = -c(LWB))
data = subset(data, select = -c(LS))
data = subset(data, select = -c(LCM))
data = subset(data, select = -c(StandingTackle))
data = subset(data, select = -c(Overall))

fullFit = lm(Value ~ ., data=data)
summary(fullFit)

vif(fullFit)


#checking the value of significance of the variables and dropping according to it.

#When target variable is release clause
#data = subset(data, select = -c(Age, Preferred_Foot, Skill_Moves, Weight, Finishing, HeadingAccuracy, ShortPassing, 
 #                               Volleys, LongPassing, BallControl, Acceleration, SprintSpeed, Balance, ShotPower, 
  #                               Jumping, Strength, LongShots, Aggression, Interceptions, Positioning, Vision, Penalties, 
   #                             GKDiving, GKKicking, GKPositioning, AWR, DWR, Position_CAM, Position_CB, Position_CF, 
    #                            Position_CM, Position_LAM, Position_LB, Position_LCB, Position_LCM, Position_LDM, Position_LM, 
     #                           Position_LW, Position_LWB, Position_RB, Position_RCB, Position_RCM, Position_RDM, Position_RM, 
      #                           Position_RS, Position_RW, Position_RWB, Body_Type_Akinfenwa, Body_Type_Lean, Body_Type_Neymar, 
       #                         Body_Type_Normal, Body_Type_PLAYER_BODY_TYPE_25, Body_Type_Shaqiri))





#target variable is Value

data = subset(data, select = -c(Age, Preferred_Foot, Weight, Finishing, HeadingAccuracy, Volleys, 
Curve, LongPassing, SprintSpeed, 
ShotPower, LongShots, Aggression, Penalties, GKHandling, GKKicking, 
GKReflexes, AWR, DWR, Position_CAM, Position_CB, Position_CF, Position_LAM, Position_LCB, Position_LCM, Position_LDM, 
Position_LF, Position_LM, Position_LW, Position_RAM, Position_RCM, Position_RF, 
Position_RM, Position_RW, Body_Type_Akinfenwa, Body_Type_Lean, Body_Type_Normal))


      
dim(data)

####################Regression######################

target = lm(Value ~ 1, data=data)
target

test = lm(Value ~ ., data=data)
test


forward = step(target, scope = list(lower=target, upper=test), direction="forward")
summary(forward)


backward = step(test, direction="backward")
summary(backward)

colnames(data)

CKStep = step(target, scope = list(upper=test), direction="both")
CKStep
summary(CKStep)

write.csv(data,'D:/_College/Github/FIFA 19/archive/cleaned2.csv',  row.names = FALSE)


#################PCA######################

colnames(data)
dim(data)
str(data)


library(psych)
library(REdaS)
library(dplyr)
library(factoextra)

KMO(data)
#As the value is 0.88 which says that the sample size is adequate to perform PCA

bart_spher(data)
#As p-value is less than 0.05 which states that factor analysis will be useful for this data
  
pca1 = prcomp(data, center = T, scale = T)
pca1
plot(pca1)
abline(1, 0)
summary(pca1)
round(pca1$rotation, 2)



p1 = psych::principal(data, rotate = "varimax", nfactors = 38, scores = TRUE)
p1
summary(p1)


print(p1$loadings, cutoff = 1, sort = T)

p1$values > 1

#14 components have eigen values more than 1


scores = p1$scores
table(p1$values > 1)

summary(scores)

pca1 %>% fviz_eig()
