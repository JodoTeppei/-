X <- read.table("data.txt", header=TRUE, sep="\t",row.names=1)


options(max.print=10000)
X

loc = cmdscale(X,eig=T,k=2)

k<-2
eig <- loc$eig                           # 求まった固有値
p1 <- sum(abs(eig[1:k])) / sum(abs(eig))    # Mardia 第一基準の計算
p2 <- sum(eig[1:k] ^ 2) / sum(eig ^ 2)      # Mardia 第二基準の計算
cat("Mardia fit measure 1 = ", p1, "\n")
cat("Mardia fit measure 2 = ", p2, "\n")

plot(loc,type="n")
text(loc,labels = rownames(loc))

plot(-loc[,1], -loc[,2], type = "n")
text(-loc[,1], -loc[,2], labels = rownames(loc))
