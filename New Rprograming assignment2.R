 RprogramingAssignment2

### Introduction

This second programming assignment will require you to write an R
-function that is able to cache potentially time-consuming computations. For
-example, taking the mean of a numeric vector is typically a fast
+function that is able to cache potentially time-consuming computations.
+For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
                                                                  in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
-Programming Assignment you will take advantage of the scoping rules of the R
-language and how they can be manipulated to preserve state inside of an
-R object.
+Programming Assignment you will take advantage of the scoping rules of
+the R language and how they can be manipulated to preserve state inside
+of an R object.

### Example: Caching the Mean of a Vector

@@ -76,8 +76,8 @@ Write the following functions:
  that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
"matrix" returned by `makeCacheMatrix` above. If the inverse has
-    already been calculated (and the matrix has not changed), then the
-    `cachesolve` should retrieve the inverse from the cache.
+    already been calculated (and the matrix has not changed), then
+    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, 




Make Cache Matrix 
makeCacheMatrix <- function(x = matrix()) {
         inv <- NULL
         set <- function(y) {
                 x <<- y
                inv <<- NULL
                
}
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
         list(set = set
              get = get,
      setInverse = setInverse,
      getInverse = getInverse)
         
}


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
          inv <- x$getInverse()
          if (!is.null(inv)) {
          message("getting cached data")
          return(inv)
      }
              mat <- x$get()
              inv <- solve(mat, ...)
              x$setInverse(inv)
              inv
}