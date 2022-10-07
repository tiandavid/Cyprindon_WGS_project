library(readxl)
library(ggplot2)
library(ggpubr)
library(tidyverse)
library(cowplot)
library(ggsignif)


load_geno_pro <- read_excel("~/Desktop/SYN.NSYN.LOF.geno.pro.xlsx")
View(load_geno_pro)

#remove outgroups and LOF variants
ind_proportion <- load_geno_pro %>% filter(variant != "LOF" & Species != "outgroup")
#relabel stop_gained as LOF
ind_proportion$variant[ind_proportion$variant == "stop_gained"] <- "LOF"
View(ind_proportion)
View(ind_proportion)

ind_prop_LOF <- ind_proportion %>% filter(variant == "LOF")
ind_prop_LOF$genotype <- factor(ind_prop_LOF$genotype, levels = c("Hom_Anc", "Het_Der", "Hom_der"))

ind_prop_NSYN <- ind_proportion %>% filter(variant == "NSYN")
ind_prop_NSYN$genotype <- factor(ind_prop_LOF$genotype, levels = c("Hom_Anc", "Het_Der", "Hom_der"))

ind_prop_SYN <- ind_proportion %>% filter(variant == "SYN")
ind_prop_SYN$genotype <- factor(ind_prop_LOF$genotype, levels = c("Hom_Anc", "Het_Der", "Hom_der"))


p1 <- ind_prop_LOF %>%
  group_by(Species,genotype,variant) %>%
  summarize(m = mean(proportion),
            se = sd(proportion)/sqrt(length(proportion))) %>% 
  ggplot(aes(x = Species, y = m, group = genotype, fill = genotype))+ # what happens when you add both color and fill arguments? (hint: remove one argument at a time to see the difference)
  geom_bar(stat = "identity", position = "dodge")+
  geom_errorbar(aes(ymin = m-(2*se), ymax = m+(2*se)), width = 0.4, position = "dodge")+
  theme_classic()+
  scale_fill_manual(name = "Genotypes", 
                    labels = c("Homozygous Ancestral", "Heterozygous Derived", "Homozygous Derived"),
                    values=c("#999999", "#E69F00", "#56B4E9"))+
  facet_wrap(~genotype)+
  theme(strip.background = element_blank(), strip.text = element_blank())+
  xlab("Cyprinodon Species")+
  ylab("Mean proportion of \n LOF genotypes")+
  theme(legend.position = "none")
p1

p2 <- ind_prop_NSYN %>%
  group_by(Species,genotype,variant) %>%
  summarize(m = mean(proportion),
            se = sd(proportion)/sqrt(length(proportion))) %>% 
  ggplot(aes(x = Species, y = m, group = genotype, fill = genotype))+ # what happens when you add both color and fill arguments? (hint: remove one argument at a time to see the difference)
  geom_bar(stat = "identity", position = "dodge")+
  geom_errorbar(aes(ymin = m-(2*se), ymax = m+(2*se)), width = 0.4, position = "dodge")+
  theme_classic()+
  scale_fill_manual(name = "Genotypes", 
                    labels = c("Homozygous Ancestral", "Heterozygous Derived", "Homozygous Derived"),
                    values=c("#999999", "#E69F00", "#56B4E9"))+
  facet_wrap(~genotype)+
  theme(strip.background = element_blank(), strip.text = element_blank(),
        axis.title.x=element_blank())+
  ylab("Mean proportion of \n NSYN genotypes")+
  theme(legend.position = "none")
p2

ind_prop_SYN %>% group_by(Species,genotype,variant) %>% summarize(length(proportion))

p3 <- ind_prop_SYN %>%
  group_by(Species,genotype,variant) %>%
  summarize(m = mean(proportion),
            se = sd(proportion)/sqrt(length(proportion))) %>% 
  ggplot(aes(x = Species, y = m, group = genotype, fill = genotype))+ # what happens when you add both color and fill arguments? (hint: remove one argument at a time to see the difference)
  geom_bar(stat = "identity", position = "dodge")+
  geom_errorbar(aes(ymin = m-(2*se), ymax = m+(2*se)), width = 0.4, position = "dodge")+
  theme_classic()+
  scale_fill_manual(name = "Genotypes", 
                    labels = c("Homozygous Ancestral", "Heterozygous Derived", "Homozygous Derived"),
                    values=c("#999999", "#E69F00", "#56B4E9"))+
  facet_wrap(~genotype)+
  theme(strip.background = element_blank(), strip.text = element_blank(),
        axis.title.x=element_blank())+
  ylab("Mean proportion of \n SYN genotypes")+
  theme(legend.position = "none")
p3

p4 <- ind_prop_SYN %>%
  group_by(Species,genotype,variant) %>%
  summarize(m = mean(proportion),
            s = sd(proportion),
            n = n(),
            se = s / sqrt(n),
            ci = 2*se) %>% 
  ggplot(aes(x = Species, y = m, group = genotype, fill = genotype)) + 
  stat_compare_means()+
  geom_bar(stat = "identity", position = "dodge")+
  geom_errorbar(aes(ymin = m-ci, ymax = m+ci), width = 0.4, position = "dodge")+
  theme_classic()+
  scale_fill_manual(name = "Genotypes", 
                    labels = c("Homozygous Ancestral", "Heterozygous Derived", "Homozygous Derived"),
                    values=c("#999999", "#E69F00", "#56B4E9"))+
  facet_wrap(~genotype)+
  theme(strip.background = element_blank(), strip.text = element_blank(),
        axis.title.x=element_blank())+
  ylab("Mean proportion of \n SYN genotypes")+
  theme(legend.position = "none")

p4


prop_legend_plot <- ind_prop_SYN %>%
  group_by(Species,genotype,variant) %>%
  summarize(m = mean(proportion),
            se = sd(proportion)/sqrt(length(proportion))) %>% 
  ggplot(aes(x = Species, y = m, group = genotype, fill = genotype))+ # what happens when you add both color and fill arguments? (hint: remove one argument at a time to see the difference)
  geom_bar(stat = "identity", position = "dodge")+
  geom_errorbar(aes(ymin = m-(2*se), ymax = m+(2*se), position = "dodge"))+
  theme_classic()+
  scale_fill_manual(name = "Genotypes", 
                    labels = c("Homozygous Ancestral", "Heterozygous Derived", "Homozygous Derived"),
                    values=c("#999999", "#E69F00", "#56B4E9"))+
  facet_wrap(~genotype)+
  theme(strip.background = element_blank(), strip.text = element_blank(),
        legend.direction="horizontal")+
  xlab("Cyprinodon Species")+
  ylab("Mean proportion of \n SYN genotypes")
prop_legend_plot

prop_legend <- get_legend(prop_legend_plot)


#cowplot
species_load <- plot_grid(p3, p2, p1,prop_legend,ncol = 1, rel_heights = c(1,1,1,0.2))
species_load
