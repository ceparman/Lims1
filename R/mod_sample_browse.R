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

#' @title   mod_sample_browseUI and mod_sample_browse
#' @description  A shiny Module for browsing samples
#'
#' @param id shiny id
#'
#' @export
#' @examples
#'   mod_loginUI("sample_browse_body"))
#'   callModule(sample_browse_login,"sample_browse_body")

mod_sample_browseUI <- function(id, label = "Sample Browse") {
  ns <- NS(id)

  tagList(
    box(
      selectizeInput(ns("sample_type"),"Sample Type",choices=c("sample type 1","sample type 2"))
    ),
      hr(),
      box(textOutput(outputId = ns("logmessage")))

    )


}


#' mod_login server function
#'
#' @param input internal
#' @param output internal
#' @param session internal
#' @export
#' @rdname mod_login
mod_sample_browse <- function(input, output, session) {







}
