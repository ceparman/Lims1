# Naming convention :
# all Shinymodule have to begin with `mod_`, in lowercase Except for `UI` , `Input` and `Output`
# use `Input` as sufix if your module is an Input
# use `Output` as sufix if your module is an Output
# use `UI` as sufix if your module is both Input and Output
#
# examples :
# ui side : mod_truc_bidulUI
# server side : mod_truc_bidul
#
# ui side : mod_machin_chouetteInput
# server side : mod_machin_chouette

# all shinyModule must have a documentation page
# one unique page for both ui and server side ( you can use `#' @rdname` to link both function)

# A minimalist example is mandatory

#' @title   mod_csv_fileInput and mod_csv_file
#' @description  A shiny Module that imports csv file
#'
#' @param id shiny id
#' @param label fileInput label
#'
#' @export
#' @examples
#' library(shiny)
#' library(DT)
#' if (interactive()){
#' ui <- fluidPage(
#'   mod_csv_fileInput("fichier"),
#' DTOutput("tableau")
#' )
#'
#' server <- function(input, output, session) {
#'   data <- callModule(mod_csv_file,"fichier")
#'   output$tableau <- renderDT({data()})
#' }
#'
#' shinyApp(ui, server)
#' }
#'
mod_loginUI <- function(id, label = "Log In") {
  ns <- NS(id)

  tagList(
    box(
      textInput(ns("user"), "enter user name"),
      passwordInput(ns("password"),"enter password",""),


      actionButton(ns("validate"), "validate credentials"),
      hr(),
      box(textOutput(outputId = ns("logmessage")))

    )
  )

}


#' mod_csv_file server function
#'
#' @param input internal
#' @param output internal
#' @param session internal
#' @param stringsAsFactors logical: should character vectors be converted to factors?
#'
#' @importFrom utils read.csv
#' @importFrom glue glue
#' @export
#' @rdname mod_login
mod_login <- function(input, output, session, tabsPanel) {

  observeEvent(input$validate,{


    output$logmessage <- renderText(
      tryCatch(
        {
          #login <- CoreAPIV2::authBasic(account)
          #lo<-CoreAPIV2::logOut(login$coreApi)

        paste("Credentials Validated user ",input$user,"-", input$password)
        }
        ,
        error =function(cond){
          return("Credentials not accepted")
        }

      )
    )



  })

}
