# to compute the correct adj parameter for every point
find_adj_parameter <- function(x, y) {
  if (x < 0 && y < 0) {
    position <- c(1, 1)
  } else if (x < 0 && y > 0) {
    position <- c(1, 0)
  } else if (x > 0 && y < 0) {
    position <- c(0, 1)
  } else {
    position <- c(0, 0)
  }

  return(position)
}
