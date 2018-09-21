
#' @import shiny
#' @import shinydashboard
#' @import dashboardthemes
app_ui <- function() {
  dashboardPage(

    dashboardHeader(title = "Shiny Air LIMS"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Login", tabName = "login", icon = icon("address-card")),
        menuItem("Samples",icon = icon("flask"),
                 menuSubItem(text = "Browse", tabName = "sample_browse"),
                 menuSubItem(text = "Register", tabName = "sample_register"),
                 menuSubItem(text = "Update", tabName = "sample_update"),
                 menuSubItem(text = "Send to", tabName = "sample_send")

      ),

        menuItem("Assays", tabName = "login", icon = icon("crosshairs"),
                 menuSubItem(text = "Setup", tabName = "assay_setup"),
                 menuSubItem(text = "Run", tabName = "assay_run")

                 ),
        menuItem("Reports", icon = icon("edit"),
                 menuSubItem(text = "Generate", tabName = "report_generate")
        ),
        menuItem("Admin", tabName = "login", icon = icon("gear"))
      )
  ),
  dashboardBody(

    shinyDashboardThemes(
      theme = "grey_light"
    ),

    tabItems(
      tabItem(tabName = "login",
              mod_loginUI("login_body")),

      tabItem(tabName = "sample_browse",
              mod_sample_browseUI("sample_browse_body")),

      tabItem(tabName = "sample_register",
        mod_sample_registerUI("sample_register_body"))

      )
  )
)
}
