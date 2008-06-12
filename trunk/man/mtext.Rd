\name{mtext}
\alias{mtext}
\title{Write Text into the Margins of a Plot}
\description{
  This is a wrapper around the \code{mtext} function of the
  \code{graphics} package allowing to add pop-ups and / or
  hyperlinks for the pdf device.
}
\usage{
mtext(..., url, popup, pcol = c(0, 1, 1), border = c(0, 0, 1))
}
\arguments{
  \item{\dots}{arguments for the \code{mtext} function of the
    \code{graphics} package; see its help page}
  \item{url}{URL to which the hyperlink will point}
  \item{popup}{text for the pop-up that will be displayed when
               one hovers over the (\code{mtext}) text}
  \item{pcol}{ ~~Describe \code{pcol} here~~ }
  \item{border}{ ~~Describe \code{border} here~~}
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  The given text is written onto the current plot with
  the hyperlink and / or pop-up specified.
}
\references{ ~put references to the literature/web site here ~ }
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (..., url, popup, pcol = c(0,1,1), border=c(0,0,1))
{
    graphics::mtext(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border)
    }
  }
}
\keyword{aplot}
