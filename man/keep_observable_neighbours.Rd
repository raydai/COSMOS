% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/keep_downstream_neighbours.R
\name{keep_observable_neighbours}
\alias{keep_observable_neighbours}
\title{keep observable neighbors}
\usage{
keep_observable_neighbours(network, n_steps, observed_nodes)
}
\arguments{
\item{network}{network in 3 column data.frame format
(source, interaction, target)}

\item{n_steps}{largest distance t consider}

\item{observed_nodes}{names of the measured nodes in the network}
}
\description{
keeps the nodes in network that are no more then n_steps upstreams from the 
measured nodes
}
