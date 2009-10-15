\name{pdf.box}
\alias{pdf.box}
\title{Internal Function to Draw a Pop-up Text Box}
\description{
  Internal function that will draw a pop-up text box on the current device.
}
\usage{
pdf.box(xleft, ybottom, xright, ytop, text = "", link = TRUE, col = "cyan", border = c(0, 0, 1), coord="USER"), pdf.options=NULL
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
  \item{pdf.options}{a vector (or scalar) of PDF script}
}
\value{
  pop-up boxes are drawn on the current device
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\note{
  This function is an internal function that is not exported into
  the \code{pdf2} name space. It is documented for purposes of completeness.
}
\seealso{See \code{\link{pdf.annot.box}}, \code{\link{pdf.text}} and 
  \code{\link{pdf.text.info}} for other documented internal functions.}
\keyword{aplot}
