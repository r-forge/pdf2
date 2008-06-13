### internal functions ###

pdf.annot.box <- function(xleft, ybottom, xright, ytop,
                          annotation_text, coord="USER")
{
    if (names(dev.cur())[1] == "pdf") {
        .External(PDFAnnotBox, xleft, ybottom, xright, ytop,
                  as.character(annotation_text[1]), as.character(coord[1]))
    }
}

pdf.text.info <- function()
{
    if (names(dev.cur())[1] == "pdf") {
	.External(PDFTextBoxInfo)
    }
}

pdf.text <- function(text="", link=TRUE, col="cyan", border=c(0,0,1))
{
    geo <- pdf.text.info()
    m <- matrix(c(geo[2], geo[3], -geo[3], geo[2]), nrow=2)/geo[1]
    x <- cbind(c(0, -geo[8]), c(0, geo[7]),
               c(geo[6], -geo[8]), c(geo[6], geo[7]))
    xx <- m %*% x + c(geo[4], geo[5])
    pdf.box(min(xx[1,]), min(xx[2,]), max(xx[1,]), max(xx[2,]), text, link,
            col, border, "DEVICE")
}

rcol2pdfcol <- function(col)
{
    if (is.numeric(col[1])) {
      col <- palette()[col]
    }
    col2rgb(col)/255
}

### Export functions ###

pdf2 <- function(...) {
  pdf(...)
}

pdf.box <- function(xleft, ybottom, xright, ytop, text="", link=TRUE,
                    col="cyan", border=c(0,0,1), coord="USER")
{
    col <- as.vector(rcol2pdfcol(col))
    for (i in seq(along=xleft)) {
        border <- as.integer(abs(border))[1:3]
        if (link) {
            annotation_text <-
                paste(paste(c("/C [", col, "]"), collapse=" "),
                      paste(c("/Border [", border, "]"), collapse=" "),
                      paste("/Subtype /Link /A << /Type /Action /S /URI /URI(",
                            as.character(text[i]), ")>>", sep=""),
                      sep="\n")
        } else {
            annotation_text <- 
                paste(paste(c("/C [", col, "]"), collapse=" "),
                      paste(c("/Border [", border, "]"), collapse=" "),
                      "/Subtype /Square",
                      paste("/Contents (", as.character(text[i]), ")", sep=""),
                      "/BS << /Type /Border /W 0 >>",
                      sep="\n")
        }
        pdf.annot.box(xleft[i], ybottom[i], xright[i], ytop[i],
                      annotation_text, coord)
    }
}
    
mtext <- function (..., url, popup, pcol="cyan", border=c(0,0,1))
{
    graphics::mtext(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border)
    }
}

text <- function(..., url, popup, pcol="cyan", border=c(0,0,1))
{
    graphics::text(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border)
    }
}
