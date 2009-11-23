### internal functions ###

pdf.annot.box <- function(xleft, ybottom, xright, ytop,
                          annotation_text, coord="USER")
{
    if (names(dev.cur())[1] == "pdf") {
        .External(PDFAnnotBox, xleft, ybottom, xright, ytop,
                  as.character(annotation_text[1]), as.character(coord[1]))
    }
}

pdf.box <- function(xleft, ybottom, xright, ytop, text="", link=TRUE,
                    col="cyan", border=c(0,0,1), coord="USER", annot.options=NULL)
{
    text <- rep(text, length.out=length(xleft))
    link <- rep(link, length.out=length(xleft))
    col <- rep(col, length.out=length(xleft))
    col <- round(rcol2pdfcol(col), 4)
    for (i in seq(along=xleft)) {
        if (any(is.na(col[,i]))) { # do not draw border line
            col[,i] <- c(1,1,1)
            border <- c(0,0,0)
        } else {
            border <- as.integer(abs(border))[1:3]
        }
        annotation <- list()
        annotation[["/C"]] <- paste(c("[", col[,i], "]"), collapse=" ")
        annotation[["/Border"]] <- paste(c("[", border, "]"), collapse=" ")
        if (link[i]) {
            annotation[["/Subtype"]] <- "/Link"
            annotation[["/A"]] <- paste("<<\n  /Type /Action\n  /S /URI\n  /URI(",
                                        as.character(text[i]), ")\n>>", sep="")
        } else {
            annotation[["/Subtype"]] <- "/Square"
            annotation[["/Name"]] <- "/Comment"
            annotation[["/Contents"]] <- paste("(", as.character(text[i]), ")", sep="")
            annotation[["/F"]] <- "288"
##            annotation[["/BS"]] <- "<<\n  /Type /Border\n  /W 0\n>>"
        }
        annotation.text <- NULL
        for (key in names(annotation)) {
          annotation.text <- c(annotation.text, paste(key, annotation[[key]]))
        }
        annotation.text <- paste(annotation.text, collapse="\n")
        annotation.text <- paste(unlist(c(annotation.text, annot.options)), sep="\n")
        pdf.annot.box(xleft[i], ybottom[i], xright[i], ytop[i], annotation.text, coord)
    }
}

pdf.text.info <- function()
{
    if (names(dev.cur())[1] == "pdf") {
        .External(PDFTextBoxInfo)
    }
}

pdf.text <- function(text="", link=TRUE, col="cyan", border=c(0,0,1), annot.options=NULL)
{
    geo <- pdf.text.info()
    m <- matrix(c(geo[2], geo[3], -geo[3], geo[2]), nrow=2)/geo[1]
    x <- cbind(c(0, -geo[8]), c(0, geo[7]),
               c(geo[6], -geo[8]), c(geo[6], geo[7]))
    xx <- m %*% x + c(geo[4], geo[5])
    pdf.box(min(xx[1,]), min(xx[2,]), max(xx[1,]), max(xx[2,]), text, link,
            col, border, "DEVICE", annot.options)
}

rcol2pdfcol <- function(col)
{
    rgb <- matrix(NA, nrow=3, ncol=length(col))
    idx <- !is.na(col)
    if (is.numeric(col)) {
        col[idx] <- (col[idx]-1) %% length(palette()) + 1
        rgb[,idx] <- col2rgb(palette()[col[idx]])/255
    } else {
        rgb[,idx] <- col2rgb(col[idx])/255
    }
    rgb
}

### Export functions ###

pdf2 <- pdf

mtext <- function (..., url, popup, pcol="cyan", border=c(0,0,1), annot.options=NULL)
{
    graphics::mtext(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border, annot.options)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border, annot.options)
    }
}

text <- function(..., url, popup, pcol="cyan", border=c(0,0,1), annot.options=NULL)
{
    graphics::text(...)
    if (!missing(url)) {
        pdf.text(url, TRUE, pcol, border, annot.options)
    }
    if (!missing(popup)) {
        pdf.text(popup, FALSE, pcol, border, annot.options)
    }
}

rect <- function(xleft, ybottom, xright, ytop, ..., url, popup, annot.options=NULL)
{
    graphics::rect(xleft, ybottom, xright, ytop, ...)
    col <- rep(NA, length(xleft))
    if (!missing(url)){
        pdf.box(xleft, ybottom, xright, ytop, url, TRUE, col=col, annot.options)
    }
    if (!missing(popup)) {
        pdf.box(xleft, ybottom, xright, ytop, popup, FALSE, col=col, annot.options)
    }
}
