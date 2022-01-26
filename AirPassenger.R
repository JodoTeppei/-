plot(AirPassengers)

data<-ts(AirPassengers[1:144],start=c(1949,1),frequency = 12)
data


data.stl <- stl(data,s.window="periodic")
plot(data.stl)




model.arima <- auto.arima(
  data,              # データ指定
  ic = "aic",        # 情報量基準の指定
  trace = T,         # トレース出力（結果一覧）
  stepwise=T,        # 計算時の次数パターン省略 
  approximation=F,   # 近似計算の適用
  seasonal=T         # 季節調整
)

tsdiag(model.arima)

pred = forecast(model.arima, level=95, h=12)
pred
class(pred)

plot(pred)
legend("topleft",
       legend = c("pred", "actual"),
       lty = c(2, 1)
       lwd = 2,
       col = c(4, 1),
       cex = 1.5,
       bty = 'n',
       inset = c(0.05, 0.03)
)
title(sub="元データと予測データ",xlab="年", ylab="乗客数(千人)")
