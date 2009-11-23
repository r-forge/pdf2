\name{rect}
\alias{rect}
\title{Draw One or More Rectangles}
\description{
  This is a wrapper around the \code{rect} function of the
  \code{graphics} package allowing to add pop-ups and / or
  hyperlinks for the pdf device.
 
  \code{rect} draws a rectangle (or sequence of rectangles) with the
  given coordinates, fill and border colors.
}
\usage{
rect(xleft, ybottom, xright, ytop, ..., url, popup, annot.options=NULL, annot.func=NULL)
}
\arguments{
  \item{xleft}{a vector (or scalar) of left x positions.}
  \item{ybottom}{a vector (or scalar) of bottom y positions.}
  \item{xright}{a vector (or scalar) of right x positions.}
  \item{ytop}{a vector (or scalar) of top y positions.}
  \item{\dots}{other arguments to be passed to the
    \code{rect} function of the \code{graphics} package}
  \item{url}{URL(s) to which the hyperlink(s) will point}
  \item{popup}{text(s) for the pop-up(s) that will be displayed when
               one hovers over the (\code{mtext}) text(s)}
  \item{annot.options}{a vector (or scalar) of PDF script}
  \item{annot.func}{user-defined function to generate PDF script}
}
\value{
  The given rectangle(s) are written onto the current plot with
  the hyperlink(s) and / or pop-up(s) specified.
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\seealso{See Also \code{\link[graphics]{rect}}, \code{\link{mtext}} and \code{\link{text}}.}
\keyword{aplot}
