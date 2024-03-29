#  File src/library/grDevices/R/device.R
#  Part of the R package, http://www.R-project.org
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  http://www.r-project.org/Licenses/


.known_interactive.devices <-
    c("X11", "X11cairo", "quartz", "windows", "JavaGD", "CairoWin", "CairoX11")

dev.interactive <- function(orNone = FALSE)
{
    iDevs <- .known_interactive.devices
    interactive() &&
    (.Device %in% iDevs ||
     (orNone && .Device == "null device" &&
      is.character(newdev <- getOption("device")) &&
      newdev %in% iDevs))
}

deviceIsInteractive <- function(name = NULL)
{
    if(length(name)) {
        if(!is.character(name)) stop("'name' must be a character vector")
        unlockBinding(".known_interactive.devices", asNamespace("grDevices"))
        .known_interactive.devices <<- c(.known_interactive.devices, name)
        lockBinding(".known_interactive.devices", asNamespace("grDevices"))
        invisible(.known_interactive.devices)
    } else .known_interactive.devices
}


dev.list <- function()
{
    n <- if(exists(".Devices")) get(".Devices") else list("null device")
    n <- unlist(n)
    i <- seq_along(n)[n != ""]
    names(i) <- n[i]
    i <- i[-1]
    if(length(i) == 0) NULL else i
}

dev.cur <- function()
{
    if(!exists(".Devices"))
	.Devices <- list("null device")
    num.device <- .Internal(dev.cur())
    names(num.device) <- .Devices[[num.device]]
    num.device
}

dev.set <-
    function(which = dev.next())
{
    which <- .Internal(dev.set(as.integer(which)))
    names(which) <- .Devices[[which]]
    which
}

dev.next <-
    function(which = dev.cur())
{
    if(!exists(".Devices"))
	.Devices <- list("null.device")
    num.device <- .Internal(dev.next(as.integer(which)))
    names(num.device) <- .Devices[[num.device]]
    num.device
}

dev.prev <-
    function(which = dev.cur())
{
    if(!exists(".Devices"))
	.Devices <- list("null device")
    num.device <- .Internal(dev.prev(as.integer(which)))
    names(num.device) <- .Devices[[num.device]]
    num.device
}

dev.off <-
    function(which = dev.cur())
{
    if(which == 1)
	stop("cannot shut down device 1 (the null device)")
    .Internal(dev.off(as.integer(which)))
    dev.cur()
}

dev.copy <- function(device, ..., which = dev.next())
{
    if(!missing(which) & !missing(device))
	stop("cannot supply 'which' and 'device' at the same time")
    old.device <- dev.cur()
    if(old.device == 1)
	stop("cannot copy from the null device")
    if(missing(device)) {
	if(which == 1)
	    stop("cannot copy to the null device")
	else if(which == dev.cur())
	    stop("cannot copy device to itself")
	dev.set(which)
    }
    else {
	if(!is.function(device))
	    stop("'device' should be a function")
	else device(...)
    }
    .Internal(dev.copy(old.device))
    dev.cur()
}

dev.print <- function(device = postscript, ...)
{
    current.device <- dev.cur()
    nm <- names(current.device)[1]
    if(nm == "null device") stop("no device to print from")
    if(!dev.displaylist())
        stop("can only print from screen device")
    oc <- match.call()
    oc[[1]] <- as.name("dev.copy")
    oc$device <- device
    din <- graphics::par("din"); w <- din[1]; h <- din[2]
    if(missing(device)) { ## safe way to recognize postscript
        if(is.null(oc$file)) oc$file <- ""
        hz0 <- oc$horizontal
        hz <- if(is.null(hz0)) ps.options()$horizontal else eval.parent(hz0)
        paper <- oc$paper
        if(is.null(paper)) paper <- ps.options()$paper
        if(paper == "default") paper <- getOption("papersize")
        paper <- tolower(paper)
        switch(paper,
               a4 = 	 {wp <- 8.27; hp <- 11.69},
               legal =	 {wp <- 8.5;  hp <- 14.0},
               executive={wp <- 7.25; hp <- 10.5},
               { wp <- 8.5; hp <- 11}) ## default is "letter"

        wp <- wp - 0.5; hp <- hp - 0.5  # allow 0.25" margin on each side.
        if(!hz && is.null(hz0) && h < wp && wp < w && w < hp) {
            ## fits landscape but not portrait
            hz <- TRUE
        } else if (hz && is.null(hz0) && w < wp && wp < h && h < hp) {
            ## fits portrait but not landscape
            hz <- FALSE
        } else {
            h0 <- ifelse(hz, wp, hp)
            if(h > h0) { w <- w * h0/h; h <- h0 }
            w0 <- ifelse(hz, hp, wp)
            if(w > w0) { h <- h * w0/w; w <- w0 }
        }
        if(is.null(oc$pointsize)) {
            pt <- ps.options()$pointsize
            oc$pointsize <- pt * w/din[1]
        }
        if(is.null(hz0)) oc$horizontal <- hz
        if(is.null(oc$width)) oc$width <- w
        if(is.null(oc$height)) oc$height <- h
    } else {
        devname <- deparse(substitute(device))
        if(devname %in% c("png", "jpeg", "bmp") &&
           is.null(oc$width) && is.null(oc$height))
            warning("need to specify one of 'width' and 'height'")
        if(is.null(oc$width))
            oc$width <- if(!is.null(oc$height)) w/h * eval.parent(oc$height) else w
        if(is.null(oc$height))
            oc$height <- if(!is.null(oc$width)) h/w * eval.parent(oc$width) else h
    }
    dev.off(eval.parent(oc))
    dev.set(current.device)
}

