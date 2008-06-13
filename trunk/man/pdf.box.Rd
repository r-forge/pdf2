\name{pdf.box}
\alias{pdf.box}
\title{Draw a Pop-up Text Box}
\description{
  Function that will draw a pop-up text box on the current device.
}
\usage{
pdf.box(xleft, ybottom, xright, ytop, text = "", link = TRUE, col = c(0, 1, 1), border = "cyan")
}
\arguments{
  \item{xleft}{left x coordinate(s) of the box}
  \item{ybottom}{bottom y coordinate(s) of the box}
  \item{xright}{right x coordinate(s) of the box}
  \item{ytop}{top y coordinate(s) of the box}
  \item{text}{text(s) to be displayed in the pop-up}
  \item{link}{boolean indicating whether clicking in the region
    of the pop-up box should open a hyperlink that is specified
    in the text argument; defaults to \code{TRUE}}
  \item{col}{color(s) of border(s); defaults to "cyan"}
  \item{border}{horizontal corner radius, vertical corner radius, and border width}
  \item{coord}{coordinate system; defaults to "USER"}
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
