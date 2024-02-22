# Define server logic
server <- function(input, output) {
  
  # Histograms
  output$platform_hist <- renderPlot({
    ggplot(data, aes(x = platform)) + geom_bar(fill = "skyblue", color = "black") + 
      labs(title = "Platform Histogram")
  })
  
  output$demography_hist <- renderPlot({
    ggplot(data, aes(x = demographics)) + geom_bar(fill = "lightgreen", color = "black") + 
      labs(title = "Demography Histogram")
  })
  
  # Top 5 Entries
  output$top_locations <- renderTable({
    data %>% count(location) %>% arrange(desc(n)) %>% head(5)
  })
  
  output$top_platforms <- renderTable({
    data %>% count(platform) %>% arrange(desc(n)) %>% head(5)
  })
  
  output$top_professions <- renderTable({
    data %>% count(profession) %>% arrange(desc(n)) %>% head(5)
  })
  
  # Pie Charts
  output$platform_pie <- renderPlotly({
    data %>% count(platform) %>%
      plot_ly(labels = ~platform, values = ~n, type = 'pie')
  })
  
  output$profession_pie <- renderPlotly({
    data %>% count(profession) %>%
      plot_ly(labels = ~profession, values = ~n, type = 'pie')
  })
}

# Run the application
shinyApp(ui = ui, server = server)
