library(tbeptools)
library(tidyverse)
library(here)
library(extrafont)

fml <- 'Lato Light'

# tbni scores -------------------------------------------------------------

tbniscr <- anlz_tbniscr(fimdata)

save(tbniscr, file = here('data/tbniscr.RData'))