getwd()
setwd("C:/Users/kmmr-/Desktop/R ディレクトリ")



#5.2 Install our first package: tidyverse
install.packages("tidyverse")
library(tidyverse)



#5.4 Data
mpg <- mpg   　#dataset
?mpg  　#help page

ggplot(data = mpg)  #ggplotを起動
ggplot(data = mpg, aes(x = displ, y = hwy))   #plotの種類やパターン,色,サイズを定義
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()   #"+"の演算子でplotに値を加える 

#######################################################################################
#plotの種類
#– geom_point() for scatter plots, dot plots, etc.
#– geom_bar() for bar charts
#– geom_line() for trend lines, time-series, etc.

##########################################################
##スマートな使い方
##変数に代入
# car_plot <- ggplot(data = mpg, aes(x = displ, y = hwy))
##plotを書く
# car_plot + geom_point()
##########################################################

#"+"の演算子はレイヤーの行の末尾につけないといけない
#######################################################################################



#5.5 Building your plots iteratively
car_plot <- ggplot(data = mpg, aes(x = displ, y = hwy))   #変数に代入

car_plot +　geom_point()
car_plot +　geom_point(alpha = 0.4)   #透過性のalphaを加える　
car_plot +  geom_point(aes(color = class))   #data.setのclassごとに色付け

#data.setのclassごとにplotの形を変える
#[6種類以上は判別しにくくなるため、手動で指定した方がいい]というerror.messageが出る
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#5.5.1 Exercise
##class→質的data,size→量的dataなのでerror.messageが出る
##classをサイズで区別,flを色で区別
ggplot(data = mpg) + geom_point(mapping = aes(x = cty, y = hwy, size = class, color = fl))

##指定方法 color:名前, shape:数字, size:〇mm
car_plot + geom_point(alpha = 0.4, color = "blue", shape = 2, size = 1)

#5.5.2 Exercise
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))


#5.6 Faceting
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() + facet_wrap(~ manufacturer)   #複数のplotをfacterごとに1つのplotに分割する　

ggplot(data = mpg, aes(x = displ, y = hwy, color = class))　+
  geom_point() + facet_wrap(~ manufacturer)   #↑のplotにclassごとで色分け

# +theme_bw():backgroundを白にするためのcode
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() + facet_wrap(~ manufacturer) + theme_bw()



#5.7 ggplot2 themes
#5.7.1 Exercise
install.packages("ggthemes")
#Example
ggplot(data = mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() + facet_wrap(~ manufacturer) +
  theme_dark()



#5.8 Geometric objects (geoms)
##geom functionのデフォルト値でplotが計算されるため、解析時は要注意！
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_jitter()   #バラバラ

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()   #box plot

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin()   #violin plot

ggplot(data = mpg) +
  geom_smooth(aes(x = displ, y = hwy))   #平滑平均 loessとy~x式を計算して算出
?geom_smooth   #single geomを詳しく学べる

##geom関数を追加すれば、1つのplotに複数のgeomが載せることができる
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))

##x~y軸をggplot関数で指定した方が変更しやすい
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

##レイヤーごとにmappingの形式を指定できる
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()



#5.9 Customization
#lab関数でタイトルとx~y軸に情報を加える
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  labs(title = "Relationship between engine size and miles per gallon (mpg)",
       x = "Highway MPG",
       y = "Engine displacement (liters)") +
  theme_bw()

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  labs(title = "Relationship between engine size and mpg",
       x = "Highway MPG",
       y = "Engine displacement (liters)") +
  theme_bw() +
  theme(text=element_text(size = 16))     #textのfont size変更

#5.9.1 Challenge_Example
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  theme(panel.grid.major = element_line(colour="red", linetype="dashed", size=0.2))

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  theme(legend.title = element_text(color="red", size = 100))

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  scale_colour_hue()


#5.10 Bar charts
ggplot(data = mpg) +
  geom_bar(aes(x = fl))

#5.10.1 Position adjustments
ggplot(data = mpg) +
  geom_bar(aes(x = fl, fill = fl))   #fill = で色が付けられる(color aestheticでも可)

ggplot(data = mpg) +
  geom_bar(aes(x = fl, fill = class))   #fill aestheticに異なる値を指定すると自動的にflとclassがスタックされる

ggplot(data = mpg) +
  geom_bar(aes(x = fl, fill = class), position = "fill")   #position = "fill":全体にbarが拡張

ggplot(data = mpg) +
  geom_bar(aes(x = fl, fill = class), position = "dodge")   #position = "dodge":クラスごとに個別の値で表示 

#5.10.2 Challenge
ggplot(data = mpg) +
  geom_bar(aes(x = fl, fill = class), position = "dodge") +
  scale_x_discrete(labels=c("CNG", "Diesel", "Ethanol", "Premium", "Regular")) +
  xlab("Fuel type")   #scale_x_discrete : x軸の値表記を離散的に位置付けする関数



#5.11 Arranging and exporting plots
my_plot <- ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  labs(title = "Relationship between engine size and mpg",
       x = "Highway MPG",
       y = "Engine displacement (liters)") +
  theme_bw() +
  theme(text=element_text(size = 16))
ggsave("name_of_file.png", my_plot, width = 15, height = 10)   #ggsave("保存名.png", 保存するplot, width = 幅, height = 高さ)

##############################################################################
#stat_practice
data <- iris

ggplot(data, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(aes(colour=Species)) +
  stat_smooth()

#単回帰曲線
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(aes(colour=Species)) +
  stat_smooth(method="lm")

#factorごとの単回帰
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point() +
  stat_smooth(method="lm")

#一般化線型モデル
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point() +
  stat_smooth(method="glm", family=Gamma)
  
  ##全体に回帰線を書く:fullrange=T
ggplot(data, aes(x=Sepal.Length, y=Sepal.Width, colour=Species))+
  geom_point() +
  stat_smooth(method="glm", method.args = list(family = "Gamma"), fullrange = TRUE) + 
  facet_grid(. ~ Species)
##############################################################################
