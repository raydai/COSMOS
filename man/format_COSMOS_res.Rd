% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_COSMOS_results.R
\name{format_COSMOS_res}
\alias{format_COSMOS_res}
\title{format_COSMOS_res}
\usage{
format_COSMOS_res(
  cosmos_res,
  metab_mapping,
  gene_mapping = "org.Hs.eg.db",
  measured_nodes,
  omnipath_ptm
)
}
\arguments{
\item{cosmos_res}{results of CARNIVAL run}

\item{metab_mapping}{a named vector with pubchem cid as names and desired metabolite names as values.}

\item{gene_mapping}{by default, use the 'org.Hs.eg.db' to map gene names. Can also be a named vector with entrez gene id as names and desired gene names as values.}

\item{measured_nodes}{vector of nodes that are measured or inputs}

\item{omnipath_ptm}{ptms database from OmnipathR}
}
\description{
formats the network with readable names
}
