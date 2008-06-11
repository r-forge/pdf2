\name{pdf.box}
\alias{pdf.box}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ ~~function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pdf.box(x0, y0, x1, y1, text = "", link = TRUE, col = c(0, 1, 1), border = c(0, 0, 1), coord = "USER")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x0}{ ~~Describe \code{x0} here~~ }
  \item{y0}{ ~~Describe \code{y0} here~~ }
  \item{x1}{ ~~Describe \code{x1} here~~ }
  \item{y1}{ ~~Describe \code{y1} here~~ }
  \item{text}{ ~~Describe \code{text} here~~ }
  \item{link}{ ~~Describe \code{link} here~~ }
  \item{col}{ ~~Describe \code{col} here~~ }
  \item{border}{ ~~Describe \code{border} here~~ }
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
function(x0, y0, x1, y1, text="", link=TRUE, col=c(0,1,1),
                    border=c(0,0,1), coord="USER")
{
    col <- as.numeric(abs(col))[1:3]
    if (max(col)>1) { col <- col / max(col) }
    border <- as.integer(abs(border))[1:3]
    if (link) {
        annotation_text <-
          paste(paste(c("/C [", col, "]"), collapse=" "),
                paste(c("/Border [", border, "]"), collapse=" "),
                paste("/Subtype /Link /A << /Type /Action /S /URI /URI(",
                      as.character(text[1]), ")>>", sep=""),
                sep="\n")
    } else {
        annotation_text <- 
          paste(paste(c("/C [", col, "]"), collapse=" "),
                paste(c("/Border [", border, "]"), collapse=" "),
                "/Subtype /Square",
                paste("/Contents (", paste(text, collapse="\r"), ")", sep=""),
                "/BS << /Type /Border /W 0 >>",
                sep="\n")
    }
    pdf.annot.box(x0, y0, x1, y1, annotation_text, coord)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{aplot}
