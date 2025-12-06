df_sv <- data.frame(
  Genotype = c("HY3C", "MC50", "MC70", "ICPL-13271", "ICPL-87"),
  Duplications = c(183, 216, 284, 134, 174),
  Inversions = c(34, 54, 49, 35, 43),
  Translocations = c(389, 315, 315, 469, 377)
)

# Long format
df_sv_long <- pivot_longer(df_sv,
                           cols = c("Duplications", "Inversions", "Translocations"),
                           names_to = "SV_Type",
                           values_to = "Count")

ggplot(df_sv_long, aes(x = Genotype, y = Count, fill = SV_Type)) +
  geom_bar(position = "dodge", stat = "identity", width = 0.55) +  # slim bars
  scale_fill_manual(values = c("Steelblue", "dodgerblue4", "blue4")) +    # neutral palette
  scale_y_continuous(labels = comma) +
  labs(title = "Structural Variant Distribution Across Genotypes",
       x = "Genotype",
       y = "SV Count") +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

