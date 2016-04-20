##' Create plot for aims
##'
##' Create a pie like plot to visualize how close a project is to completeness or
##' achievement of the aims. The middle point show the total completeness of the
##' aim. The percentages of distribution is 60, 20 and 20. Items for aim should be on
##' the first row and the percentage of each items is on the second row.
##'
##' @note The \code{ggplot2} package is required to run this function
##' @param data Data set
##' @param title Title for the plot
##' @source  RegData Example datasett to run the function
##'
##' @examples
##'
##' # basic usage
##' library("aimPlot")
##' aimPlot(data = RegData, title = "Plot title")
##' aimPlot(RegData, "Plot title")
##'
##' 
##' @export

aimPlot <- function(data, title) {
  
    if (missing(title)) {
        title <- "What is the title for this plot?"
    }

    aim <- data[,1]

    percent <- data[,2]

    aim <- gsub(" ", "\n", levels(data[ ,1]))
    
    p <- ggplot2::ggplot(data) +
        ggplot2::scale_x_discrete() +
        ggplot2::scale_y_reverse() +
        ggplot2::geom_rect(xmin=Inf, xmax = -Inf, ymin = -82, ymax = -60, fill="#2171B5") +
        ggplot2::geom_rect(xmin=Inf, xmax = -Inf, ymin = -60, ymax = 0, fill="#99CCFF") +
        ggplot2::geom_rect(xmin=Inf, xmax = -Inf, ymin = -100, ymax = -80, fill="#000033") +
        ggplot2::geom_vline(xintercept=1:8, size=1.5, color="white") +
        ggplot2::geom_hline(yintercept=c(60,80,100), size=0.1, color="white") +
        ggplot2::geom_point(ggplot2::aes(x=aim, y=percent, ymin=0, ymax=100),
                            shape=21, fill="#FF9933", size=15, position="identity") +
        ggplot2::ggtitle(title) +
        ggplot2::coord_polar() +
        ggplot2::theme(
            plot.title=ggplot2::element_text(face = "bold", color = "black", size = 17, ),
            panel.background=ggplot2::element_rect(fill = c("white")),
            panel.grid=ggplot2::element_blank(),
            panel.grid.major=ggplot2::element_line(size=2),
            panel.grid.minor.y=ggplot2::element_blank(),
            axis.text.x=ggplot2::element_text(vjust=5),
            axis.text=ggplot2::element_text(size = 12, color = "black", face = "bold"),
            axis.text.y=ggplot2::element_blank(),
            axis.title.x=ggplot2::element_blank(),
            axis.title.y=ggplot2::element_blank(),
            axis.ticks=ggplot2::element_blank())

    ## ggplot2::ggsave(p, scale = 1.1)
    return(p)
}

