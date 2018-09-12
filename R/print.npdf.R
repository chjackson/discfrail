##' Print output from a fitted nonparametric discrete frailty model
##'
##' This function plots Kaplan-Meier estimates of the survival for each fitted latent population. 
##'
##' @param x A fitted nonparametric discrete frailty model, as returned by \code{\link{pdf_cox(...,estK=FALSE)}}
##'
##' @param digits Number of significant digits to present, by default \code{max(1, getOption("digits") - 4)}
##'
print.npdf <- function(x, digits = NULL, ...){
    if (is.null(digits))
        digits <- max(1, getOption("digits") - 4)
    if (!is.null(x$call))
        cat("\nCall:\n", paste(deparse(x$call), sep = "\n", collapse = "\n"), 
            "\n", sep = "")
    with(x, {
        cat(sprintf("\nNonparametric discrete frailty Cox model fit with K=%s latent populations\n\n", K))
        est <- c(beta, p, w[-1])
        cat("Estimated parameters and standard errors:\n")
        res <- data.frame(est=est)
        if (!is.null(seLouis))
            res <- cbind(res, seLouis, seRich, seExact)
        fitstr <- sprintf("Log-likelihood %s, AIC %s, BIC %s", llik, BIC, AIC)
        print(res, digits=digits)
        cat("\n")
        cat("Log-likelihood:", format(llik, digits=digits), "\n")
        cat("AIC:", format(AIC, digits=digits), "\n")
        cat("BIC:", format(llik, digits=digits), "\n")
    })
    invisible(x)
}

##' Print output from a nonparametric discrete frailty modelling procedure with automatic model selection. 
##'
##' @param x An object returned by \code{\link{npdf_cox(...,estK=TRUE)}}, containing a list of fitted nonparametric discrete frailty models
##'
##' @param digits Number of significant digits to present, by default \code{max(1, getOption("digits") - 4)}
##'
print.npdflist <- function(x, digits=NULL, ...){
    if (is.null(digits))
        digits <- max(1, getOption("digits") - 4)
    with(x, {
        cat("\nCall:\n", paste(deparse(call), sep = "\n", collapse = "\n"), 
            "\n", sep = "")
        cat("\nModel comparison:\n")
        print(comparison)
        cat("Optimal K:\n")
        print(Kopt)
        crit <- if (criterion=="Laird") "Laird criterion" else criterion
        cat("\nBest model according to ", crit, ":", sep="")
        print(models[[Kopt[criterion]]])
        cat("\nTo examine other models, look at `models` component\n")
    })
    invisible(x)
}