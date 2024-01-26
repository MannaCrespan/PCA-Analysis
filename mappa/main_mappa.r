# aprire il prompt del DOS e posizionarsi per far lavorare R
cd C:\Program Files\R\R-4.2.3\bin

# richiamare R
R.exe

# installare il pacchetto LinkageMapView
install.packages("LinkageMapView", repos="http://cran.rstudio.com/") 

# indirizzare R nella cartella voluta
setwd("C:/Users/m.crespan/Documents/JoinMap4/FD_dicembre_2023/mappe rappresentazione grafica") 

# richiamare il pacchetto LinkageMapView
library(LinkageMapView)

# script di base
outfile<-file.path("mappa_2_Chardonnay.pdf")

lmv.linkage.plot("grafica_2_mappa_Chardonnay.txt",outfile,mapthese=NULL,denmap=TRUE, cex.axis=1)

