% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/resampling.R
\name{loo_to_est}
\alias{loo_to_est}
\title{Turn leave-one-out estimates to per-block estimates}
\usage{
loo_to_est(arr, block_lengths = NULL)
}
\arguments{
\item{arr}{3d array with blocked estimates, with blocks in the 3rd dimension.}

\item{block_lengths}{Optional block lengths. If \code{NULL}, will be parsed from 3rd dimnames in blocks}
}
\value{
A 3d array with leave-one-out estimates for jackknife. Dimensions are equal to those of \code{arr}.
}
\description{
Inverse of \code{\link{est_to_loo}}
This works for any statistics which, when computed across \code{N} blocks, are equal
to the weighted mean of the statistics across the \code{N} blocks.
}
\seealso{
\code{\link{est_to_loo}}
}
