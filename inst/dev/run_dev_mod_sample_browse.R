# This script allow you to quick clean your R session
# update documentation and NAMESPACE, localy install the package
# and run the example used to show how mod_csv_fileInput work
.rs.api.documentSaveAll() # close and save all open file
suppressWarnings(lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),detach,character.only=TRUE,unload=TRUE))
rm(list=ls(all.names = TRUE))
devtools::document('.')
devtools::load_all('.')
options(app.prod=FALSE) # TRUE = production mode, FALSE = development mode

# example("mod_csv_fileInput",package = "Lims1") # PR welcome
library(shiny)
library(shinydashboard)
library(dashboardthemes)
if (interactive()){
  ui <- fluidPage(
    mod_sample_browseUI("fichier")
  )
}
  server <- function(input, output, session) {
  callModule(mod_sample_browse,"fichier")
}
  shinyApp(ui, server)

