% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomialfunction.R
\name{bin_probability}
\alias{bin_probability}
\title{Binomal probability}
\usage{
bin_probability(n, k, p)
}
\arguments{
\item{n}{the number of trials}

\item{k}{the vector of successes}

\item{p}{the probability of successes}
}
\value{
computer the probability of having k successes with probability p in n trials
}
\description{
calculates the probabality of having k successes with probability p in n trials
}
\examples{
what is the probability of getting 2 successes in 5 trials? (assuming prob of success = 0.5)
bin_probability(success = 2, trials = 5, prob = 0.5)
what are the probabilities of getting 2 or less successes in 5 trials? (assuming prob of success = 0.5)
bin_probability(success = 2, trials = 5, prob = 0.5)
}
