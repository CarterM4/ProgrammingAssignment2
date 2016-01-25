## this first function uses the special <<- operator to cache an object
## (in this case a matrix) so that it can later be computed as inversed

makeCacheMatrix <- function(x = matrix()) {
  inv<- NULL
  set<- function(y){
      x<<-y
      inv<<-NULL
  }
  get<-function()x
  setInverse<-function(inverse) inv<<-inverse
  getInverse<-function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  
}


## this function makes it possible to compute the inverse matrix that
## was set up with the previous function

cacheSolve <- function(x, ...) {
        inv<-x$getInverse()
        if(!is.null(inv)){
            message("getting cached data")
            return(inv)
        }
        mat<-x$get()
        inv<-solve(mat,...)
        X$setInverse(inv)
        inv
}
