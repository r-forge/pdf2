### internal functions ###

pdf.annot.box <- function(x0, y0, x1, y1, annotation_text, coord="USER")
{
    if (names(dev.cur())[1] == "pdf") {
        .External(PDFAnnotBox, x0, y0, x1, y1,
                  as.character(annotation_text[1]), as.character(coord[1]))
    }
}

pdf.text.info <- function()
{
    if (names(dev.cur())[1] == "pdf") {
	.External(PDFTextBoxInfo)
    }
}

pdf.text <- function(text="", link=T, col=c(0,1,1), border=c(0,0,1))
{
    geo <- pdf.text.info()
    m <- matrix(c(geo[2], geo[3], -geo[3], geo[2]), nrow=2)/geo[1]
    x <- cbind(c(0, -geo[8]), c(0, geo[7]),
               c(geo[6], -geo[8]), c(geo[6], geo[7]))
    xx <- m %*% x + c(geo[4], geo[5])
    pdf.box(min(xx[1,]), min(xx[2,]), max(xx[1,]), max(xx[2,]), text, link,
            col, border, "DEVICE")
}

### export functions ###

pdf.box <- function(x0, y0, x1, y1, text="", link=T, col=c(0,1,1),
                    border=c(0,0,1), coord="USER")
{
    col <- as.numeric(abs(col))[1:3]
    if (max(col)>1) { col <- col / max(col) }
    border <- as.integer(abs(border))[1:3]
    if (link) {
        annotation_text <-
          paste(paste(c("/C [", col, "]"), collapse=" "),
                paste(c("/Border [", border, "]"), collapse=" "),
                paste("/Subtype /Link /A << /Type /Action /S /URI /URI(",
                      as.character(text[1]), ")>>", sep=""),
                sep="\n")
    } else {
        annotation_text <- 
          paste(paste(c("/C [", col, "]"), collapse=" "),
                paste(c("/Border [", border, "]"), collapse=" "),
                "/Subtype /Square",
                paste("/Contents (", paste(text, collapse="\r"), ")", sep=""),
                "/BS << /Type /Border /W 0 >>",
                sep="\n")
    }
    pdf.annot.box(x0, y0, x1, y1, annotation_text, coord)
}
    
mtext <- function (..., url, popup, pcol = c(0,1,1), border=c(0,0,1))
{
    graphics::mtext(...)
    if (!missing(url)) {
        pdf.text(url, T, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, F, pcol, border)
    }
}

text <- function(..., url, popup, pcol = c(0,1,1), border=c(0,0,1))
{
    graphics::text(...)
    if (!missing(url)) {
        pdf.text(url, T, pcol, border)
    }
    if (!missing(popup)) {
        pdf.text(popup, F, pcol, border)
    }
}
