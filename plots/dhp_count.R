library(ggplot2)
library(reshape2)

popsize <-  dhp_count #when importing, need to make sure "Count" column is numeric for removing NAs

b <- ggplot(popsize, aes(x=Year, y=Count, group=Season))+
  #geom_point()+
  geom_line(data=popsize[!is.na(popsize$Count),], aes(color=Season))+
  scale_color_manual(labels = c("Fall", "Spring"), values = c("red", "blue")) +
  theme_classic(base_size=12)+
  theme(legend.title = element_blank(), legend.position=c(.85,.75),
        text = element_text(size=14, color = "black"),
        axis.text.x= element_text(size=12, color = "black"),
        axis.text.y= element_text(size=12, color = "black")
        )+
  ylab("Population Size")
b
