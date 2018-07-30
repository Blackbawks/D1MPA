#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(leaflet.esri)
library(RColorBrewer)
library(tidyverse)
library(rgdal)
library(sf)
library(rmapshaper)


Ad <- readRDS("data/adpecount.rds")
Ch <- readRDS("data/chpecount.rds")
Em <- readRDS("data/empecount.rds")
Ge <- readRDS("data/gepecount.rds")

#Ant <- readRDS("data/Antarctica_WGS84.rds")
all20k <- readRDS("data/all_20k.rds")
all30k <- readRDS("data/all_30k.rds")
all40k <- readRDS("data/all_40k.rds")
all60k <- readRDS("data/all_60k.rds")


# Define UI for application that draws a histogram
ui <- fluidPage(
  headerPanel('Most recent penguin counts from MAPPPD in CCAMLR region 48.1'),
  sidebarPanel(
    sliderInput("year","Year counted (range)",1960,2017,value=c(2000,2015),step=5,sep=''),
    p('Use the slider to explore the data. The range selected will highlight when particular penguin colonies were last counted.
      For example, selecting 1990 - 2000 will display all sites that were last counted between 1990 - 2000.'),
    p('You can toggle different species in the panel on the map, as well as different buffer zone sizes.'),
    p('Click on a marker to display information about the site including the season it was last counted, how many were counted, 
      and the type of unit for the count (adults/chicks/nests'),
    hr(),
    HTML('<p>All data can be found at the MAPPPD website: <a href="http://www.penguinmap.com">Penguinmap.com</a></p>'),
    HTML('<a href="http://www.penguinmap.com"><img src="MAPPPDlogo.png" width=75/></a>'),
    hr(),
    HTML('<p>More information on the MAPPPD project and the Antarctic site inventory can be found at: 
         <a href="http://www.oceanites.org">www.oceanites.org</a></p>'),
    HTML('<a href="http://www.oceanites.org"><img src="Oceanites-Logo4.jpg" width=125/></a>'),
    hr(),
    p('This site was constructed by:'),
    img(src='Logoblack_small.png',width=75),
    HTML('<p><a href="http://www.blackbawks.net">Black bawks data science ltd.</a><p>')
  ),
   mainPanel(
     leafletOutput("mymap",height=800),
     p()  
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  AdfilteredData <- reactive({
    x<-filter(Ad,season_starting>=input$year[1],season_starting<=input$year[2])
    if(nrow(x)==0){
      vc <- rep(NA,ncol(x))
      out <- rbind(x,vc)
      names(out) <- names(x)
      out$longitude_epsg_4326 <- 230
      out$latitude_epsg_4326 <- 230
    }else{
      out <- x
    }
    out
  })
  ChfilteredData <- reactive({
    x<-filter(Ch,season_starting>=input$year[1],season_starting<=input$year[2])
    if(nrow(x)==0){
      vc <- rep(NA,ncol(x))
      out <- rbind(x,vc)
      names(out) <- names(x)
      out$longitude_epsg_4326 <- 230
      out$latitude_epsg_4326 <- 230
    }else{
      out <- x
    }
    out
  })
  EmfilteredData <- reactive({
    x <- filter(Em,season_starting>=input$year[1],season_starting<=input$year[2])
    if(nrow(x)==0){
      vc <- rep(NA,ncol(x))
      out <- rbind(x,vc)
      names(out) <- names(x)
      out$longitude_epsg_4326 <- 230
      out$latitude_epsg_4326 <- 230
    }else{
      out <- x
    }
    out
  })
  GefilteredData <- reactive({
    x<-filter(Ge,season_starting>=input$year[1],season_starting<=input$year[2])
    if(nrow(x)==0){
      vc <- rep(NA,ncol(x))
      out <- rbind(x,vc)
      names(out) <- names(x)
      out$longitude_epsg_4326 <- 230
      out$latitude_epsg_4326 <- 230
    }else{
      out <- x
    }
    out
  })
  
  
  
  Adicons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = "green"
  )
  Chicons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = "orange"
  )
  Emicons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = "red"
  )
  Geicons <- awesomeIcons(
    icon = 'ios-close',
    iconColor = 'black',
    library = 'ion',
    markerColor = "blue"
  )
  
   output$mymap <- renderLeaflet({
     leaflet() %>%
       
       addEsriBasemapLayer(esriBasemapLayers$Oceans, autoLabels = TRUE) %>%
       setView(lng=-60,lat=-67,zoom=5) %>%
       
       
       addPolygons(data = all20k,color = "#444444", weight = 1, smoothFactor = 0.5,
                   opacity = 1.0, fillOpacity = 0.5,
                   fillColor = 'yellow',group='20 km buffer') %>%
       addPolygons(data = all30k,color = "#444444", weight = 1, smoothFactor = 0.5,
                   opacity = 1.0, fillOpacity = 0.5,
                   fillColor = 'yellow',group='30 km buffer') %>%
       addPolygons(data = all40k,color = "#444444", weight = 1, smoothFactor = 0.5,
                   opacity = 1.0, fillOpacity = 0.5,
                   fillColor = 'yellow',group='40 km buffer') %>%
       addPolygons(data = all60k,color = "#444444", weight = 1, smoothFactor = 0.5,
                   opacity = 1.0, fillOpacity = 0.5,
                   fillColor = 'yellow',group='60 km buffer')
     
   })
   
   observe({
     proxy = leafletProxy("mymap") %>% clearMarkers()

     proxy %>% 
       addAwesomeMarkers(data=AdfilteredData(),lng = ~longitude_epsg_4326,icon=Adicons,
                         lat = ~latitude_epsg_4326,label=AdfilteredData()$site_name,
                         popup = paste(AdfilteredData()$site_name, "<br>",
                                       "Last count:", AdfilteredData()$season_starting,'<br>',
                                       "Total estimate:", AdfilteredData()$penguin_count,'<br>',
                                       "Count type:", AdfilteredData()$count_type),group = "P. adeliae") %>%
       
       addAwesomeMarkers(data = ChfilteredData(),lng = ~longitude_epsg_4326,icon=Chicons,
                         lat = ~latitude_epsg_4326,label=ChfilteredData()$site_name,
                         popup = paste(ChfilteredData()$site_name, "<br>",
                                       "Last count:", ChfilteredData()$season_starting,'<br>',
                                       "Total estimate:", ChfilteredData()$penguin_count,'<br>',
                                       "Count type:", ChfilteredData()$count_type),group = "P. antarcticus") %>%

       addAwesomeMarkers(data = EmfilteredData(),lng = ~longitude_epsg_4326,icon=Emicons,
                         lat = ~latitude_epsg_4326, label=EmfilteredData()$site_name,
                         popup = paste(EmfilteredData()$site_name, "<br>",
                                       "Last count:", EmfilteredData()$season_starting,'<br>',
                                       "Total estimate:", EmfilteredData()$penguin_count,'<br>',
                                       "Count type:", EmfilteredData()$count_type),group = "A. forsteri") %>%
       addAwesomeMarkers(data = GefilteredData(),lng = ~longitude_epsg_4326,icon=Geicons,
                         lat = ~latitude_epsg_4326, label = GefilteredData()$site_name,
                         popup = paste(GefilteredData()$site_name, "<br>",
                                       "Last count:", GefilteredData()$season_starting,'<br>',
                                       "Total estimate:", GefilteredData()$penguin_count,'<br>',
                                       "Count type:", GefilteredData()$count_type),group = "P. papua") %>%
       
       
       
       addLayersControl(
         overlayGroups = c("P. adeliae", "P. antarcticus", "A. forsteri", "P. papua","20 km buffer", "30 km buffer", "40 km buffer", "60 km buffer"),
         options = layersControlOptions(collapsed = FALSE)
       ) %>% hideGroup("20 km buffer")%>% hideGroup("30 km buffer")%>% hideGroup("40 km buffer")%>% hideGroup("60 km buffer")
     
     
       
     
   })
   
   
   
}

# Run the application 
shinyApp(ui = ui, server = server)

