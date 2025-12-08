library(ggplot2)

# Data
genotypes <- c("A", "B", "C", "D", "E")
genome_fraction <- c(78.361, 83.195, 84.406, 70.074, 76.875)

df <- data.frame(
  Genotype = factor(genotypes, levels = genotypes),  # Preserve order
  GenomeFraction = genome_fraction
)


p <- ggplot(df, aes(x = Genotype, y = GenomeFraction)) +
  geom_bar(stat = "identity", fill = "#2B687C", width = 0.5) +
  geom_text(aes(label = round(GenomeFraction, 1)),
            vjust = -0.5, size = 3.5) +
  scale_y_continuous(limits = c(0, 90), breaks = seq(0, 100, 25)) +
  expand_limits(y = max(df$GenomeFraction) + 5) + 
  labs(title = "Genome Fraction (%) by Genotype",
       x = "Genotype",
       y = "Genome Fraction (%)") +
  theme_classic(base_size = 14) +   # ★ WHITE BACKGROUND
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"))

print(p)

