
library(ggplot2)
library(tidyr)
library(dplyr)

# Your data in the EXACT order you gave
genotypes <- c("A","B","C","D","E")
relocations <- c(4663, 4883, 4597, 3332, 3903)
translocations <- c(4683, 3726, 4147, 841, 2732)

df <- data.frame(
  Genotype = genotypes,
  Relocations = relocations,
  Translocations = translocations
) %>%
  pivot_longer(cols = c(Relocations, Translocations),
               names_to = "Type",
               values_to = "Count")

# SET ORDER EXACTLY AS GIVEN
df$Genotype <- factor(df$Genotype, levels = genotypes)

p <- ggplot(df, aes(x = Genotype, y = Count, fill = Type)) +
  geom_bar(stat = "identity",
           position = position_dodge(width = 0.8),
           width = 0.7,
           color = "black") +
  scale_fill_manual(values = c("Relocations" = "steelblue",
                               "Translocations" = "dodgerblue4")) +
  geom_text(aes(label = Count),
            position = position_dodge(width = 0.8),
            vjust = -0.4, size = 3.5) +
  labs(title = "Relocations and Translocations by Genotype",
       x = "Genotype", y = "Count", fill = "") +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 45, hjust = 1))

print(p)
