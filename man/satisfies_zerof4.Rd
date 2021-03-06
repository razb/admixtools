% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toposearch.R
\name{satisfies_zerof4}
\alias{satisfies_zerof4}
\title{Test f4 constraints on a graph}
\usage{
satisfies_zerof4(graph, nonzero_f4)
}
\arguments{
\item{graph}{An admixture graph}

\item{nonzero_f4}{A data frame or matrix with four columns. One row for each f4-statistic which is
observed to be significantly non-zero}
}
\value{
\code{TRUE} if all constraints are satisfied, else \code{FALSE}
}
\description{
This function returns \code{TRUE} if and only if the admixture graph is compatible with
the f4-statistics listed in \code{nonzero_f4} being non-zero
}
\examples{
\dontrun{
# Test whether f4(A,B; C,D) is expected to be non-zero in this graph:
constrain_f4 = matrix(c('A', 'B', 'C', 'D'), 1)
satisfies_zerof4(random_admixturegraph(5, 2), constrain_f4)
}
}
