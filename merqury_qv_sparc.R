

library(tidyr)
library(ggplot2)

# 1️⃣ Data
qv_comparison_data <- data.frame(
  Genotype = c("HY3C", "MC50", "ICPL-13271", "ICPL-87"),
  QV_Before_Polishing = c(34.127, 36.59, 32.32, 33.90),
  QV_After_Polishing = c(39.52, 42.10, 38.04, 39.79)
)

# 2️⃣ Convert to long format
plot_data_long <- pivot_longer(
  qv_comparison_data,
  cols = starts_with("QV_"),
  names_to = "Polishing_Stage",
  values_to = "QV_Score"
)

# 3️⃣ Rename stages
plot_data_long$Polishing_Stage <- factor(
  plot_data_long$Polishing_Stage,
  levels = c("QV_Before_Polishing", "QV_After_Polishing"),
  labels = c("Raw Assembly", "Polished Assembly")
)

# 4️⃣ Create color grouping
plot_data_long$Color_Group <- interaction(plot_data_long$Genotype,
                                          plot_data_long$Polishing_Stage)

# 5️⃣ Custom Colors (Raw light, Polished dark)
custom_colors <- c(
  "HY3C.Raw Assembly" = "#FFD6A5",
  "HY3C.Polished Assembly" = "#F4A261",
  
  "MC50.Raw Assembly" = "#FDFFB6",
  "MC50.Polished Assembly" = "#F1C40F",
  
  "ICPL-13271.Raw Assembly" = "#CAFFBF",
  "ICPL-13271.Polished Assembly" = "#2ECC71",
  
  "ICPL-87.Raw Assembly" = "#9BF6FF",
  "ICPL-87.Polished Assembly" = "#00B4D8"
)

# 6️⃣ Plot
ggplot(plot_data_long,
       aes(x = Genotype, y = QV_Score, fill = Color_Group)) +
  
  geom_bar(stat = "identity",
           position = position_dodge(width = 0.8),
           width = 0.7) +
  
  geom_text(aes(label = sprintf("%.2f", QV_Score)),
            position = position_dodge(width = 0.8),
            vjust = -0.5,
            size = 4,
            fontface = "bold") +
  
  scale_fill_manual(values = custom_colors, guide = "none") +
  
  labs(
    title = "Improvement in Genome Assembly Quality (Merqury QV)",
    subtitle = "Comparison of Raw vs Polished Assemblies",
    x = "Genotype",
    y = "QV Score"
  ) +
  
  scale_y_continuous(limits = c(0, 45),
                     breaks = seq(0, 45, by = 5)) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(face = "bold", color = "black"),
    axis.title = element_text(face = "bold"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0.5)
  )

