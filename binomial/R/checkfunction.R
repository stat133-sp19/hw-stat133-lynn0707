#private function to check the probability value
check_prob <- function(p){
  if (p <= 1 &  p >= 0){
    return(TRUE)
  }else{
    stop("invalid pro value")
  }
}

#private function to check the number of trials
check_trials <- function(n){
  if (n == floor(n) & n >= 0){
    return(TRUE)
  }else{
    stop("invalid trials value")
  }
}

#praivate function to check the nuber of successes
check_success <- function(k,n){
  if(any(k != floor(k) | k < 0)){
    stop("invalid success value")
   }else if(any(k > n)){
    stop("success cannot be greater than trials")
  }else{
    return(TRUE)
  }
}
