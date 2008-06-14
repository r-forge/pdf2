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
rect(xleft, ybottom, xright, ytop, ..., url, popup)
}
\arguments{
  \item{xleft}{a vector (or scalar) of left x positions.}
  \item{ybottom}{a vector (or scalar) of bottom y positions.}
  \item{xright}{a vector (or scalar) of right x positions.}
  \item{ytop}{a vector (or scalar) of top y positions.}
  \item{\dots}{other arguments to be passed to the
    \code{rect} function of the \code{graphics} package}
  \item{url}{ ~~Describe \code{url} here~~ }
  \item{popup}{ ~~Describe \code{popup} here~~ }
}
\value{
  The given rectangles are written onto the current plot with
  the hyperlinks and / or pop-ups specified.
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\seealso{See Also \code{\link{mtext}}, \code{\link{text}}}
\keyword{aplot}
