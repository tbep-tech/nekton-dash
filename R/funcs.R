# gauge function for raw/scaled data
gaugefun <- function(fimplo, tbniscr, cols, colnm, ttl, raw = FALSE){

  scrmet <- fimplo[, paste0('Score', colnm), drop = T]

  if(!raw){
    
    out <- flexdashboard::gauge(scrmet, min = 0, max = 10, label = '', flexdashboard::gaugeSectors(
      danger = c(0, 3), warning = c(3, 7), success = c(7, 10),
      colors = rev(cols)
    ))
  
  }
  
   
  if(raw){

    # get color from metric value, assign to raw for continuity
    col <- findInterval(scrmet, c(0, 3, 7, 10), rightmost.closed = T)
    col <- case_when(
      col %in% c(0, 1) ~ cols[1], 
      col == 2 ~ cols[2], 
      col == 3 ~ cols[3]
    )

    qnts <- quantile(tbniscr[, colnm, drop = T], c(0, 0.95), na.rm = T) %>% round(1) %>%  as.numeric
    
    out <- flexdashboard::gauge(round(fimplo[, colnm, drop = T], 1), min = qnts[1], max = qnts[2],label = '', flexdashboard::gaugeSectors(colors = col))
    
  }
  
  return(out)
  
}

# gauge function for percentile reporting
gaugeqfun <- function(fimplo, fimyrs, colnm, ttl){
  

  scrmet <- fimplo[, colnm, drop = T]
  
  # get percentile
  ptile <- ecdf(fimyrs[, colnm, drop = T])(scrmet)
  ptile <- round(100 * ptile, 0)
  
  out <- flexdashboard::gauge(ptile, min = 0, max = 100, label = '', flexdashboard::gaugeSectors(
    danger = c(0, 33), warning = c(33, 66), success = c(66, 100),
    colors = c("#312271", "#A79FE1", "#F9F9F9")
    ), symbol = '%')

  return(out)
  
}

# stupid function for fixing header of raw/scored
ttlfun <- function(ttl, rawsel2){
  
  out <- ttl
  if(!rawsel2)
    out <- paste('Score', ttl)
  
  out <- h5(out)
  
  return(out)
  
}