## Basic caching of matrix inverse operation

## Generate cacheable matrix

makeCacheMatrix <- function(x = matrix()) {
	cache <- NULL
	set <- function(mat) {
		cache <<- NULL
		x <<- mat
	}
	get <- function() x
	setinv <- function(inv) cache <<- inv
	getinv <- function() cache
	list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Get cached inverse matrix value

cacheSolve <- function(x, ...) {
        cached <- x$getinv()
        if (!is.null(cached)) {
        	message("Use cached")
        	return(cached)
        }
        message("Cache miss")
        cached <- solve(x$get(), ...)
        x$setinv(cached)
        cached
}

# matr <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2))
# cacheSolve(matr)
# cacheSolve(matr)
# matr$set(matrix(c(5, 6, 7, 8), nrow = 2, ncol = 2))
# cacheSolve(matr)
# cacheSolve(matr)