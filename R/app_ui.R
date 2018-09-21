
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
            menuSubItem(text = "Register", tabName = "register_samples"),
            menuSubItem(text = "Update", tabName = "update_samples"),
            menuSubItem(text = "Send to", tabName = "send_samples")

      ),

        menuItem("Assays", tabName = "login", icon = icon("crosshairs"),
                 menuSubItem(text = "Setup", tabName = "setup_assay")


                 ),
        menuItem("Reports", icon = icon("edit"),
                 menuSubItem(text = "Generate", tabName = "generate_report")
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
              mod_loginUI("login_body"))
    )
      )
  )

}
