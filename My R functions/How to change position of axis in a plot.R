shift_x_axis <- function(p, y = 0){
  g <- ggplotGrob(p)
  dummy <- data.frame(y=y)
  ax <- g[["grobs"]][g$layout$name == "axis-b"][[1]]
  p + annotation_custom(grid::grobTree(ax, vp = grid::viewport(y=1, height=sum(ax$height))), 
                        ymax=y, ymin=y) +
    geom_hline(aes(yintercept=y), data = dummy) +
    theme(axis.text.x = element_blank(), 
          axis.ticks.x=element_blank())
  
}

shift_y_axis <- function(p, x = 0) {
  g <- ggplotGrob(p)
  dummy <- data.frame(x = x)
  ax <- g[["grobs"]][g$layout$name == "axis-l"][[1]]
  p + annotation_custom(grid::grobTree(ax, vp = grid::viewport(x = 1, width = sum(ax$height))),
                        xmax = x, xmin = x) +
    geom_vline(aes(xintercept = x), data = dummy) +
    theme(
      axis.text.y = element_blank(),
      axis.ticks.y = element_blank())
}



p <- qplot(1:10, 1:10) + theme_bw() 

shift_y_axis(p, x = 5)
