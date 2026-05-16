library(ggplot2)
library(ggrepel)
df <- read.csv('tables/rescue_genes_merged_log2fc.csv', row.names = 1)
df$is_rescue <- df$is_rescue == "True"  
genes_to_label <- c(
  "Tgfb1", "Col1a1", "Col1a2", "Fn1", "Acta2", "Mmp2", "Timp1", "Lox", "Postn",
  "Ccl2", "Ccl5", "Cd74", "Vcam1", "Spp1", "Csf1", "Cxcl10",
  "Myc", "Cdkn2a", "Egr1", "Socs3", "Sox8", "Sox9",
  "Vim", "Loxl2", "Mmp14", "Dcn", "Bgn",
  "Ryr2", "Crocc", "Kif5a", "Eif4ebp3", "Ndufs5", "Mlxipl", "Pla2g3", "Dgkq"
)
df_rescue <- df[df$is_rescue == TRUE, ]
df_other  <- df[df$is_rescue == FALSE, ]
df_labels <- df_rescue[rownames(df_rescue) %in% genes_to_label, ]

p <- ggplot() +
  geom_point(data = df_other,  aes(x = log2FC_RC_vs_B6, y = log2FC_DFMO_vs_RC),
             color = "gray80", alpha = 0.4, size = 1) +
  geom_point(data = df_rescue, aes(x = log2FC_RC_vs_B6, y = log2FC_DFMO_vs_RC, color = log2FC_RC_vs_B6),
             alpha = 0.7, size = 1.3) +
  # Highlight labeled genes with a distinct color on top
  geom_point(data = df_labels, aes(x = log2FC_RC_vs_B6, y = log2FC_DFMO_vs_RC),
             color = "black", size = 1.3) +
  geom_abline(slope = -1, intercept = 0, linetype = "dashed", color = "gray40") +
  geom_hline(yintercept =  0, color = "gray70", linewidth = 0.4) +
  geom_hline(yintercept =  1, color = "gray70", linewidth = 0.4, linetype = "dotted") +
  geom_hline(yintercept = -1, color = "gray70", linewidth = 0.4, linetype = "dotted") +
  geom_vline(xintercept =  0, color = "gray70", linewidth = 0.4) +
  geom_vline(xintercept =  1, color = "gray70", linewidth = 0.4, linetype = "dotted") +
  geom_vline(xintercept = -1, color = "gray70", linewidth = 0.4, linetype = "dotted") +
  geom_text_repel(data = df_labels,
                  aes(x = log2FC_RC_vs_B6, y = log2FC_DFMO_vs_RC, label = rownames(df_labels)),
                  size = 4, max.overlaps = 30) +
  scale_color_gradient2(low = "#1E6FD9", mid = "gray85", high = "#D92020", midpoint = 0,
                        name = bquote(log[2]*"FC (RC vs B6)")) +
  labs(x = bquote(log[2]*"FC (RC vs B6)"), y = bquote(log[2]*"FC (DFMO vs RC)")) +
  xlim(-3, 5) +
  ylim(-5, 3) +
  theme_classic()

ggsave("rescue_plot.pdf", plot = p, width = 7, height = 6, dpi = 300)