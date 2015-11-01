executions <- 99999

distance <- function(n, min) {

  count <- 0
  for(execution in 1:executions) {
    x <- c(0,0)
    for (i in 1:n) {
      choice <- sample(1:4, size=1, prob=c(0.25,0.25,0.25,0.25), replace=T)
      if(choice == 0) {
        x[1] <- x[1] + 1
      } else {
        if(choice == 1) {
          x[1] <- x[1]- 1
        } else {
          if(choice == 2) {
            x[2] <- x[2] + 1
          } else {
            x[2] <- x[2] - 1
          }
        } 
      }
    }

    if(sqrt( x[1]^2 + x[2]^2) >= min) {
      count <- count + 1
    }
  }
  
  prob <- count / executions
  print(prob)
}