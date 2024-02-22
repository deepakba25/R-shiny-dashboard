# Load necessary libraries
library(shiny)
library(shinydashboard)
library(dplyr)
library(plotly)
library(ggplot2)

# Read data from CSV file
data <- read.csv("C:/Users/dm900/OneDrive/Documents/Social.csv")

# Define UI for application
ui <- dashboardPage(
  dashboardHeader(title = "Social Media Data Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Histograms", tabName = "histograms"),
      menuItem("Top 5 Entries", tabName = "top5"),
      menuItem("Pie Charts", tabName = "piecharts")
    )
  ),
  dashboardBody(
    tabItems(
      # Histograms Tab
      tabItem(tabName = "histograms",
              fluidRow(
                box(plotOutput("platform_hist"), width = 6),
                box(plotOutput("demography_hist"), width = 6)
              )
      ),
      
      # Top 5 Entries Tab
      tabItem(tabName = "top5",
              fluidRow(
                box(title = "Top 5 Locations", tableOutput("top_locations"), width = 4),
                box(title = "Top 5 Platforms", tableOutput("top_platforms"), width = 4),
                box(title = "Top 5 Professions", tableOutput("top_professions"), width = 4)
              )
      ),
      
      # Pie Charts Tab
      tabItem(tabName = "piecharts",
              fluidRow(
                box(plotlyOutput("platform_pie"), width = 6),
                box(plotlyOutput("profession_pie"), width = 6)
              )
      )
    )
  )
)
