flow1_all <- readRDS("flow1_all.rds")
flow2_all <- readRDS("flow2_all.rds")
flow3_all <- readRDS("flow3_all.rds")
flow4_all <- readRDS("flow4_all.rds")
flow5_all <- readRDS("flow5_all.rds")
flow6_all <- readRDS("flow6_all.rds")
flow7_all <- readRDS("flow7_all.rds")

design_em <- readRDS('design_em.rds')
design_em$ID <- 1:1250

# flows is an txn object (t = output size, n = number of runs)
plot_flow <- function(flows, design, parameter = NULL){
  require(ggplot2)
  require(viridis)
  require(reshape2)
  
  t <- nrow(flows)
  n <- ncol(flows)
  plot_data <- data.frame(Time = rep(1:t, n),
                          Run = rep(design$ID, each = t),
                          Flow = c(as.matrix(flows)))
  plot_data <- merge(plot_data, design, by.x = 'Run', by.y = 'ID')
  
  if (is.null(parameter)){
    plot_data <- melt(plot_data, id.vars = c('Run', 'Time', 'Flow'))
    
    plot1 <- ggplot(plot_data, aes(x = Time, y = Flow, col = value, linetype = as.factor(Run))) +
      geom_line() +
      facet_wrap(vars(variable)) +
      scale_linetype_manual(values = rep(1, n), guide = 'none') +
      scale_color_viridis(limits = c(-1,1))
  }
  
  else {
    colnames(plot_data)[which(colnames(plot_data) == parameter)] <- 'value'
    plot1 <- ggplot(plot_data, aes(x = Time, y = Flow, col = value, linetype = as.factor(Run))) +
      geom_line() +
      scale_linetype_manual(values = rep(1, n), guide = 'none') +
      scale_color_viridis()
  }

  return(plot1)
}

# Sampling instead of plotting all, as a) slow and b) creates 13.3Mb file
inds <- sample(1:nrow(design_em), 500)

pdf('plots/flow1_all.pdf', width = 12, height = 8)
plot_flow(flow1_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow2_all.pdf', width = 12, height = 8)
plot_flow(flow2_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow3_all.pdf', width = 12, height = 8)
plot_flow(flow3_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow4_all.pdf', width = 12, height = 8)
plot_flow(flow4_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow5_all.pdf', width = 12, height = 8)
plot_flow(flow5_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow6_all.pdf', width = 12, height = 8)
plot_flow(flow6_all[,inds], design_em[inds,])
dev.off()

pdf('plots/flow7_all.pdf', width = 12, height = 8)
plot_flow(flow7_all[,inds], design_em[inds,])
dev.off()
