\name{mtext}
\alias{mtext}
\title{Write Text into the Margins of a Plot}
\description{
  This is a wrapper around the \code{mtext} function of the
  \code{graphics} package allowing to add pop-ups and / or
  hyperlinks for the pdf device.
}
\usage{
mtext(..., url, popup, pcol = "cyan", border = c(0, 0, 1))
}
\arguments{
  \item{\dots}{arguments for the \code{mtext} function of the
    \code{graphics} package; see its help page}
  \item{url}{URL to which the hyperlink will point}
  \item{popup}{text for the pop-up that will be displayed when
               one hovers over the (\code{mtext}) text}
  \item{pcol}{color of the border around the text that is often
        used to indicate there is a link; defaults to "cyan"}
  \item{border}{horizontal corner radius, vertical corner radius, and border width}
}
\value{
  The given text is written onto the current plot with
  the hyperlink and / or pop-up specified.
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\seealso{\code{\link[graphics]{mtext}}}
\keyword{aplot}
