
library(ggplot2)

df <- data.frame(
  Genotype = factor(c("HY3C", "MC50", "ICPL-13271", "ICPL-87"),
                    levels = c("HY3C", "MC50", "ICPL-13271", "ICPL-87")),
  Completeness = c(95.73, 97.24, 88.38, 92.07)
)

ggplot(df, aes(x = Genotype, y = Completeness, fill = Genotype)) +
  
  geom_bar(stat = "identity", width = 0.6) +
  
  geom_text(aes(label = paste0(Completeness, "%")),
            vjust = -0.4,
            size = 4.5,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "#D62828",
    "#F77F00",
    "#FCBF49",
    "#EAE2B7"
  )) +
  
  labs(
    title = "Merqury Completeness of Polished Pigeonpea Assemblies",
    x = "Genotype",
    y = "Completeness (%)"
  ) +
  
  ylim(0, 105) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(color = "black", face = "bold"),
    axis.title = element_text(face = "bold"),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 15),
    legend.position = "none"
  )





