# Copyright 2016, Ian Tan
# Data Science Institute
# Multimedia University

#install.packages("shiny")

shinyUI(fluidPage(
  
  shinyUI(fluidPage(
    titlePanel("Next word prediction using Microsoft Cognitive Services"),
    sidebarLayout(
      sidebarPanel(
        
        textInput("entry",
                  "Type in your partial phrase below:",
                  "How are you"),
        
        strong("The predicted words are:"),
        p(textOutput('predictedText'))
        
      ),
      mainPanel(
        h1("Intructions"),
        p('This application attempts to predict the 
          next word based on the phrase that is typed in.
          It uses the web services offered by Microsoft
          Cognitive Services.'),
        br(),
        p('https://www.microsoft.com/cognitive-services/'),
        br(),
        p('Under the WebLM APIs, this application uses the
          Next word completions offering.'),
        br(),
        p('If you like to have access to the code, please do
          email ian@mmu.edu.my .It is not on my
          github yet.')
          
      )
    )
  ))
  
  
))
