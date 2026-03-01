library(ggplot2)

data <- data.frame(
  Genotype = c("HY3C", "MC50", "ICPL-13271", "ICPL-87"),
  Complete = c(98.8, 99.3, 95.2, 98.3)
)

ggplot(data, aes(x = Genotype, y = Complete, fill = Genotype)) +
  geom_bar(stat = "identity", width = 0.6) +
  
  # Percentage labels
  geom_text(aes(label = paste0(Complete, "%")),
            vjust = -0.5,
            size = 5,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "#EDAFB8",
    "#F7E1D7",
    "#DEDBD2",
    "#B0C4B1"
  )) +
  
  theme_minimal() +
  
  labs(
    title = "BUSCO Completeness Across Pigeonpea Genotypes",
    y = "Completeness (%)",
    x = "Genotype"
  ) +
  
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.text.x = element_text(face = "bold", size = 12),  # Genotype names bold
    axis.text.y = element_text(face = "bold", size = 12),
    axis.title = element_text(face = "bold", size = 13),
    legend.text = element_text(face = "bold"),             # Legend bold
    legend.title = element_text(face = "bold"),
    legend.position = "right"
  ) +
  
  ylim(0, 105)



library(ggplot2)

data <- data.frame(
  Genotype = c("HY3C", "MC50", "ICPL-13271", "ICPL-87"),
  Complete = c(98.8, 99.3, 95.2, 98.3)
)

ggplot(data, aes(x = Genotype, y = Complete, fill = Genotype)) +
  
  geom_bar(stat = "identity", width = 0.6) +
  
  geom_text(aes(label = paste0(Complete, "%")),
            vjust = -0.5,
            size = 5,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "#EDAFB8",
    "#F7E1D7",
    "#DEDBD2",
    "#B0C4B1"
  )) +
  
  labs(
    title = "BUSCO Completeness Across Pigeonpea Genotypes",
    y = "Completeness (%)",
    x = "Genotype"
  ) +
  
  ylim(0, 105) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text.x = element_text(face = "bold", size = 12, color = "black"),
    axis.text.y = element_text(face = "bold", size = 12, color = "black"),
    axis.title = element_text(face = "bold", size = 13),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    legend.text = element_text(face = "bold"),
    legend.title = element_text(face = "bold"),
    legend.position = "right"
  )

