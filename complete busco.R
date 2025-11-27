
    
    library(ggplot2)
    
    busco <- data.frame(
      Genotype = c("A", "B", "C", "D", "E"),
      Complete = c(98.8, 99.3, 99.2, 95.2, 98.3)
    )
    
    ggplot(busco, aes(x = Genotype, y = Complete, fill = Genotype)) +
      geom_col(width = 0.5, color = "black") +
      scale_fill_manual(values = c(
        "HY3C" = "#08306B",
        "MC50" = "#08519C",
        "MC70" = "#2171B5",
        "ICPL-13271" = "#4292C6",
        "ICPL-87" = "#6BAED6"
      )) +
      labs(
        x = "Genotype",
        y = "Complete BUSCO (%)",
        title = "BUSCO Completeness Across Genotypes"
      ) +
      theme_minimal(base_size = 14) +
      theme(
        legend.position = "none",
        plot.title = element_text(face = "bold", hjust = 0.5),
        axis.text.x = element_text(angle = 40, hjust = 1)
      )
    
