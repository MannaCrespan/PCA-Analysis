###ISTRUZIONI PER PCA by Massi####

getwd()
library(adegenet)

# import our own functions
source("functions.r")

# reading data
data <- read.structure(
  "data.stru",
  ask = TRUE,
  n.ind = 22,
  n.loc = 12,
  col.lab = 1,
  row.marknames = 1
)


###nella colonna con i nomi dei genotipi non ci devono essere spazi, quindi Pinot_nero, non Pinot nero

###rispondo alle domande del software
###una volta fatto, controllo i dati:
data
###ora seguo le istruzioni per la PCA (punto 6.2 del manuale). Non ho dati mancanti da sostituire. 
###Produco l'oggetto x che raccoglie le frequenze alleliche. A questo punto controllo se tutto OK:

x<-tab(data, freq=TRUE)

rownames(x) ###mi restituisce i nomi dei genotipi, è uno dei modi

###ora posso iniziare a elaborare la PCA:

pca_results<-dudi.pca(X, scale=FALSE, scannf=FALSE, nf=3)
###scale=FALSE non standardizza i dati, non ce n'è bisogno con gli alleli
###nf è il numero di assi della PCA. Il comando sopra non è interattivo

# the axes which will be used. Si riferisce alle coordiante della PCA sugli assi cartesiani
asse_1 <- 1
asse_2 <- 3

# draw the plot
s.class(
  pca_results$li,
  pop(data),
  xax = asse_1,
  yax = asse_2,
  sub = sprintf("PCA 22 genotypes\naxes %d-%d", asse_1, asse_2),
  possub = "topleft",
  csub = 1,
  col = c("black"),
  axesell = FALSE,
  xlim = c(-2, 2),
  ylim = c(-1.5, 1.5),
  cellipse = NULL
)

# print labels
for (i in seq(22)) {
  text(
    pca_results$li[, asse_1][i],
    pca_results$li[, asse_2][i],
    rownames(X)[i],
    cex = 0.8,
    adj = find_adj_parameter(
      pca_results$li[, asse_1][i],
      pca_results$li[, asse_2][i]
    )
  )
}

# TODO: show eigen values also for the other axes
# draw eigen values
add.scatter.eig(
  pca_results$eig[1:20],
  ratio = 0.15,
  posi = "bottomleft",
  sub = "Eigenvalues",
  3,
  2,
  1
)

VECCHIO CODICE
###chiedo quindi la rappresentazione grafica:
barplot(pca1$eig[1:50], main="PCA eigenvalues", col=heat.colors(50))

###chiedo info sui dati della PCA:
pca1

### con il comando sottostante ottengo una prima figura, con nomi:
s.label(pca1$li)
###aggiungo il tiolo:
title("PCA of Romania")
###aggiungo gli eigenvalues:
add.scatter.eig(pca1$eig[1:20], 3,1,2)
####posso modificarli parecchio per dimensione, ratio, posizione, sottotitolo:
add.scatter.eig(pca1$eig[1:20],ratio = 0.15, posi = "bottomleft", sub="eigenvalues", 3,2,1)
###continuo a non capire a cosa corrispondono i numeri 3,2,1, che comunque sono necessari

###con questo comando, invece, ottengo una rappresentazione per punti e con le ellissi; in 
###automatico mi fornisce il plot delle prime due coordinate:
s.class(pca1$li,pop(prova),xax=1,yax=2,sub="PCA 22 genotypes\naxes 1-2", possub = "topleft", csub=1, col =c("blue"), axesell=FALSE, xlim=c(-2, 2), ylim=c(-1.5, 1.5))

###aggiungo i nomi dei genotipi:
text(pca1$li[,1], pca1$li[,2], rownames(X), cex = 0.7)

###aggiungo gli Eigenvalues:
add.scatter.eig(pca1$eig[1:20],ratio = 0.15, posi = "bottomleft", sub="Eigenvalues", 3,2,1)


###se voglio altre coordinate, per es. 1 e 3:
s.class(pca1$li,pop(prova),xax=1,yax=3,sub="PCA 22 genotypes\naxes 1-3", possub="topleft", csub=1, col =c("blue"), axesell=FALSE)
add.scatter.eig(pca1$eig[1:20],ratio = 0.15, posi = "bottomleft", nf=3, xax=1, yax=3)

####per ottenere le percentuali di varianza spiegata:
summary(pca1)
###questo comando mi restituisce projected inertia (%) per ogni asse e cumulativi
###che corrispondono alla varianza % spiegata

####per ottenere l'elenco dei nomi:
indNames(prova)
###oppure
X[,0:0]

###oppure li posso estrarre così dall'oggetto X creato a suo tempo:
nomi<-X[1:22,0]
nomi


###elaboro UPGMA seguendo le istruzioni di Gabriella 
library(poppr)
library(ape)
library(adegenet)
###trasformo i miei dati in un oggetto di classe genind 

data<-read.structure("data.stru")

data

###costruisco l'albero
aboot(data, strata=NULL, tree="upgma", 
      distance="nei.dist", sample=100, cutoff=50, 
      showtree=TRUE, missing="mean", mcutoff=0, 
      quiet=FALSE, root=NULL, warnings=TRUE)

###se voglio i dettagli
data.nei<-nei.dist(data, warning=TRUE)
data.nei.matrix<-as.matrix(dist(data.nei))
write.table(data.nei.matrix, "data.nei.txt", sep="\t")


