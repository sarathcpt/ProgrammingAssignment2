## A set of functions to compute and cache the inverse of a matrix
## 

## This function can cache the inverse of a matrix
makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y){
  x <<- y
  m <<-NULL
}
  get <- function()x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function()i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of matrix returned by makeCachematrix above. It will retrieve data
## from cache if inverse was computed before and the input matrix hasn't changed values.
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)){
          message("getting cached data")
          return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}
