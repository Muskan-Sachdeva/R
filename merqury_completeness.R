library(ggplot2)

# Your data (order will be preserved exactly as written here)
df <- data.frame(
  Genotype = factor(c("A", "B", "C", "D", "E"),
                    levels = c("A", "B", "C", "D", "E")),
  Completeness = c(95.73, 97.24, 94.96, 88.38, 92.07)
)

ggplot(df, aes(x = Genotype, y = Completeness)) +
  geom_bar(stat = "identity", fill = "#2B687C", color = "black", width = 0.55) +  # better blue + narrow width
  geom_text(aes(label = Completeness),
            vjust = -0.4, size = 4) +
  labs(
    title = "Merqury Completeness of Polished Assemblies",
    x = "Genotype",
    y = "Completeness (%)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text = element_text(color = "black"),
    axis.title = element_text(face = "bold")
  ) +
  ylim(0, 105)

