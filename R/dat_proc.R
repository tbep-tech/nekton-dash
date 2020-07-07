library(tbeptools)
library(tidyverse)
library(here)
library(extrafont)

fml <- 'Lato Light'

# tbni scores -------------------------------------------------------------

tbniscr <- anlz_tbniscr(fimdata)

save(tbniscr, file = here('data/tbniscr.RData'))

# matrix results ----------------------------------------------------------

tbniscr <- anlz_tbniscr(fimdata)
tbnimat <- show_tbnimatrix(tbniscr, family = fml, plotly = TRUE, txtsz = NULL)

save(tbnimat, file = here('data/tbnimat.RData'), compress = 'xz')