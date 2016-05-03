df <- read.csv("train.csv", header = TRUE)

df.test <- read.csv("test.csv", header = TRUE)

df.test$TARGET <- 0.03957

submission <- df.test[, c("ID", "TARGET")]

write.csv(submission, "submission.csv", row.names = FALSE)

fit <- lm(TARGET ~ ., df)

df.test$TARGET <- predict(fit, df.test)

submission <- df.test[, c("ID", "TARGET")]

submission$TARGET[submission$TARGET<0] <- 0
submission$TARGET[submission$TARGET>1] <- 1

write.csv(submission, "submission.csv", row.names = FALSE)

stepModel <- step(fit, k=log(nrow(df)))
summary(stepModel)