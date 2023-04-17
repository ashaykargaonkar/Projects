dataset <- read.csv("C:/Users/ashay/Desktop/Datasets/_Projects/house-prices-advanced-regression-techniques/Datasets/HP_dataset.csv")

dataset

colnames(dataset)


#Deleting useless variables
dataset = subset(dataset, select = -c( X)) #Deleting default index column



dataset = subset(dataset, select = -c(          BsmtCond_TA,
                                                BsmtQual_TA                   ,
                                                Foundation_Wood               ,
                                                Foundation_Slab               ,
                                                ExterCond_TA                  ,
                                                ExterQual_TA                  ,
                                                MasVnrType_Stone              ,
                                                Exterior2nd_Wd.Shng,
                                                Exterior2nd_CBlock            ,
                                                Exterior1st_WdShing           ,
                                                Exterior1st_AsphShn           ,
                                                RoofMatl_WdShngl              ,
                                                RoofMatl_Metal                ,
                                                RoofMatl_ClyTile              ,
                                                RoofStyle_Shed                ,
                                                HouseStyle_SLvl               ,
                                                BldgType_TwnhsE               ,
                                                BldgType_Duplex               ,
                                                Condition2_RRNn               ,
                                                Condition2_PosA               ,
                                                Condition1_RRNn               ,
                                                Neighborhood_Veenker          ,
                                                LandSlope_Sev                 ,
                                                LotConfig_Inside              ,
                                                Utilities_NoSeWa              ,
                                                LandContour_Lvl               ,
                                                LotShape_Reg                  ,
                                                Alley_Pave                    ,
                                                Street_Pave                   ,
                                                MSZoning_RM                   ,
                                                MSSubClass_Type9              ,
                                                GrLivArea                     ,
                                                TotalBsmtSF                   ,
                                                Electrical_SBrkr              ,
                                                CentralAir_Y                  ,
                                                HeatingQC_TA                  ,
                                                Heating_OthW                  ,
                                                BsmtFinType2_Unf              ,
                                                BsmtFinType1_Unf              ,
                                                BsmtExposure_No               ,
                                                FullBath_3                    ,
                                                BsmtFullBath_3                ,
                                                BsmtFullBath_2                ,
                                                BsmtHalfBath_2                
                                                ) )


regressor = lm(formula = SalePrice ~ ., data = dataset)

summary(regressor)



dataset = subset(dataset, select = c(LotArea, OverallQual, OverallCond, YearBuilt, YearRemodAdd, MasVnrArea, BsmtFinSF1, BsmtFinSF2,          
                                               BsmtUnfSF, FirstFlrSF, SecondFlrSF, TotRmsAbvGrd, GarageArea, WoodDeckSF, ThreeSsnPorch, ScreenPorch, PoolArea,                
                                               MoSold, MSZoning_C..all., Street_Grvl, LandContour_Bnk, LandContour_Low, Utilities_AllPub, LotConfig_CulDSac, LandSlope_Gtl,          
                                               LandSlope_Mod, Neighborhood_Edwards, Neighborhood_Mitchel, Neighborhood_NAmes, Neighborhood_NWAmes,     
                                               Neighborhood_NoRidge, Neighborhood_OldTown, Neighborhood_StoneBr, Condition1_RRAe, Condition2_PosN, RoofStyle_Flat,          
                                               RoofStyle_Gable, RoofStyle_Gambrel, RoofStyle_Hip, RoofStyle_Mansard, RoofMatl_CompShg, RoofMatl_Tar.Grv,        
                                               RoofMatl_WdShake, Exterior1st_BrkFace, ExterQual_Ex, Foundation_BrkTil, Foundation_CBlock, Foundation_PConc,        
                                               BsmtQual_Ex, BsmtExposure_Av, BsmtExposure_Gd, BsmtFinType1_LwQ, FullBath_1, FullBath_2))





regressor = lm(formula = SalePrice ~ ., data = dataset)

summary(regressor)




dataset = subset(dataset, select = -c(MSZoning_C..all.,LandContour_Bnk, LotConfig_CulDSac, BsmtExposure_Av,
                                      BsmtFinSF2            ,
                                      BsmtUnfSF,
                                      PoolArea             ,
                                      LandContour_Low ,    
                                      LandSlope_Gtl  ,    
                                      LandSlope_Mod      ,
                                      RoofMatl_CompShg  ,    
                                      RoofMatl_Tar.Grv ,    
                                      RoofMatl_WdShake
                                      ) )









write.csv(dataset, file = "C:/Users/ashay/Desktop/Datasets/_Projects/house-prices-advanced-regression-techniques/Datasets/Rout_HP.csv", row.names = FALSE)





