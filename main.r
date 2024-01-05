# import 3rd parties libraries
library(adegenet)

# import our own functions
source("functions.r")

# reading data
data <- read.structure(
  "./Romania/data.stru",
  ask = TRUE,
  n.ind = 22,
  n.loc = 12,
  col.lab = 1,
  row.marknames = 1
)

x <- tab(data, freq = TRUE)

# compute principal component analysis
pca_results <- dudi.pca(
  x,
  scale = FALSE,
  scannf = FALSE,
  nf = 3
)

# the axes which will be used
asse_1 <- 2
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
    rownames(x)[i],
    cex = 0.8,
    adj = find_position(
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
