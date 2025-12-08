
library(tidyr)

df_indel_long <- df_indel %>%
  pivot_longer(cols = c(Insertions, Deletions),
               names_to = "Type",
               values_to = "Count")

ggplot(df_indel_long, aes(x = Genotype, y = Count, fill = Type)) +
  geom_bar(position = "dodge", stat = "identity", width = 0.55) +
  scale_fill_manual(values = c("#A0B5D1", "#2B687C")) +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Insertions vs Deletions Across Genotypes",
       x = "Genotype",
       y = "Count") +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold")
  )

