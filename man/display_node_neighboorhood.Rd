% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/display_node_neighboorhood.R
\name{display_node_neighboorhood}
\alias{display_node_neighboorhood}
\title{display_node_neighboorhood}
\usage{
display_node_neighboorhood(central_node, sif, att, n = 100)
}
\arguments{
\item{central_node}{character or character vector; node ID(s) around which a network will be branched out untill meansurments and input are reached}

\item{sif}{df; COSMOS network solution in sif format, as returned by the format_cosmos_res function}

\item{att}{df; attributes of the nodes of the COMSOS network solution, as returned by the format_cosmos_res function}

\item{n}{numeric; maximum number of steps in the network to look for inputs and measurments}
}
\value{
a visnetwork object
}
\description{
display input and measurements within n steps of a given set of nodes
}
