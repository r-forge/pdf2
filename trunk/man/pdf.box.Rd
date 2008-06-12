\name{pdf.box}
\alias{pdf.box}
\title{Draw a Pop-up Text Box}
\description{
  Function that will draw a pop-up text box on the current device.
}
\usage{
pdf.box(x0, y0, x1, y1, text = "", link = TRUE, col = c(0, 1, 1), border = c(0, 0, 1), coord = "USER")
}
\arguments{
  \item{x0}{bottom left x coordinate of the box}
  \item{y0}{bottom left y coordinate of the box}
  \item{x1}{top right x coordinate of the box}
  \item{y1}{top right y coordinate of the box}
  \item{text}{text to be displayed in the pop-up}
  \item{link}{boolean indicating whether clicking in the region
    of the pop-up box should open a hyperlink that is specified
    in the text argument; defaults to \code{TRUE}}
  \item{col}{ ~~Describe \code{col} here~~ }
  \item{border}{ ~~Describe \code{border} here~~ }
  \item{coord}{ ~~Describe \code{coord} here~~ }
}
\details{
  ~~ If necessary, more details than the description above ~~
}
\value{
  pop-up boxes are drawn on the current device
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\note{ ~~further notes~~ 

 ~Make other sections like Warning with \section{Warning }{....} ~
}
\seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\keyword{aplot}
