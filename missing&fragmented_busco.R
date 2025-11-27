library(ggplot2)
library(dplyr)
library(tidyr)
setwd("/Users/MUSKAN/OneDrive")
getwd()

list.files()
busco_data <- read.csv("busco_data.csv")
colnames(busco_data)

busco_m <- busco_data %>% 
  select(Genotype, Missing.genes, Fragmented.genes)


library(tidyr)
library(ggplot2)

# Convert to long format
busco_long_m <- busco_m %>%
  pivot_longer(cols = c(Missing.genes, Fragmented.genes),
               names_to = "Category",
               values_to = "Value")

# Select relevant columns
busco_m <- busco_data %>% 
  select(Genotype, Fragmented.genes, Missing.genes)

# Convert to long format
busco_long_m <- busco_m %>%
  pivot_longer(cols = c(Fragmented.genes, Missing.genes),
               names_to = "Category",
               values_to = "Value")

# Optional: rename for nicer labels
busco_long_m$Category <- recode(busco_long_m$Category,
                                Fragmented.genes = "Fragmented",
                                Missing.genes = "Missing")

# Plot with blue shades
ggplot(busco_long_m, aes(x = Genotype, y = Value, fill = Category)) +
  geom_col(position = position_dodge(width = 0.6), width = 0.45, color = "black") +
  scale_fill_manual(values = c("Fragmented" = "#2171B5",  # medium blue
                               "Missing" = "#6BAED6")) +  # light blue
  labs(title = "Fragmented and Missing BUSCO Scores Across Genotypes",
       x = "Genotype", y = "BUSCO Percentage (%)", fill = "Category") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))



