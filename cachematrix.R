## Put comments here that give an overall description of what your
## functions do

##    1.set the value of the special "matrix" object
##    2.get the value of the special "matrix" object
##    3.set the value of the inverse
##    4.get the value of the inverse 

makeCacheMatrix <- function(x = matrix()){
  w <- NULL
  set <- function(y){
    x <<- y
    w <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) w <<- inverse
  getInverse <- function() w
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
  
}


## the func first checks if the inverse is not null.
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it does the calculation.

cacheSolve <- function(x, ...) {
  w <- x$getInverse()
  if(!is.null(w)){
    message("getting cached data")
    return(w)
  }
  mat <- x$get()
  w <- solve(mat,...)
  x$setInverse(w)
  w
}
