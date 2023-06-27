gerar_dados_rl <- function(m1=NULL,
                           m2=NULL,
                           m3=NULL,
                           n=10)
{
  stopifnot(is.numeric(m1) &
            is.numeric(m2) &
            is.numeric(m3))

  set.seed(sum(m1,
               m2,
               m3))

  X <- seq(0, 10, length=n)
  Y <- 1.0393 + 1.4678*X + rnorm(n)

  res <- data.frame(X,
                    Y)

  invisible(res)
}