#' @import shiny
#' @importFrom graphics hist
#' @importFrom stats rnorm
#'
app_server <- function(input, output,session) {

callModule(mod_login,"login_body")


callModule(mod_login,"sample_browse_body")
callModule(mod_login,"sample_register_body")


}
