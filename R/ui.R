# Copyright 2023 Observational Health Data Sciences and Informatics
#
# This file is part of OhdsiShinyAppBuilder
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ui <- function(
    config,
    title = "OHDSI Analysis Viewer",
    studyDescription = "Further details about the analyses used in this study can be found below.",
    link = 'http://ohdsi.org',
    themePackage = "OhdsiShinyAppBuilder",
    htmlHeader = ''
) {
  
  shiny::addResourcePath(
    prefix = "www/images", 
    directoryPath = system.file("www/images",package = themePackage)
  )
  
  deps <- unique(do.call('rbind', lapply(config$shinyModules, function(x){
    x$shinyModulePackage
  })))
  depString <- ''
  if(length(deps)>0){
    for(dep in deps){
      depString <- paste0(depString, ' and ', dep," v", utils::packageVersion(dep))
    }
  }

  protocolLink <- if (
    grepl("^[A-Za-z][A-Za-z0-9+.-]*:", link) || grepl("^//", link)
  ) {
    link
  } else {
    paste0("https://", link)
  }
  
  return(
    shinydashboard::dashboardPage(
      skin = "black",
      shinydashboard::dashboardHeader(
        title = title,
        titleWidth = 300,
        shiny::tags$li(
          shiny::div(
            shiny::img(
              title = "logo", 
              class = "navbar-logo"
            ), 
            style = "padding-top:0px; padding-bottom:0px;"
          ),
          class = "dropdown"
        )
      ),
      
      shinydashboard::dashboardSidebar(

        shiny::tags$div(
          class = "sidebar-description-button",
          style = "padding: 10px;",
          shiny::tags$button(
            type = "button",
            class = "btn btn-info btn-block",
            `data-toggle` = "modal",
            `data-target` = "#studyDescriptionModal",
            shiny::icon("lightbulb"),
            " View Study Description"
          ),
          shiny::tags$p(
            "Click to open study details",
            style = "margin: 8px 0 0 0; font-size: 12px; color: #c9d0d8;"
          )
        ),
        
        shinydashboard::sidebarMenuOutput("sidebarMenu"),
        
        shiny::tags$div(
          class = "sidebar-protocol-button",
          style = "padding: 10px 10px 0 10px;",
          shiny::tags$a(
            href = protocolLink,
            target = "_blank",
            rel = "noopener noreferrer",
            class = "btn btn-primary btn-block",
            shiny::icon("book"),
            " View Study Protocol"
          ),
          shiny::tags$p(
            "Opens protocol in a new tab",
            style = "margin: 8px 0 0 0; font-size: 12px; color: #c9d0d8;"
          )
        )

      ),
      # end sidebar
      
      # ADD EACH MODULE SHINY AS A TAB ITEM
      shinydashboard::dashboardBody(
        shiny::includeCSS(
          system.file(
            "www", 
            'theme.css', 
            package = themePackage
          )
        ),
        shiny::tags$div(
          id = "studyDescriptionModal",
          class = "modal fade",
          tabindex = "-1",
          role = "dialog",
          `aria-labelledby` = "studyDescriptionModalLabel",
          shiny::tags$div(
            class = "modal-dialog modal-lg",
            role = "document",
            shiny::tags$div(
              class = "modal-content",
              shiny::tags$div(
                class = "modal-header",
                shiny::tags$button(
                  type = "button",
                  class = "close",
                  `data-dismiss` = "modal",
                  `aria-label` = "Close",
                  shiny::tags$span(`aria-hidden` = "true", "x")
                ),
                shiny::tags$h4(
                  class = "modal-title",
                  id = "studyDescriptionModalLabel",
                  shiny::icon("lightbulb"),
                  " Study Description"
                )
              ),
              shiny::tags$div(
                class = "modal-body",
                shiny::HTML(studyDescription)
              ),
              shiny::tags$div(
                class = "modal-footer",
                shiny::tags$button(
                  type = "button",
                  class = "btn btn-default",
                  `data-dismiss` = "modal",
                  "Close"
                )
              )
            )
          )
        ),
        
        do.call(
          shinydashboard::tabItems,
          lapply(config$shinyModules, function(module) {
            if (!is.null(module$shinyModulePackage)) {
              uiFunction <- parse(
                text = paste0(module$shinyModulePackage, "::" , module$uiFunction)
              )
            } else {
              uiFunction <- module$uiFunction
            }
            
            shinydashboard::tabItem(
              tabName = module$tabName, 
              eval(uiFunction)(id = module$id)
              )
          })
        ),
        
        shiny::tags$footer(
          shiny::h6(
            paste0(
              "Generated with OhdsiShinyAppBuilder v",
              utils::packageVersion('OhdsiShinyAppBuilder'),
              depString
            )
          )
        ),
        
        shiny::tags$head(
          shiny::HTML(htmlHeader)
        )
        
      )
      
    )
  )
}