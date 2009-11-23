\name{pdf}
\alias{pdf}
\alias{pdf2}
\title{PDF Graphics Device with Pop-up Strings and Hyperlinks}
\description{
  This device offers extended functionality for the PDF
  device allowing to embed Pop-up Strings and Hyperlinks
  for the \code{rect}, \code{text} and \code{mtext} functions. 
}
\usage{
pdf(file = ifelse(onefile, "Rplots.pdf", "Rplot\%03d.pdf"), width, height, onefile, family, title, fonts, version, paper, encoding, bg, fg, pointsize, pagecentre)
pdf2(file = ifelse(onefile, "Rplots.pdf", "Rplot\%03d.pdf"), width, height, onefile, family, title, fonts, version, paper, encoding, bg, fg, pointsize, pagecentre)
}
\arguments{
  \item{file}{a character string giving the name of the file.
    For use with \code{onefile=FALSE} give a C integer format such
    as \code{"Rplot\%03d.pdf"} (the default in that case).
    (See \code{\link{postscript}} for further details.)
  }
  \item{width, height}{the width and height of the graphics region in
    inches.  The default values are \code{7}.}
  \item{onefile}{logical: if true (the default) allow multiple figures
    in one file.  If false, generate a file wiht name containing the page
    number for each page.  Defaults to \code{TRUE}.}
  \item{family}{the font family to be used, see
    \code{\link{postscript}}.  Defaults to \code{"Helvetica"}.}
  \item{title}{title string to embed as the \code{/Title} field in the
    file.  Defaults to \code{"R Graphics Output"}.}
  \item{fonts}{a character vector specifying \R graphics font family
    names for fonts which will be included in the PDF file.  Defaults to
    \code{NULL}.}
  \item{version}{a string describing the PDF version that will be
    required to view the output.  This is a minimum, and will be
    increased (with a warning) if necessary.  Defaults to \code{"1.4"},
    but see \sQuote{Details}.}
  \item{paper}{the target paper size.  The choices are
    \code{"a4"}, \code{"letter"}, \code{"legal"} (or \code{"us"}) and
    \code{"executive"} (and these can be capitalized), or \code{"a4r"}
    and \code{"USr"} for rotated (\sQuote{landscape}).
    The default is \code{"special"}, which means that the \code{width}
    and \code{height} specify the paper size.  A further choice is
    \code{"default"}; if this is selected, the
    papersize is taken from the option \code{"papersize"}
    if that is set and as \code{"a4"} if it is unset or empty.
    Defaults \code{"special"}.
  }
  \item{encoding}{the name of an encoding file.  See
    \code{\link{postscript}} for details.  Defaults to \code{"default"}.}
  \item{bg}{the initial background color to be used.  Defaults to
    \code{"transparent"}.}
  \item{fg}{the initial foreground color to be used.  Defaults to
   \code{"black"}.}
  \item{pointsize}{the default point size to be used.  Strictly
    speaking, in bp, that is 1/72 of an inch, but approximately in
    points.  Defaults to \code{12}.}
  \item{pagecentre}{logical: should the device region be centred on the
    page? -- is only relevant for \code{paper != "special"}.  Defaults
    to true.}
}
\details{
  \code{pdf2} is offered as a synonym for \code{pdf}. 
  
  More details on the functionality of the \code{pdf} device 
  can be found in the help page of \code{\link[grDevices]{pdf}},
  which is only extended in the \code{pdf2} package.
}
\author{Tadashi Kadowaki, R Development Core Team and contributors worldwide}
\seealso{See \code{\link[grDevices]{pdf}} for more on the PDF device, and
  \code{\link[pdf2]{rect}}, \code{\link[pdf2]{text}} and \code{\link[pdf2]{mtext}} 
  for the details of how to add pop-up strings and hyperlinks.}
\keyword{device}
