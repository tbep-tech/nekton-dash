# README

Materials for Tampa Bay Nekton Index Dashboard, [link](http://shiny.tbep.org/nekton-dash/)

[![DOI](https://zenodo.org/badge/276705811.svg)](https://zenodo.org/badge/latestdoi/276705811)

## Annual update

1. FIM typically provides preprocessed nekton data July/August for the preceding year. 
1. In tbeptools, recreate `fimdata` and `fimstations` with the new data (in example code for each file) and update file info in Roxygen. Push updates to GitHub Reinstall new version of tbeptools on local machine.
1. Run R/dat_proc.R to update the data for the dashboard. Change `maxyr`
1. Docker image will neeed to be recreated with tbeptools update (once on R-Universe), but can install in the image directly on the server. Pull new image to server when done and restart instance. 
1. Update nekton Rmd in State of the Bay repo
1. Update CCMP FW-5 page using `quarto publish gh-pages` in CMD line. Site builds automatically with GH-Actions, but it required a push to trigger.