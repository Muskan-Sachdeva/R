# Load library
library(ggplot2)

# Create dataframe
data <- data.frame(
  Genotype = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"),
  Genes = c(44395, 46975, 49500, 43734)
)

# Convert to factor to control order
data$Genotype <- factor(data$Genotype,
                        levels = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"))

# Plot
ggplot(data, aes(x = Genotype, y = Genes, fill = Genotype)) +
  
  geom_bar(stat = "identity", width = 0.5) +
  
  geom_text(aes(label = Genes),
            vjust = -0.5,
            size = 5,
            fontface = "bold") +
  
  scale_fill_manual(values = c("#F9DBBD",
                               "#FFA5AB",
                               "#DA627D",
                               "#A53860")) +
  
  labs(title = "Number of Genes Predicted by BRAKER",
       x = "Genotype",
       y = "Number of Predicted Genes") +
  
  theme_minimal() +
  
  theme(
    plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
    axis.title = element_text(face = "bold", size = 13),
    axis.text = element_text(face = "bold", size = 12),
    legend.position = "none",
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "white", colour = "white"),
    plot.background = element_rect(fill = "white", colour = "white")
  ) +
  
  ylim(0, 50000)

