% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrappers.R
\name{pseudo_dates}
\alias{pseudo_dates}
\title{Get pseudo dates for graph nodes}
\usage{
pseudo_dates(graph, time = 1)
}
\arguments{
\item{graph}{An admixture graph}

\item{time}{Scalar by which y-coordinate values will be multiplied to get dates}
}
\value{
A named vector with pseudo dates for each graph node
}
\description{
This function assigns a date to each node in an admixture graph and is used in \code{\link{msprime_sim}}. The date will correspond to the y-coordinate of each node used for plotting in \code{\link{plotly_graph}}. Because it appears to be necessary for simulations in msprime that at least one leaf node has time 0, the first leaf node returned by \code{\link{get_leafnames()}} will be set to 0.
}
