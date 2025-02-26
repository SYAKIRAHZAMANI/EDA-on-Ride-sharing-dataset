
library(tidyverse)
library(ggplot2)
library(DataExplorer)  # For automated EDA

# Load dataset
ride_sharing_data <- readxl::read_excel("/Users/syakirahzamani/Downloads/Ride Sharing Dataset.xlsx")

# View first six rows
head(ride_sharing_data)

# Summarize dataset (numerical & categorical)
descriptive_stats <- summary(ride_sharing_data)
print(descriptive_stats)

# Display dimensions of dataset
dataset_dimensions <- dim(ride_sharing_data)
print(dataset_dimensions)

# Identify missing values
missing_values <- colSums(is.na(ride_sharing_data))
print(missing_values)

# Visualize missing values
plot_missing(ride_sharing_data)

# Histogram of Fare Amount
ggplot(data=ride_sharing_data, aes(x=`Fare Amount (in $)`)) +
  geom_histogram(fill="steelblue", color="black", bins=30) +
  ggtitle("Histogram of Fare Amount")

# Scatterplot of Ride Distance vs. Fare Amount
ggplot(data=ride_sharing_data, aes(x=`Ride Distance (in miles)`, y=`Fare Amount (in $)`, color=`Vehicle Type`)) + 
  geom_point(alpha=0.5) +
  ggtitle("Scatterplot of Distance vs. Fare")

# Boxplot of Fare Amount grouped by Vehicle Type
ggplot(data=ride_sharing_data, aes(x=`Vehicle Type`, y=`Fare Amount (in $)`)) + 
  geom_boxplot(fill="steelblue") +
  ggtitle("Boxplot of Fare Amount by Vehicle Type")

# Correlation matrix for numerical variables
numeric_vars <- ride_sharing_data %>% select(where(is.numeric))
cor_matrix <- round(cor(numeric_vars, use="complete.obs"), 2)
print(cor_matrix)

# Pairwise scatterplots for all numerical variables
pairs(numeric_vars)

# Generate an automated EDA report 
create_report(ride_sharing_data)
