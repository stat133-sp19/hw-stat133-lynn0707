• title: Shot Charts
• description: creating shot charts as a scatterplot of the shots using 
the x and y variables (i.e. coordinates of the shots). 
• input(s):  stephen-curry.csv, andre-iguodala.csv, draymond-green.csv, 
data/kevin-durant.csv, klay-thompson.csv, shot-data.csv 
• output(s): stephen-curry-shot-chart.pdf, klay-thompson-shot-chart.pdf, 
draymond-green-shot-chart.pdf, andre-iguodala-shot-chart.pdf, 
kevin-durant-shot-chart, images/gsw-shot-charts.pdf, images/gsw-shot-charts.png.


library(jpeg)
library(grid)
court_file <- "images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), 
                          width = unit(1, "npc"), 
                          height = unit(1, "npc"))

library(ggplot2)
klay_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave(filename = "images/klay-thompson-shot-chart.pdf",
       width = 6.5, height= 5)

andre_iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave(filename = "images/andre-iguodala-shot-chart.pdf",
       width = 6.5, height= 5)

draymond_green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymood Green (2016 season)') +
  theme_minimal()
ggsave(filename = "images/draymond-green-shot-chart.pdf",
       width = 6.5, height= 5)


kevin_durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave(filename = "images/kevin-durant-shot-chart.pdf",
       width = 6.5, height= 5)

stephen_curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave(filename = "images/stephen-curry-shot-chart.pdf",
       width = 6.5, height= 5)


gsw_shot_chart <- ggplot(data = shot_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  facet_wrap( ~name) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal() +
  theme(legend.position="top")
ggsave(filename = "images/gsw-shot-charts.pdf",
       width = 8, height= 7)
ggsave(filename = "images/gsw-shot-charts.png",
       width = 8, height= 7)