\name{text}
\alias{text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
text(..., url, popup, pcol = c(0, 1, 1), border = c(0, 0, 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{ ~~Describe \code{\dots} here~~ }
  \item{url}{ ~~Describe \code{url} here~~ }
  \item{popup}{ ~~Describe \code{popup} here~~ }
  \item{pcol}{ ~~Describe \code{pcol} here~~ }
  \item{border}{ ~~Describe \code{border} here~~ }
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  ~Describe the value returned
  If it is a LIST, use
  \item{comp1 }{Description of 'comp1'}
  \item{comp2 }{Description of 'comp2'}
  ...
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
function(..., url, popup, pcol = c(0,1,1), border=c(0,0,1))
{
    graphics::text(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{aplot}
