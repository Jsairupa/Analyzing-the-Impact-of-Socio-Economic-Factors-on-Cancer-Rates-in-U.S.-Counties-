library(readxl)
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")

summary(cancer_data)  # Check for missing values
cancer_data <- na.omit(cancer_data)  # Remove rows with NA values

library(dplyr)
state_summary <- cancer_data %>%
  group_by(State) %>%
  summarise(
    Mean_Income = mean(medIncome, na.rm = TRUE),
    Median_Income = median(medIncome, na.rm = TRUE),
    SD_Income = sd(medIncome, na.rm = TRUE),
    Mean_Poverty = mean(PovertyEst, na.rm = TRUE),
    Median_Poverty = median(PovertyEst, na.rm = TRUE),
    SD_Poverty = sd(PovertyEst, na.rm = TRUE),
    Mean_CancerRate = mean(incidenceRate, na.rm = TRUE),
    Median_CancerRate = median(incidenceRate, na.rm = TRUE),
    SD_CancerRate = sd(incidenceRate, na.rm = TRUE)
  )


ggplot(state_summary, aes(x = reorder(State, -Mean_CancerRate), y = Mean_CancerRate)) +
  geom_bar(stat = "identity", width = 0.7) +  # Adjust bar width to create space between bars
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 8),  # Rotate and adjust text size
        plot.title = element_text(size = 14)) +  # Adjust title text size
  scale_y_continuous(labels = scales::comma) +  # Format y-axis labels
  labs(title = "Average Cancer Rate by State",
       x = "State",
       y = "Average Cancer Rate per 100K")


