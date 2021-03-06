% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{weibdata20}
\alias{weibdata20}
\title{Hierarchical time-to-event data simulated from a Weibull baseline distribution with a nonparametric frailty}
\format{A data frame with 600 rows and the following columns 

\describe{
\item{family}{Integer from 1 to 20 indicating the group membership. Each group has 30 individuals.}
\item{time}{Survival time}
\item{status}{Indicator for an observed event at the survival time}
\item{x}{Covariate value, generated from a standard normal distribution}
\item{belong}{Underlying group-specific frailty value}
}

There are two underlying latent populations with proportion 0.6 and 0.4 with frailty values 0.8 and 1.6 respectively, thus the second population has twice the hazard of the first.  The covariate is associated with a log hazard ratio of 1.6. 

The baseline hazard is set to that of a Weibull model, as done through the inverse cumulative hazard in the function below.

The dataset was generated by \code{\link{sim_npdf}} as follows.

\code{sim_npdf( N=20,
                S=30,
                beta=1.6,
                Lambda_0_inv = function( t, c=0.01, d=4.6 ) ( t^( 1/d ) )/c,
                p=c(0.6, 0.4),
                w_values = c(0.8, 1.6) )}}
\usage{
weibdata20
}
\description{
Hierarchical time-to-event data simulated from a Weibull baseline distribution with a nonparametric frailty
}
\keyword{datasets}
