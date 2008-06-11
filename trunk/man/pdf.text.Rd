\name{pdf.text}
\alias{pdf.text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pdf.text(text = "", link = TRUE, col = c(0, 1, 1), border = c(0, 0, 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{text}{ ~~Describe \code{text} here~~ }
  \item{link}{ ~~Describe \code{link} here~~ }
  \item{col}{ ~~Describe \code{col} here~~ }
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
function(text="", link=TRUE, col=c(0,1,1), border=c(0,0,1))
{
    geo <- pdf.text.info()
    m <- matrix(c(geo[2], geo[3], -geo[3], geo[2]), nrow=2)/geo[1]
    x <- cbind(c(0, -geo[8]), c(0, geo[7]),
               c(geo[6], -geo[8]), c(geo[6], geo[7]))
    xx <- m \%*\% x + c(geo[4], geo[5])
    pdf.box(min(xx[1,]), min(xx[2,]), max(xx[1,]), max(xx[2,]), text, link,
            col, border, "DEVICE")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{aplot}
