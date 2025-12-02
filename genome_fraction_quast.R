library(ggplot2)

# Data
genotypes <- c("A", "B", "C", "D", "E")
genome_fraction <- c(78.361, 83.195, 84.406, 70.074, 76.875)

df <- data.frame(
  Genotype = factor(genotypes, levels = genotypes),  # Preserve order
  GenomeFraction = genome_fraction
)

# Plot
p <- ggplot(df, aes(x = Genotype, y = GenomeFraction)) +
  geom_bar(stat = "identity", fill = "steelblue", color = "black", width = 0.4) +
  geom_text(aes(label = round(GenomeFraction,1)), vjust = -0.5, size = 3.5) +
  labs(title = "Genome Fraction (%) by Genotype",
       x = "Genotype",
       y = "Genome Fraction (%)") +
  theme_minimal(base_size = 13) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p)

# Optional: save plot
# ggsave("genome_fraction_barplot.png", p, width = 8, height = 5, dpi = 300)

