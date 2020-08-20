install.packages("tidyverse")
library(tidyverse)

mpg <- mpg 
ggplot(data = mpg)  #ggplotを起動
ggplot(data = mpg, aes(x = displ, y = hwy))   #plotの種類やパターン,色,サイズを定義
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()   #"+"の演算子でplotに値を加える 

car_plot <- ggplot(data = mpg, aes(x = displ, y = hwy))   #変数に代入

car_plot +　geom_point()
car_plot +　geom_point(alpha = 0.4)   #透過性のalphaを加える　
car_plot +  geom_point(aes(color = model))   #data.setのclassごとに色付け

ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + geom_point(mapping = aes(x = cty, y = hwy, size = class, color = fl))

ggplot(data = mpg) +
  geom_point(aes(x = hwy, y = displ ,color = class))

car_plot + 
  geom_point(alpha = 0.4, color = "blue", shape = "1", size = 10)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ manufacturer) +
  theme_bw()

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_jitter()

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()

ggplot(data = mpg) +
  geom_jitter(aes(x = drv, y = hwy)) +
  geom_violin(aes(x = drv, y = hwy))


ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_violin() +
  geom_smooth() +
  geom_jitter()

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class),size = 10) +
  geom_smooth() +
  labs(title = "Relationship between engine size and mpg",
       x = "Highway MPG",
       y = "Engine displacement (liters)") +
  theme_bw() +
  theme(text=element_text(size = 16)) +
  guides(color= guide_legend("legend")) +
  #scale_colour_manual(values=cbbPalette)
  scale_colour_brewer(palette = "Spectral")
  #scale_fill_manual(values=cbPalette)
?scale_colour_brewer
library(RColorBrewer)
?scale_colour_hue

?scale_fill_brewer

cbgPalette<-c("#999999", "#E69F00", "#56B4E9", "#009E73",
              "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
