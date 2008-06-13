# This is a sample for extending pdf device
pdf("pdf2.pdf")
par(oma=c(2,2,2,2))

plot(1:10)

############################################
## You can make URL link box by "pdf.box" ##
############################################
pdf.box(1, 5, 3, 8, "http://www.r-project.org")

###################################################
## You can also make popup text box by "pdf.box" ##
###################################################
x <- 1:10
pdf.box(x-0.1, x-0.1, x+0.1, x+0.1, LETTERS[x], link=FALSE, border=c(0,0,1))

text(5, 9, "mouse over points!", col=2)

############################################################
## URL link and popup text for strings can be assigned by ##
## "text" and "mtext".                                    ##
############################################################
text(5, 2, "text test", url="http://www.google.com")

mtext("mtext test 1", cex=2, popup="Hello, world!")
mtext("mtext test 2", side = 2, line=2, url="http://www.apple.com")
mtext("mtext test 3", outer=TRUE, side = 1, url="http://www.bioconductor.org")
mtext("mtext test 4", outer=TRUE, side = 4, cex=3, url="http://www.playstation.com")

dev.off()
