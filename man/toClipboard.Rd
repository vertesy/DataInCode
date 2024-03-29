% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataInCode.R
\name{toClipboard}
\alias{toClipboard}
\title{toClipboard}
\usage{
toClipboard(x, sep = "\\t", header = FALSE, row.names = FALSE, col.names = F)
}
\arguments{
\item{x}{PARAM_DESCRIPTION}

\item{sep}{PARAM_DESCRIPTION, Default: ' '}

\item{header}{PARAM_DESCRIPTION, Default: FALSE}

\item{row.names}{PARAM_DESCRIPTION, Default: FALSE}

\item{col.names}{PARAM_DESCRIPTION, Default: F}
}
\description{
Copy an R-object to your clipboard on OS X.
}
\examples{
MyVec = c(1:3); toClipboard(MyVec)
}
