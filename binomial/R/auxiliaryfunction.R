#private auxiliary function to calculate the mean
aux_mean <- function(n,p){
  aux_mean <- n*p
  return(aux_mean)
}

#private auxiliary function to calculate the variance
aux_variance <- function(n,p){
  aux_variance <- n * p * (1-p)
  return(aux_variance)
}

#private auxiliary function to calculate the mode
aux_mode <- function(n,p){
  m <- n * p + p
  if(m == floor(m)){
    aux_mode <- c(m,m-1)
    return(aux_mode)
  }else{
    aux_mode <- floor(m)
    return(aux_mode)
  }
}

#private auxiliary function to calculate the skewness
aux_skewness <- function(n, p){
  aux_skewness <- (1 - 2 * p) / sqrt(n * p * (1-p))
  return(aux_skewness)
}

#private auxiliary function to calculate the kurtosis
aux_kurtosis <- function(n, p){
  aux_kurtosis <- (1 - 6 * p * (1 - p)) / (n * p * (1-p))
  return(aux_kurtosis)
}

