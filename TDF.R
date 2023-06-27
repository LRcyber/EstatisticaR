gerar_tdf <- function(m1=NULL,
                      m2=NULL,
                      m3=NULL)
{
  stopifnot(is.numeric(m1) &
            is.numeric(m2) &
            is.numeric(m3))

  set.seed(sum(m1,
               m2,
               m3))

  classes <- c("[10, 020)",
               "[20, 030)",
               "[30, 040)",
               "[40, 050)",
               "[50, 060)",
               "[60, 070)",
               "[70, 080)",
               "[80, 090)",
               "[90, 100)")

  X <- c(seq(f=10, 
             t=50, 
             b=10), 
         seq(f=40, 
             t=10, 
             b=-10))

  Y <- sample(1:3,
              length(X),
              rep=T)

  f <- (X - Y)


  rfp <- round(100*f/sum(f),
               2)

  cfp <- round(100*cumsum(f/sum(f)),
               2)

  res <- data.frame(classes,
                    f,
                    rfp,
                    cfp)

  names(res) <- c('Classes',
                  'f',
                  'rf(%)',
                  'cf(%)')

  invisible(res)
}
