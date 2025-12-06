
library(ggplot2)
library(scales)

df <- data.frame(
  Genotype = c("A", "B", "C", "D", "E"),
  SNPs = c(451472, 400630, 445084, 603577, 513541)
)

ggplot(df, aes(x = Genotype, y = SNPs)) +
  geom_bar(stat = "identity", width = 0.5, fill = "Steelblue") +   # narrower bars + neutral color
  scale_y_continuous(labels = comma) +                         # readable y-axis (with commas)
  labs(title = "SNP Count Across Genotypes",
       x = "Genotype",
       y = "SNP Count") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


