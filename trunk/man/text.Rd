\name{text}
\alias{text}
\title{Add Text to a Plot}
\description{
  This is a wrapper around the \code{text} function of the
  \code{graphics} package allowing to add pop-ups and / or
  hyperlinks for the pdf device.

  'text' draws the strings given in the vector 'labels' at the
  coordinates given by 'x' and 'y'. 'y' may be missing since
  'xy.coords(x,y)' is used for construction of the coordinates.
}
\usage{
text(..., url, popup, pcol = "cyan", border = c(0, 0, 1), annot.options=NULL)
}
\arguments{
  \item{\dots}{arguments for the \code{text} function of the \code{graphics}
    package}
  \item{url}{character vector of length one giving the URL for the hyperlink
    to which the text should point upon clicking}
  \item{popup}{character vector of length one giving the text that should 
    be displayed in the pop-up that appears when hovering over the text}
  \item{pcol}{color of the border around the text that is often
        used to indicate there is a link; defaults to "cyan"}
  \item{border}{horizontal corner radius, vertical corner radius, and border width}
  \item{annot.options}{a vector (or scalar) of PDF script}
}
\value{
  The strings in the 'labels' argument are drawn on the current
  device as specified.
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\seealso{\code{\link[graphics]{text}}}
\keyword{aplot}
