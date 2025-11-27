library(tidyr)
library(ggplot2)
data <- data.frame(
  Genotype = c("HY3C", "MC50", "MC70", "ICPL-13271", "ICPL-87"),
  Mean_Read_Length = c(4104, 3233, 3326, 2606, 2806),
  Median_Read_Length = c(3502, 2257, 1817, 1772, 1610),
  N50 = c(5487, 5324, 6265, 4061, 5109)
)
plot_data <- data %>%
  pivot_longer(
    cols = c(Mean_Read_Length, Median_Read_Length, N50), 
    names_to = "Metric",                               
    values_to = "Length_Value"                          
  )  

sequencing_plot <- ggplot(plot_data, 
                          aes(x = Genotype,       
                              y = Length_Value,   
                              group = Metric,     
                              color = Metric)) +  
  geom_line(linewidth = 0.8) +
  
  geom_point(size = 2, shape = 21, fill = "white", stroke = 1) +
  
  labs(
    title = "Read Length Metrics Across Different Genotypes",
    x = "Genotype",
    y = "Length (bp)",
    color = "Sequencing Metric"
  ) +
  
  theme_minimal() + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.title = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1) 
  ) +
  
    scale_y_continuous(breaks = seq(1000, 7000, by = 1000), 
                     labels = scales::comma) 

print(sequencing_plot)
  
