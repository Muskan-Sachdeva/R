library(ggplot2)

# Create data frame
data <- data.frame(
  Genotype = factor(c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"),
                    levels = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87")),
  Annotation_Percentage = c(93.2, 92.9, 94.1, 93.4)
)

# Plot
ggplot(data, aes(x = Genotype, y = Annotation_Percentage, fill = Genotype)) +
  
  geom_bar(stat = "identity", width = 0.6) +
  
  geom_text(aes(label = paste0(Annotation_Percentage, "%")),
            vjust = -0.4,
            size = 5,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "#CEBEBE",
    "#ECE2D0",
    "#D5B9B2",
    "#A26769"
  )) +
  
  labs(
    title = "Percentage of Genes with GO and KEGG Annotation",
    x = "Genotype",
    y = "Annotated Genes (%)"
  ) +
  
  theme_classic(base_size = 14) +
  
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 15),
    axis.text = element_text(face = "bold", size = 12),
    axis.title = element_text(face = "bold", size = 13),
    legend.position = "none"
  ) +
  
  ylim(0, 100)

