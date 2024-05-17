library(readxl)

# Load the data
data <- read_excel("C:/Users/HP/Downloads/Cancer (1).xlsx")


# Define a function to calculate the mode
mode_function <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate the descriptive statistics for median income
mean_income <- mean(data$medIncome, na.rm = TRUE)
median_income <- median(data$medIncome, na.rm = TRUE)
mode_income <- mode_function(data$medIncome)
range_income <- diff(range(data$medIncome, na.rm = TRUE))
variance_income <- var(data$medIncome, na.rm = TRUE)
std_dev_income <- sd(data$medIncome, na.rm = TRUE)

# Calculate the descriptive statistics for poverty estimates
mean_poverty <- mean(data$PovertyEst, na.rm = TRUE)
median_poverty <- median(data$PovertyEst, na.rm = TRUE)
mode_poverty <- mode_function(data$PovertyEst)
range_poverty <- diff(range(data$PovertyEst, na.rm = TRUE))
variance_poverty <- var(data$PovertyEst, na.rm = TRUE)
std_dev_poverty <- sd(data$PovertyEst, na.rm = TRUE)

# Calculate the descriptive statistics for cancer rates
mean_incidenceRate <- mean(data$incidenceRate, na.rm = TRUE)
median_incidenceRate <- median(data$incidenceRate, na.rm = TRUE)
mode_incidenceRate <- mode_function(data$incidenceRate)
range_incidenceRate <- diff(range(data$incidenceRate, na.rm = TRUE))
variance_incidenceRate <- var(data$incidenceRate, na.rm = TRUE)
std_dev_incidenceRate <- sd(data$incidenceRate, na.rm = TRUE)

# Combine all the statistics in a list and print them
descriptive_stats <- list(
  median_income = list(
    mean = mean_income,
    median = median_income,
    mode = mode_income,
    range = range_income,
    variance = variance_income,
    std_dev = std_dev_income
  ),
  poverty_estimates = list(
    mean = mean_poverty,
    median = median_poverty,
    mode = mode_poverty,
    range = range_poverty,
    variance = variance_poverty,
    std_dev = std_dev_poverty
  ),
  cancer_rates = list(
    mean = mean_incidenceRate,
    median = median_incidenceRate,
    mode = mode_incidenceRate,
    range = range_incidenceRate,
    variance = variance_incidenceRate,
    std_dev = std_dev_incidenceRate
  )
)

print(descriptive_stats)