dev.copy2eps <- function(...)
{
    current.device <- dev.cur()
    nm <- names(current.device)[1]
    if(nm == "null device") stop("no device to print from")
    if(!dev.displaylist())
        stop("can only print from a screen device")
    oc <- match.call()
    oc[[1]] <- as.name("dev.copy")
    oc$device <- postscript
    oc$onefile <- FALSE
    oc$horizontal <- FALSE
    if(is.null(oc$paper))
        oc$paper <- "special"
    din <- dev.size("in"); w <- din[1]; h <- din[2]
    if(is.null(oc$width))
        oc$width <- if(!is.null(oc$height)) w/h * eval.parent(oc$height) else w
    if(is.null(oc$height))
        oc$height <- if(!is.null(oc$width)) h/w * eval.parent(oc$width) else h
    if(is.null(oc$file)) oc$file <- "Rplot.eps"
    dev.off(eval.parent(oc))
    dev.set(current.device)
}

dev.copy2pdf <- function(...)
{
    current.device <- dev.cur()
    nm <- names(current.device)[1]
    if(nm == "null device") stop("no device to print from")
    if(!dev.displaylist())
        stop("can only print from a screen device")
    oc <- match.call()
    oc[[1]] <- as.name("dev.copy")
    oc$device <- pdf
    ## the defaults in pdf are all customizable, so we override
    ## even those which are the ultimate defaults.
    oc$onefile <- FALSE
    if(is.null(oc$paper)) oc$paper <- "special"
    din <- dev.size("in"); w <- din[1]; h <- din[2]
    if(is.null(oc$width))
        oc$width <- if(!is.null(oc$height)) w/h * eval.parent(oc$height) else w
    if(is.null(oc$height))
        oc$height <- if(!is.null(oc$width)) h/w * eval.parent(oc$width) else h
    if(is.null(oc$file)) oc$file <- "Rplot.pdf"
    dev.off(eval.parent(oc))
    dev.set(current.device)
}

dev.control <- function(displaylist = c("inhibit", "enable"))
{
    if(dev.cur() <= 1)
        stop("dev.control() called without an open graphics device")
    if(!missing(displaylist)) {
        displaylist <- match.arg(displaylist)
	.Internal(dev.control(displaylist == "enable"))
    } else stop("argument is missing with no default")
    invisible()
}

dev.displaylist <- function()
{
    if(dev.cur() <= 1)
        stop("dev.displaylist() called without an open graphics device")
    .Internal(dev.displaylist())
}

recordGraphics <- function(expr, list, env) {
  .Internal(recordGraphics(substitute(expr), list, env))
}

graphics.off <- function ()
{
    while ((which <- dev.cur()) != 1)
	dev.off(which)
}

dev.new <- function()
{
    dev <- getOption("device")
    if(is.function(dev)) dev()
    else if(!is.character(dev))
        stop("invalid setting for 'getOption(\"device\")'")
    else if(identical(dev, "pdf")) {
        ## Take care not to open device on top of another.
        if(!file.exists("Rplots.pdf")) pdf()
        else {
            fe <- file.exists(tmp <- paste("Rplots", 1:999, ".pdf", sep=""))
            if(all(fe)) stop("no suitable unused file name for pdf()")
            message(gettextf("dev.new(): using pdf(file=\"%s\")", tmp[!fe][1]),
                    domain=NA)
            pdf(tmp[!fe][1])
        }
    } else if(identical(dev, "postscript")) {
        ## Take care not to open device on top of another.
        if(!file.exists("Rplots.ps")) postscript()
        else {
            fe <- file.exists(tmp <- paste("Rplots", 1:999, ".ps", sep=""))
            if(all(fe)) stop("no suitable unused file name for postscript()")
            message(gettextf("dev.new(): using postscript(file=\"%s\")",
                             tmp[!fe][1]), domain=NA)
            postscript(tmp[!fe][1])
        }
    } else {
        ## this is documented to be searched for from base,
        ## then in graphics namespace.
        if(exists(dev, .GlobalEnv)) get(dev, .GlobalEnv)()
        else if(exists(dev, asNamespace("grDevices")))
            get(dev, asNamespace("grDevices"))()
        else stop(gettextf("device '%s' not found", dev), domain=NA)
    }
}

### Check for a single valid integer format
checkIntFormat <- function(s)
{
    ## OK if no unescaped %, so first remove those
    s <- gsub("%%", "", s)
    if(length(grep("%", s)) == 0) return(TRUE)
    ## now remove at most one valid(ish) integer format
    s <- sub("%[#0 ,+-]*[0-9.]*[diouxX]", "", s)
    length(grep("%", s)) == 0
}

devAskNewPage <- function(ask=NULL) .Internal(devAskNewPage(ask))

dev.size <- function(units = c("in", "cm", "px"))
{
    units <- match.arg(units)
    size <- .Internal(dev.size())
    if(units == "px") size else size * graphics::par("cin")/graphics::par("cra") *
        if(units == "cm") 2.54 else 1
}
