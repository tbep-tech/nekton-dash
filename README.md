# README

Materials for Tampa Bay Nekton Index Dashboard, [link](http://shiny.tbep.org/nekton-dash/)

[![DOI](https://zenodo.org/badge/276705811.svg)](https://zenodo.org/badge/latestdoi/276705811)

## Annual update

1. FIM typically provides preprocessed nekton data July/August for the preceding year. New files must be pushed to the data folder of the [tbni-proc](https://raw.githubusercontent.com/tbep-tech/tbni-proc/master/data/TampaBay_NektonIndexData.csv) repository: TampaBay_NektonIndexData.csv, TampaBay_NektonIndex_Metadata.csv, TBIndex_spp_codes.csv
1. In tbeptools, recreate `fimdata` and `fimstations` with the new data (in example code for each file) and update file info in Roxygen. Push updates to GitHub and reinstall new version of tbeptools on local machine.
1. Run R/dat_proc.R to update the data for the dashboard. 
1. Docker image will neeed to be recreated with tbeptools update (once on R-Universe), but can install in the image directly on the server. Pull new image to server when done and restart instance. 
1. Update nekton Rmd in State of the Bay repo
1. Update CCMP FW-5 page using `quarto publish gh-pages` in CMD line. Site builds automatically with GH-Actions, but it required a push to trigger.
1. Update data viz page on TBEP website <https://tbep.org/tampa-bay-nekton-index/> using SOB script at <https://github.com/tbep-tech/State-of-the-Bay/blob/master/createfigs.R>
