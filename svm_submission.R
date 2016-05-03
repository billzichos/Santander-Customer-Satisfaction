library(e1071)

setwd("~/GitHub/Santander-Customer-Satisfaction")

df <- read.csv("train.csv", header = TRUE)

df.test <- read.csv("test.csv", header = TRUE)

#fit = svm(formula = TARGET ~ var3 + var15 + imp_op_var40_efect_ult1 + imp_op_var41_ult1 + ind_var1_0 + ind_var8_0 + ind_var13 + ind_var18_0 + ind_var24 + ind_var30_0 + ind_var30 + ind_var31_0 + num_var1_0 + num_var5 + num_var12 + num_var14_0 + num_var42 + saldo_var1 + saldo_var5 + delta_imp_reemb_var17_1y3 + ind_var43_recib_ult1 + num_var22_ult1 + num_med_var22_ult3 + num_meses_var5_ult3 + num_reemb_var17_ult1 + saldo_medio_var8_ult1 + var38, data = df[, c(2:ncol(df))])
#fit = svm(TARGET ~ var3 + var15 + imp_op_var40_efect_ult1 + imp_op_var41_ult1 + ind_var1_0 + ind_var8_0 + ind_var13 + ind_var18_0 + ind_var24 + ind_var30_0 + ind_var30 + ind_var31_0 + num_var1_0 + num_var5 + num_var12 + num_var14_0 + num_var42 + saldo_var1 + saldo_var5 + delta_imp_reemb_var17_1y3 + ind_var43_recib_ult1 + num_var22_ult1 + num_med_var22_ult3 + num_meses_var5_ult3 + num_reemb_var17_ult1 + saldo_medio_var8_ult1 + var38, data = df[1:50, c(2:20)])
fit = svm(TARGET ~ ., data = df[,c(2:ncol(df))])

df.test$TARGET <- predict(fit, df.test)

submission <- df.test[, c("ID", "TARGET")]

submission$TARGET[submission$TARGET<0] <- 0
submission$TARGET[submission$TARGET>1] <- 1

write.csv(submission, "submission.csv", row.names = FALSE)