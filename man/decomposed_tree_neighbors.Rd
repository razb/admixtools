% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toposearch.R
\name{decomposed_tree_neighbors}
\alias{decomposed_tree_neighbors}
\title{Find all trees within SPR distance of 1 of all graph component trees}
\usage{
decomposed_tree_neighbors(graph)
}
\arguments{
\item{graph}{An admixture graph}
}
\value{
A data frame with all trees
}
\description{
Returns all trees which can be reached through one iteration of subtree-prune-and-regraft on any graph component tree
}
