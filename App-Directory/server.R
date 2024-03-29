function(input, output) {
  if(!exists("m1")){
    source("./analysis.R")
  }
 
  
  # data <- eventReactive(input$go, {
  #   rnorm(input$num)
  # })
  
  vertexSizes <- 2 * totalInMapperClusters/(dim(affy_fil)[1]/m1$num_vertices)
  vertexSizes[vertexSizes < 3]  <- 3
  
  output$mapperPlot <- renderPlot({
    par(mar = c(1, 1, 1, 1))
    plot(g1, layout = layout.auto(g1), 
         main = gds_set_name,
         vertex.color = colorRampPalette(c('blue', 'red'))(length(pct_diffexp))[rank(pct_diffexp)],
         #vertex.size = 7*totalInMapperClusters/(dim(affy_fil)[1]/m1$num_vertices)
    )
  })
  
  output$hTable <- renderTable(t(hclusters.tableData))
  output$diffExpTable <- renderTable(t(m1.tableData))
  output$bhiTable <- renderTable(as.table(bhis), digits=4, colnames = FALSE)
  output$pathwayDisplayTable <- renderTable(pathwayDisplayTable)
  
  ColourScale <- paste(cbind('d3.scale.ordinal().range(',jsColorString,');'))
  
    output$force <- renderForceNetwork({
      forceNetwork(Nodes = MapperNodes, Links = MapperLinks, 
                   Source = "Linksource", Target = "Linktarget",
                   Value = "Linkvalue", NodeID = "Nodename", colourScale = JS(ColourScale),
                   Group = "pctdiffexp", opacity = 1, Nodesize = "Nodesize",
                   linkDistance = 10, charge = -150, legend = TRUE)  
    })
  
  output$hclustPlot <-renderPlot({ plot(dend)})

}