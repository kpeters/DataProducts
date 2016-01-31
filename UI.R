## Shiny UI.R file for the John Hopkins Data Products course project on Coursera

## load shiny package
library(shiny)

## begin shiny UI
shinyUI(pageWithSidebar(
        headerPanel("BMI app"),
    sidebarPanel(
        includeMarkdown("BMI_Documentation.Rmd"),
        sliderInput("height", "Height in meters", value = 1.70, min=1.30, max=2.30, step=0.01),
        sliderInput("mass", "Mass in kilograms", value = 70.0, min=40.0, max=140.0, step=0.1)
    ),
    mainPanel(
        plotOutput("newBMIchart"),
        htmlOutput("BMItext1")
    )
))