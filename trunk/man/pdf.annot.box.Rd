\name{pdf.annot.box}
\alias{pdf.annot.box}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pdf.annot.box(x0, y0, x1, y1, annotation_text, coord = "USER")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x0}{ ~~Describe \code{x0} here~~ }
  \item{y0}{ ~~Describe \code{y0} here~~ }
  \item{x1}{ ~~Describe \code{x1} here~~ }
  \item{y1}{ ~~Describe \code{y1} here~~ }
  \item{annotation_text}{ ~~Describe \code{annotation_text} here~~ }
  \item{coord}{ ~~Describe \code{coord} here~~ }
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
function(x0, y0, x1, y1, annotation_text, coord="USER")
{
    if (names(dev.cur())[1] == "pdf") {
        .External(PDFAnnotBox, x0, y0, x1, y1,
                  as.character(annotation_text[1]), as.character(coord[1]))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{device}
