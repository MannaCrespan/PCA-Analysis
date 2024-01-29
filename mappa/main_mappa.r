# aprire il prompt del DOS e posizionarsi per far lavorare R, entrare nella directory C:\
c:

# posizionarsi dov'è R
cd Programmi\R\R-4.2.3\bin

# richiamare R
R.exe

# installare il pacchetto LinkageMapView
install.packages("LinkageMapView", repos="http://cran.rstudio.com/") 

# indirizzare R nella cartella voluta
setwd("C:/Users/m.crespan/Documents/JoinMap4/FD_dicembre_2023/mappe rappresentazione grafica") 

#controllare di essere con R nella cartella di lavoro voluta:
getwd()

# richiamare il pacchetto LinkageMapView
library(LinkageMapView)

# script di base
outfile<-file.path("mappa_2_Chardonnay.pdf")

lmv.linkage.plot("grafica_2_mappa_Chardonnay.txt",outfile,mapthese=NULL,denmap=TRUE)

# andiamo a cercare i dettagli di questa funzione per apportare le modifiche desiderate/possibili
?lmv.linkage.plot

# con la funzione par() mi faccio mostrare i parametri impostati di default
par()