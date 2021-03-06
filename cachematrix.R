## function makeCacheMatrix() creates a special "matrix" object that can cache its inverse.
## There are several functions:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}

## cacheSolve() computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve
## should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    m <- x$getInverse()

    ## Return a matrix that is the inverse of 'x' if the inverse has already been calculated and cached.
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }

    ## Calculate the inverse of 'x' if the cached data doesn't exist.
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)

    ## Return a matrix that is the inverse of 'x'
    m
}
