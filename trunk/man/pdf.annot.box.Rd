\name{pdf.annot.box}
\alias{pdf.annot.box}
\title{Internal function to do ... ~~ }
\description{
  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pdf.annot.box(xleft, ybottom, xright, ytop, annotation_text, coord = "USER")
}
\arguments{
  \item{xleft}{left x coordinate(s) of the box}
  \item{ybottom}{bottom y coordinate(s) of the box}
  \item{xright}{right x coordinate(s) of the box}
  \item{ytop}{top y coordinate(s) of the box}
  \item{annotation_text}{ ~~Describe \code{annotation_text} here~~ }
  \item{coord}{coordinate system; defaults to "USER"}
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
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\note{
  This function is an internal function that is not exported into
  the \code{pdf2} name space. It is documented for purposes of completeness.
}
\seealso{See \code{\link{pdf.box}}, \code{\link{pdf.text}} and 
  \code{\link{pdf.text.info}} for other documented internal functions.}
\keyword{device}
