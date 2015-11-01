data <- read.csv("Food_Inspections.csv")

png("risk_distribution.png")
pie(table(data$Risk))
dev.off()

## First study
data$risk_num <- 0
data$risk_num[data$Risk == "Risk 1 (High)"] <- 1
data$risk_num[data$Risk == "Risk 2 (Medium)"] <- 2
data$risk_num[data$Risk == "Risk 3 (Low)"] <- 3

risk_by_zip <- table(data$Zip, data$risk_num)
xxx <- aggregate(risk_num ~ Zip, data= data, sum)
yyy <- data.frame(table(data$Zip))
names(yyy) <- c("Zip", "Freq")
zzz <- merge(xxx, yyy)
zzz$avg <- zzz$risk_num / zzz$Freq

require(ggplot2)
png("risk_distribution_after_zip_grouping.png")
plot <- ggplot(zzz, aes(x=avg)) + geom_histogram(binwidth = 0.1, aes(fill = ..count..,y = ..density..))+ scale_fill_gradient("Count", low = "green", high = "red")
plot + ggtitle("Distribution of ZIP risk level") + xlab("Risk level") + ylab("Density (Bandwith set to 0.1) of risk level over the city ZIP (1=high risk, 3=low risk)")
dev.off()
# Main improvement would be to map risk by ZIP code, to check which areas are more suitable for opening a restaurant