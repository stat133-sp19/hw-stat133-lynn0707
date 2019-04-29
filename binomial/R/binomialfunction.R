#' @title Binomal choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param k the vector of successes
#' @param n the number of trials
#' @return computer the number of combinations in which k successes can occur in n trials
#' @export
#' @examples
#' Calcualte the number of combinations in which k successes can occur in n trials
#' How many combinations when choosing 2 successes in 5 trials?
#' bin_choose(n = 5, k = 2)
#' How many combinations when choosing 0 successes in 5 trials?
#' bin_choose(5, 0)


bin_choose <- function(n,k){
  if (any(k > n)){
      stop("k cannot be greater than n")
  }
  choose<- factorial(n) / (factorial(k) * factorial(n -k))
  bin_choose <- as.vector(sapply(n,choose,k))
  return(bin_choose)
}


#' @title Binomal probability
#' @description calculates the probabality of having k successes with probability p in n trials
#' @param k the vector of successes
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the probability of having k successes with probability p in n trials
#' @export
#' @examples
#' what is the probability of getting 2 successes in 5 trials? (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' what are the probabilities of getting 2 or less successes in 5 trials? (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)

bin_probability <- function(n, k, p){
  check_trials(n)
  check_prob(p)
  check_success(k,n)
  bin_probability <- bin_choose(n, k) * p^k *(1-p)^(n-k)
  return(bin_probability)
}


#' @title Binomal distribution
#' @description list the probabality of each successe with probability p in n trials
#' @param p the probability of successes
#' @param n the number of trials
#' @return create a data frame of a binomal probability distribution
#' @return create a barplot of a binomal probability distribution
#' @export
#' @examples
#' # list a binomial probability distribution
#' dis1 <- bin_distribution(n= 5, p = 0.5)
#' # show a barplot of a binomial probability distribution
#' plot(dis1)

bin_distribution <- function(n,p){
  k <- 0:n
  probability <- bin_probability(n,k,p)
  dat <- data.frame(k, probability)
  class(dat) <- c("bindis", "data.frame")
  return(dat)
}

#' @export
plot.bindis <- function(x){
  barplot(x$probability,
          xlab = "successes", ylab ="probability",
          names.arg = x$k)
}


#' @title Binomal cumulative
#' @description list the  cumilative probabality of each successe with probability p in n trials
#' @param p the probability of successes
#' @param n the number of trials
#' @return create a data frame of cumilative  probability of a binomial probability distribution
#' @return create a line graph of cumilative  probability of a binomial probability distribution
#' @export
#' @examples
#' # list a binomial cumilative probability distribution
#' dis2 <- bin_cumulative(n = 5, p = 0.5)
#' # show a line graph of a binomial cumilative  probability distribution
#' plot(dis2)

bin_cumulative <- function(n,p){
  datcu <- bin_distribution(n,p)
  cumulative <- vector()
  for (i in 1: (n+1)){
    cumulative[i] <- sum(datcu$probability[1:i])
  }
    datcu$cumulative <-  cumulative
    class(datcu) <- c("bincum","data.frame")
    return(datcu)
}

#' @export
plot.bincum <- function(x){
  plot(x$k, x$cumulative, type = "p",
       xlab = "successes", ylab ="probability")
  lines(x$k, x$cumulative)
}


#' @title Binomal variable
#' @description summarize a binomal random variable
#' @param p the probability of successes
#' @param n the number of trials
#' @return create a summary of a binomal random variable
#' @export
#' @examples
#' # Bulid a binomial variable
#'  bin1 <- bin_variable(trials = 10, p = 0.3)
#' # Summarize a binomial variable
#' binsum1 <- summary(bin1)
#' # Print the statistics
#' binsum1


bin_variable <- function (n, p){
  check_trials(n)
  check_prob(p)
  object <- list(
    trials = n,
    prob = p
  )
  class(object) <- "binvar"
  return(object)
}

#' @export
print.binvar <- function(x){
  cat('"Binomail variable"\n\n')
  cat('Parameters\n')
  cat(sprintf("- number of trials: %s", x$trials), "\n")
  cat(sprintf("- prob of success : %s", x$prob ), "\n")
}

#' @export
summary.binvar <- function(x){
  object <- list(
    trials = x$trials,
    prob = x$prob,
    mean = aux_mean(x$trials, x$prob),
    variance = aux_variance(x$trials,x$prob),
    mode = aux_mode(x$trials,x$prob),
    skewness = aux_skewness(x$trials,x$prob),
    kurtosis = aux_kurtosis(x$trials,x$prob))
  class(object) <- "summary.binvar"
  return(object)
}

#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat(sprintf("- number of trials: %s", x$trials), "\n")
  cat(sprintf("- prob of success : %s", x$prob), "\n\n")
  cat('Measures\n')
  cat(sprintf("- mean    : %s", x$mean), "\n")
  cat(sprintf("- variance: %s", x$variance), "\n")
  cat(sprintf("- mode    : %s", x$mode), "\n")
  cat(sprintf("- skewness: %s", x$skewness), "\n")
  cat(sprintf("- kurtosis: %s", x$kurtosis), "\n")
}



#' @title Binomal mean
#' @description calculate the mean of a binomal distribution
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the mean of a binomal distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)

bin_mean <- function(n,p){
  check_trials(n)
  check_prob(p)
  bin_mean <- aux_mean(n,p)
  return(bin_mean)
}


#' @title Binomal variance
#' @description calculate the variance of a binomal distribution
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the variance of a binomal distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(n,p){
  check_trials(n)
  check_prob(p)
  bin_variance <- aux_variance(n,p)
  return(bin_variance)
}


#' @title Binomal mode
#' @description calculate the mode of a binomal distribution
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the mode of a binomal distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(n,p){
  check_trials(n)
  check_prob(p)
  bin_mode <- aux_mode(n,p)
  return(bin_mode)
}

#' @title Binomal skewness
#' @description calculate the skewness of a binomal distribution
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the skewness of a binomal distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(n,p){
  check_trials(n)
  check_prob(p)
  bin_skewness <- aux_skewness(n,p)
  return(bin_skewness)
}


#' @title Binomal kurtosis
#' @description calculate the kurtosis of a binomal distribution
#' @param p the probability of successes
#' @param n the number of trials
#' @return computer the kurtosis of a binomal distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(n,p){
  check_trials(n)
  check_prob(p)
  bin_kurtosis <- aux_kurtosis(n,p)
  return(bin_kurtosis)
}
