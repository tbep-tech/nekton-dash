# gauge function for raw data
rawgaugefun <- function(fimplo, tbniscr, cols, colnm, ttl){
  
  qnts <- quantile(tbniscr[, colnm, drop = T], c(0, 0.3, 0.7, 0.95), na.rm = T) %>% round(1) %>%  as.numeric
  
  out <- gauge(round(fimplo[, colnm, drop = T], 1), min = qnts[1], max = qnts[4],label = ttl, gaugeSectors(
    danger = qnts[c(1, 2)], warning = qnts[c(2, 3)], success = qnts[c(3, 4)],
    colors = rev(cols)
  ))
  
  return(out)
  
}