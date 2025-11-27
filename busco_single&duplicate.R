library(tidyr)
library(ggplot2)
library(dplyr)
setwd("/Users/MUSKAN/OneDrive")
getwd()

list.files()
busco_data <- read.csv("busco_data.csv")
colnames(busco_data)

busco_long <- data.frame(
  Genotype = rep(busco_c$Genotype, each = 2),
  Category = c(rbind(
    rep("Single-Copy", nrow(busco_c)),
    rep("Duplicated", nrow(busco_c))
  )),
  Value = c(t(busco_c[, c("Single.Copy.genes", "Duplicated.genes")]))
)


ggplot(busco_long, aes(x = Genotype, y = Value, fill = Category)) +
  geom_col(position = position_dodge(width = 0.6), width = 0.45, color = "black") +
  scale_fill_manual(values = c("Single-Copy" = "#08519C", "Duplicated" = "#6BAED6")) +
  labs(title = "Single-Copy and Duplicated BUSCO Scores Across Genotypes",
       x = "Genotype", y = "BUSCO Percentage (%)", fill = "Category") +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))

