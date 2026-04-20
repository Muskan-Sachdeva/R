library(ggplot2)
library(dplyr)

# 1️⃣ Main repeat classes
repeat_data <- data.frame(
  Genotype = c("HY-3C", "MC-50", "ICPL-13271", "ICPL-87"),
  Retroelements = c(34.91, 39.39, 38.09, 34.12),
  DNA_Transposons = c(20.23, 19.95, 20.81, 19.47),
  Unclassified = c(6.47, 5.87, 6.46, 5.27),
  Simple_Repeats = c(1.30, 1.29, 1.29, 1.32),
  Total_Repeats = c(62.91, 66.50, 66.66, 60.18)
)

# 2️⃣ Long format for stacked bars
repeat_long <- pivot_longer(
  repeat_data,
  cols = c(Retroelements, DNA_Transposons, Unclassified, Simple_Repeats),
  names_to = "Repeat_Class",
  values_to = "Percentage"
)

# 3️⃣ Create stacked bar plot
ggplot(repeat_long,
       aes(x = Genotype, y = Percentage, fill = Repeat_Class)) +
  
  geom_bar(stat = "identity", width = 0.7) +
  
  # 4️⃣ Add total repeat % on top
  geom_text(data = repeat_data,
            aes(x = Genotype,
                y = Retroelements + DNA_Transposons + Unclassified + Simple_Repeats,
                label = paste0(round(Total_Repeats,2), "%")),
            inherit.aes = FALSE,
            vjust = -0.5,
            size = 4.5,
            fontface = "bold") +
  
  scale_fill_manual(values = c(
    "Retroelements" = "#118AB2",
    "DNA_Transposons" = "#06D6A0",
    "Unclassified" = "#FFD166",
    "Simple_Repeats" = "#EF476F"
  )) +
  
  labs(
    title = "Repeat Composition Across Pigeonpea Genotypes",
    x = "Genotype",
    y = "Genome Percentage (%)",
    fill = "Repeat Class"
  ) +
  
  ylim(0, 75) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(face = "bold", color = "black"),
    axis.title = element_text(face = "bold"),
    plot.title = element_text(hjust = 0.5, face = "bold", size = 15),
    legend.text = element_text(face = "bold"),
    legend.title = element_text(face = "bold")
  )



