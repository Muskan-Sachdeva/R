# Load only tidyr
library(tidyr)

library(ggplot2)  # Needed for plotting

# 1. Load the data
qv_comparison_data <- data.frame(
  Genotype = c("A", "B", "C", "D", "E"),
  QV_Before_Polishing = c(34.127, 36.59, 35.90, 32.32, 33.90),
  QV_After_Polishing = c(39.52, 42.10, 41.20, 38.04, 39.79)
)

# 2. Reshape to long format
plot_data_long <- pivot_longer(
  qv_comparison_data,
  cols = starts_with("QV_"),
  names_to = "Polishing_Stage",
  values_to = "QV_Score"
)

# 3. Convert factor for Polishing Stage (base R)
plot_data_long$Polishing_Stage <- factor(
  plot_data_long$Polishing_Stage,
  levels = c("QV_Before_Polishing", "QV_After_Polishing"),
  labels = c("Raw Assembly (Before Polishing)", "Polished Assembly (After Polishing)")
)


# 4. Create the grouped bar plot
qv_comparison_plot <- ggplot(plot_data_long, 
                             aes(x = Genotype, y = QV_Score, fill = Polishing_Stage)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  geom_text(aes(label = sprintf("%.2f", QV_Score), group = Polishing_Stage),
            position = position_dodge(width = 0.8),
            vjust = -0.5, size = 3.5, fontface = "bold") +
  labs(
    title = "Improvement in Genome Assembly Quality (QV Score) After Polishing",
    subtitle = "Comparison of Raw Assembly vs. Polished Assembly Merqury QV Scores",
    x = "Genotype",
    y = "Estimated Assembly Quality Value (QV Score)",
    fill = "Assembly Stage"
  ) +
  scale_y_continuous(limits = c(0, 45), breaks = seq(0, 45, by = 5)) +
  scale_fill_manual(values = c("Raw Assembly (Before Polishing)" = "#A0B5D1", 
                               "Polished Assembly (After Polishing)" = "#2B687C")) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5),
    legend.position = "bottom"
  )

# 5. Display the plot
print(qv_comparison_plot)

  
  
  