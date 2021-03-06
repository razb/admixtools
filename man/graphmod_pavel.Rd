% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toposearch.R
\name{graphmod_pavel}
\alias{graphmod_pavel}
\title{Return all graphs created from permuting a subclade}
\usage{
graphmod_pavel(basegraph, addpops, connection_edge, source_nodes)
}
\arguments{
\item{basegraph}{an admixture graph as igraph object. (convert from edge list using \code{igraph::graph_from_edgelist})}

\item{addpops}{a vector of population labels which are not in \code{basegraph}. These populations should form a clade. All possible trees will be generated and those trees will be attached to \code{basegraph}.}

\item{connection_edge}{edge in \code{basegraph} where the tree made from \code{addpops} should be attached}

\item{source_nodes}{nodes in \code{basegraph}. edges above these nodes will be added and attached to all terminal edges leading to \code{addpops}}
}
\description{
generates new graphs from basegraph as follows:
\enumerate{
\item generates all possible trees using \code{addpops} (which are not in basegraph)
\item attaches trees to connection_edge, which is defined by two nodes in basegraph
\item adds edges originating above each edge in \code{source_node}, to each node above \code{addpops}
}
}
\examples{
\dontrun{
graphlist = graphmod_pavel(example_igraph, addpops = c('pop1', 'pop2', 'pop3'),
                           connection_edge = c('N2N0', 'N1N'),
                           source_nodes = c('Denisova.DG', 'N2N2'))
results = tibble(graph = graphlist) \%>\%
  mutate(res = map(graph, ~qpgraph(example_f2_blocks, .))) \%>\%
  unnest_wider(res) \%>\%
  mutate(worstz = map_dbl(f3, ~max(abs(.$z))))
}
}
