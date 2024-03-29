fluidPage(
  navlistPanel(
    tabPanel("Mapper", 
             tags$head(tags$script(src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js")),
             tags$head(tags$script(src="cdp.js")),
             #includeCSS("www/style.css"),
             tags$head(
               tags$link(
                 rel = "stylesheet",
                 type = "text/css",
                 href = "style.css"
               )
             ),
             # headerPanel('Store Clusters'),
             # sidebarPanel(
             #   numericInput('clusters', 'Cluster count', 3,
             #                min = 1, max = 9)
             # ),
             mainPanel(
               plotOutput('mapperPlot'),
               tags$div(class="bhiResults", 
                        tableOutput('bhiTable')
               )
  
               #tags$img(src = "/rplt.png")
             )
    ),
    tabPanel("Gene Function Tables",
             mainPanel(
               tags$div(class="infoTables",
                 tags$div(class="diffexpInfoTable", 
                        tags$div("Mapper Function"),
                        tableOutput('diffExpTable')
               ),
               tags$div(class="clusterInfoTable", 
                        tags$div("H-Clust Functions"),
                        tableOutput('hTable')
               )
            )
        )
            
    ),
    tabPanel("Pathway Analysis", 
             mainPanel(
               tableOutput('pathwayDisplayTable')
             )
    )
    # tags$head(
    #   #              tags$link(
    #   #                rel = "stylesheet",
    #   #                type = "text/css",
    #   #                href = "style.css"
    #   #              )
    #   #            ),
    # forceNetworkOutput("force")
    # )
  )
)