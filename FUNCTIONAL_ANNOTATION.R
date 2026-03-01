library(ggplot2)

# Create dataframe
data <- data.frame(
  Genotype = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"),
  Annotation_Percentage = c(87.7, 86.35, 88.70, 88.37)
)

# Factor order control
data$Genotype <- factor(data$Genotype,
                        levels = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"))

# Plot
ggplot(data, aes(x = Genotype, y = Annotation_Percentage, fill = Genotype)) +
  
  geom_bar(stat = "identity", width = 0.5) +
  
  geom_text(aes(label = paste0(Annotation_Percentage, "%")),
            vjust = -0.5,
            size = 5,
            fontface = "bold") +
  
  scale_fill_manual(values = c("#BB8588",
                               "#D8A48F",
                               "#EFEBCE",
                               "#D6CE93")) +
  
  labs(title = "Percentage of Functionally Annotated Genes",
       x = "Genotype",
       y = "Functional Annotation (%)") +
  
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
  
  ylim(0, 100)

