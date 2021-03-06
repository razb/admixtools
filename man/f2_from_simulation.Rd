% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrappers.R
\name{f2_from_simulation}
\alias{f2_from_simulation}
\title{Simulate an admixture graph in msprime}
\usage{
f2_from_simulation(..., blgsize = 0.05, cleanup = TRUE, verbose = TRUE)
}
\description{
This function generates an msprime simulation script, executes it in python,
and turns the resulting genotype data into f2-statistics
}
\seealso{
\code{\link{msprime_sim}}
}
