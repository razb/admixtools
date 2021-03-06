% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrappers.R
\name{qpf4ratio_wrapper}
\alias{qpf4ratio_wrapper}
\title{Wrapper function around the original qpF4ratio program}
\usage{
qpf4ratio_wrapper(
  pref,
  pops,
  bin = "~np29/o2bin/qpF4ratio",
  outdir = ".",
  parfile = NULL,
  blgsize = 0.05,
  fancyf4 = "YES",
  printonly = FALSE,
  env = "",
  verbose = TRUE
)
}
\arguments{
\item{pref}{Path to and prefix of the packedancestrymap genotype files}

\item{pops}{A vector of five populations, or a 5 x n matrix with population names. For each line \code{alpha} will be computed as \verb{f4(1,2; 3,4)/f4(1,2; 5,4)}}

\item{bin}{Path to the qpF4ratio binary file}

\item{outdir}{Output directory. files \code{out}, \code{parfile}, \code{poplistname},
\code{popfilename} may be overwritten}

\item{parfile}{qpF4ratio parameter file. If this is specified, \code{pops} will be ignored.}

\item{blgsize}{blgsize}

\item{fancyf4}{fancyf4}

\item{printonly}{Should the command be printed or executed?}

\item{env}{Export environmental variables. See examples.}

\item{verbose}{Print progress updates}
}
\value{
If \code{printonly}, the \code{qpF4ratio} command, otherwise a data frame with parsed \code{qpF4ratio} output
}
\description{
This requires a working installation of qpF4ratio, which will be called using \code{\link{system}}
}
\examples{
\dontrun{
pops = c('Denisova.DG', 'Altai_Neanderthal.DG', 'Vindija.DG', 'Chimp.REF', 'Mbuti.DG')
qpf4ratio_wrapper('genotype_prefix', pops, bin = 'path/to/qpDstat')
}
}
