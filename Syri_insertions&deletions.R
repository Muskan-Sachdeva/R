library(ggplot2)
library(tidyr)
library(scales)

df_indel <- data.frame(
  Genotype = c("A", "B", "C", "D", "E"),
  Insertions = c(68291, 66249, 67047, 69493, 71050),
  Deletions = c(83669, 85873, 91451, 94470, 94562)
)

ggplot(df_indel_long, aes(x = Genotype, y = Count, fill = Type)) +
  geom_bar(position = "dodge", stat = "identity", width = 0.55) +
  scale_fill_manual(values = c("Steelblue", "dodgerblue4")) +   # FIXED QUOTES
  scale_y_continuous(labels = comma) +
  labs(title = "Insertions vs Deletions Across Genotypes",
       x = "Genotype",
       y = "Count") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

