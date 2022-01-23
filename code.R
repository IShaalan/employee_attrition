library("readxl")
library("caret")
library("rms")
#install.packages("Hmisc")
library(Hmisc)

getwd()
setwd('C:/Users/pc/Downloads/before/Advanced R project')


attrition_data <- read_excel("Attrition Sample 7.xlsx")

str(attrition_data)

desc_attrition_data <- Hmisc::describe(attrition_data)
print(desc_attrition_data)

p <- plot(desc_attrition_data)
p$Continuous

plot_example4_1 <- ggplot(attrition_data, aes(x = Age, y = Attrition)) +
  Hmisc::histSpikeg(Attrition ~ Age, lowess = TRUE, data = attrition_data) +
  labs(x = 'Age', y = 'Attrition')
plot(plot_example4_1)


dummy_data <- dummyVars(" ~ .", data = attrition_data)
one_hot_encoded <- data.frame(predict(dummy_data, newdata = attrition_data))
head(one_hot_encoded)


