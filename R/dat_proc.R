library(tbeptools)
library(tidyverse)
library(here)

# tbni scores -------------------------------------------------------------

tbniscr <- anlz_tbniscr(fimdata)

save(tbniscr, file = here('data/tbniscr.RData'))
