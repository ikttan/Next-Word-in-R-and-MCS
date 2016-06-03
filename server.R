# Copyright 2016, Ian Tan
# Data Science Institute
# Multimedia University

#install.packages("shiny")

library(httr)
library(jsonlite)

shinyServer(function(input, output) {
  
  output$predictedText <- renderText({
    
    # input$entry (or ngrams) should be preprocessed first actually.
    ngrams <- input$entry
    url <- paste0('https://api.projectoxford.ai/text/weblm/v1.0/generateNextWords?model=body&words=',ngrams,'&order=5&maxNumOfCandidatesReturned=5')
    url <- URLencode(url)

    # You can get your own Ocp-Apim-Subscription-Key
    ans <- POST(url, body = NULL, add_headers("Ocp-Apim-Subscription-Key"="f8f16618074948828176ef9063ba06a0"))

    # Convert it to JSON format and check using fromJSON()
    json_ans <- toJSON(content(ans, "parsed", "application/json"))

    # It is a list of next word and probability
    # We are only interested in the next word, so we
    # take the [1] part and then unlist() the 
    # results to get a vector of characters.
    # We also unlist() so that it becomes a string
    next_words <- unlist(fromJSON(json_ans)[[1]][[1]])
  })
  
})