Mtest.cov <- function(x, ina, a = 0.05) {
  ## x is the data set
  ## ina is a numeric vector indicating the groups of the data set
  ## a is the level of significance, set to 0.05 by default
  p <- dim(x)[2]  ## dimension of the data set
  n <- dim(x)[1]  ## total sample size
  ina <- as.numeric(ina)
  k <- max(ina)  ## number of groups
  nu <- tabulate(ina)  ## the sample size of each group
  ni <- rep(nu - 1, each = p^2)
  mat <- array(dim = c(p, p, k))
  ## next is the covariance of each group
  for (i in 1:k)  mat[, , i] <- Rfast::cova(x[ina == i, ])
  mat1 <- ni * mat
  pame <- apply(mat, 3, det)  ## the detemirnant of each covariance matrix
  ## the next 2 lines calculate the pooled covariance matrix
  Sp <- colSums( aperm(mat1) ) / ( n - k )
  pamela <- det(Sp)  ## determinant of the pooled covariance matrix
  test1 <- sum( (nu - 1) * log(pamela/pame) )
  gama1 <- ( 2 * (p^2) + 3 * p - 1 ) / ( 6 * (p + 1) * (k - 1) )
  gama2 <- sum( 1/(nu - 1) ) - 1/(n - k)
  gama <- 1 - gama1 * gama2
  test <- gama * test1  ## this is the M (test statistic)
  dof <- 0.5 * p * (p + 1) * (k - 1)  ## degrees of freedom of
  ## the chi-square distribution
  pvalue <- pchisq(test, dof, lower.tail = FALSE)  ## p-value
  crit <- qchisq(1 - a, dof)  ## critical value of chi-square distribution
  result <- c(test, pvalue, dof, crit)
  names(result) <- c('M.test', 'p-value', 'df', 'critical')
  result
}
