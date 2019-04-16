library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(rsconnect)

ui <- fluidPage(
  titlePanel("Investment Modalities"),
  fluidRow(
    column(4,
           sliderInput("amount", 
                       "Initial Amount:",
                       min = 0,
                       max = 100000,
                       value = 1000,
                       step = 500)
    ),
    column(4,
           sliderInput("return",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       value = 5,
                       step = 0.1)
    ),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 20,
                       step = 1)
    )
    ),
  fluidRow(
    column(4,
           sliderInput("annual",
                       "Annual Contribution", 
                       min = 0,
                       max = 50000,
                       value = 2000,
                       step = 500)
    ),
    column(4,
           sliderInput("growth",
                       "Growth Rate (in %)", 
                       min = 0,
                       max = 20,
                       value = 2,
                       step = 0.1)
    ),
    column(4,
           selectInput("facet", 
                       "Facet?", 
                       choices = list("No" = 1, "Yes" = 2), 
                       selected = 1)
    )
  ),
  
      h4("Timelines"),
      plotOutput("Timeline"),
      h4("Balances"),
      verbatimTextOutput("Balances")
  )




server <- function(input, output) {
   
     
   
  output$Timeline <- renderPlot({
    amount <- input$amount
    contrib<-input$annual
    growth <- reactive({
      growth <- input$growth/100
      return(growth)
    })
    rates<- reactive({
      rates <- input$return/100
      return(rates)
    })
    years = 0:input$years
    no_contrib = rep(amount, (input$years + 1)) 
    fixed_contrib= rep(amount, (input$years+ 1))
    growing_contrib = rep(amount, (input$years + 1))
    
    for (y in years){
      no_contrib[y+1] <- amount * ((1 + rates())^y)
      fixed_contrib[y+1] <- no_contrib[y+1]  + (contrib * ((1 + rates())^y - 1) / rates())
      growing_contrib[y+1] <- no_contrib[y+1] + contrib * ((1 + rates())^y - (1 + growth())^y) /(rates() - growth())
    }
    dat <- data.frame(
      years = years,
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib
    )
    ndat <- gather(dat, key = "type", value = "balances", 2:4)
    ndat <-mutate(ndat, variable = fct_relevel(type, "no_contrib", "fixed_contrib", "growing_contrib"))
    
    if(input$facet == 1){
    ggplot(data = dat)+
      geom_line(aes(x = years, y = no_contrib, col="firebrick2"))+
      geom_point(aes(x = years, y = no_contrib, col="firebrick2"),size=0.5)+
      geom_line(aes(x = years, y = fixed_contrib, col="springgreen2"))+
      geom_point(aes(x = years, y = fixed_contrib, col="springgreen2"), size=0.5)+
      geom_line(aes(x = years, y = growing_contrib, col="steelblue2"))+
      geom_point(aes(x = years, y = growing_contrib, col="steelblue2"), size=0.5)+
      scale_colour_manual(values = c("firebrick2", "springgreen2", "steelblue2"),
                          labels = c("no_contrib", "fixed_contirb", "growing_contrib"), 
                          name="modality") +
      labs(x = "year", y = "balance")
     }else{
      ggplot(data = ndat,aes(x =years, y = balances, color = variable, fill = variable ))+
        geom_line()+
        geom_point(size =0.5)+
        geom_area(alpha = 0.5)+
        facet_wrap(~ variable)+
        labs(x = "year", y = "balance", title = "Three modes of investing")+
        theme_bw()
    } 
  })
 

  output$Balances<- renderPrint({
    amount <- input$amount
    contrib<-input$annual
    growth <- reactive({
      growth <- input$growth/100
      return(growth)
    })
    rates<- reactive({
      rates <- input$return/100
      return(rates)
    })
    years = 0:input$years
    no_contrib = rep(amount, (input$years + 1)) 
    fixed_contrib= rep(amount, (input$years+ 1))
    growing_contrib = rep(amount, (input$years + 1))
    
    for (y in years){
      no_contrib[y+1] <- amount * ((1 + rates())^y)
      fixed_contrib[y+1] <- no_contrib[y+1]  + (contrib * ((1 + rates())^y - 1) / rates())
      growing_contrib[y+1] <- no_contrib[y+1] + contrib * ((1 + rates())^y - (1 + growth())^y) /(rates() - growth())
    }
    dat <- data.frame(
      years = years,
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib
    )
    dat
  })
}

  
shinyApp(ui = ui, server = server)





