#!/user/bin/R
#####################################################################
# Name : KGE_boxplotls.R
# Skript for å lage boksplott av KGE og KGE-komponenter
# Usage :  R --slave --args < KGE_boxplotls.R
#
# Input : ~/samkjort_dogn/resultater/KGE_4x_dekomp2009_1995_2014_korr.dta o.l.
#
# Output : boksplott (som overskrives, kjør dem interaktivt!)
#
# Created by: Elin Langsholt (HM) September 2016
#####################################################################
# filomrader
myHome <- "/home/egl/samkjort_dogn/resultater/"

# leser datafila
# Det er to forskjellige datafiler: en der 2009-metoden er brukt og en der 2012-metoden er brukt.
# r og beta blir helt like med de to metodene. KGE blirm litt forskjellig, 2009 beregner alfa, 2012 beregner gamma

KGEdata <- read.table(file=paste(myHome,"KGE_4x_dekomp2009_1995_2014_korr.dta",sep=""),header=TRUE)

# tilordner datasettene
d07KGE <- KGEdata$d07KGE
d07r <- KGEdata$d07r
d07be <- KGEdata$d07be
d07ga <- KGEdata$d07ga
tradKGE <- KGEdata$tradKGE
tradr <- KGEdata$tradr
tradbe <- KGEdata$tradbe
tradga <- KGEdata$tradga
trq1KGE <- KGEdata$trq1KGE
trq1r <- KGEdata$trq1r
trq1be <- KGEdata$trq1be
trq1ga <- KGEdata$trq1ga
d00KGE <- KGEdata$d00KGE
d00r <- KGEdata$d00r
d00be <- KGEdata$d00be
d00ga <- KGEdata$d00ga

# lager boksplottene med tegnforklaring (tar ikke vare på forrige plott)
boxplot(tradKGE, trq1KGE, d07KGE, d00KGE, col=c("green4", "yellowgreen", "maroon1", "orange1"), main="KGE")
legend(4,0.42,c("trad","q-1","07","00"), fill=c("green4", "yellowgreen", "maroon1", "orange1"))
boxplot(tradr, trq1r, d07r, d00r, col=c("green4", "yellowgreen", "maroon1", "orange1"), main="r")
legend(4,0.6,c("trad","q-1","07","00"), fill=c("green4", "yellowgreen", "maroon1", "orange1"))
boxplot(tradbe, trq1be, d07be, d00be, col=c("green4", "yellowgreen", "maroon1", "orange1"), main="beta")
legend(4,0.65,c("trad","q-1","07","00"), fill=c("green4", "yellowgreen", "maroon1", "orange1"))
boxplot(tradga, trq1ga, d07ga, d00ga, col=c("green4", "yellowgreen", "maroon1", "orange1"), main="alfa")
legend(4,0.63,c("trad","q-1","07","00"), fill=c("green4", "yellowgreen", "maroon1", "orange1"))

# tallene bak plottet: min, 25%, med, 75%, maks + konfidensintervall
boxplot.stats(tradKGE, coef=0)
# ...osv

dev.off()

#quit()

