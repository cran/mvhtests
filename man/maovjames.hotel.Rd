\name{Relationship between Hotelling's T2 test and James' MANOVA}
\alias{maovjames.hotel}
\title{
Relationship between Hotelling's \eqn{T^2} test and James' MANOVA
}

\description{
Relationship between Hotelling's \eqn{T^2} test and James' MANOVA.
}

\usage{
maovjames.hotel(x, ina)
}

\arguments{
\item{x}{
A matrix containing the Euclidean data of the first group.
}
\item{ina}{
A numerical or factor variable indicating the groups of the data.
}
}

\details{
The relationship for the James two sample test (see the function \code{\link{james.hotel}}) is true for the case of the MANOVA. The estimate of the common mean, \eqn{\pmb{mu}_c} (see the function \code{\link{james}} for the expression of \eqn{\pmb{\mu}_c}), is in general, for \eqn{g} groups, each of sample size \eqn{n_i}, written as
\deqn{
\hat{\pmb{\mu}}_c = \left(\sum_{i=1}^gn_i{\bf S}_i^{-1}\right)^{-1}\sum_{i=1}^gn_i{\bf S}_i^{-1}\bar{{\bf X}}_i.
}

The function is just a proof of the mathematics you will find in Emerson (2009, pg. 76--81) and is again intended for educational purposes.
}

\value{
A list including:
\item{test}{
The value of the test statistic, the sum of the two Hotelling's test statistic using
the common mean.
}
\item{mc}{
The common mean.
}
}

\references{
Emerson S. (2009). Small sample performance and calibration of the Empirical Likelihood method.
PhD thesis, Stanford university.

James G.S. (1954). Tests of Linear Hypothese in Univariate and Multivariate Analysis
when the Ratios of the Population Variances are Unknown. Biometrika, 41(1/2): 19--43.
}

\author{
Michail Tsagris.

R implementation and documentation: Michail Tsagris \email{mtsagris@uoc.gr}.
}

%\note{
%%  ~~further notes~~
%}

\seealso{
\code{\link{hotel2T2}, \link{maovjames}, \link{el.test2}, \link{eel.test2}
}
}

\examples{
maovjames.hotel( as.matrix(iris[, 1:4]), iris[, 5] )
maovjames( as.matrix(iris[, 1:4]), iris[, 5] )
}

