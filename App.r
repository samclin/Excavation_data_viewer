library(shiny)
library(RODBC)
library(stringr)
library(plotly)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(shinyFiles)

# Define UI ----
ui <- fluidPage(
  
  titlePanel("Archaeological Excavation Data Viewer"), 
  h4("by Sam Lin, University of Wollongong"),
  hr(),
  
  fluidRow (
	column (1,
		#shinyFilesButton("file", label="Select file", title="Please select a file", FALSE),
		
		fileInput('file', 'Select mdb',multiple = TRUE,
		          accept=c('.mdb')),
		
		#actionButton("set_file", label="Load file"),
		
		sliderInput (inputId="Point_size",
                   label="Point size",
                   min=1,
                   max=10,
                   value=5),
				   
		sliderInput (inputId="Opacity",
                   label="Opacity",
                   min=0,
                   max=1,
                   value=1),
				   
		sliderInput (inputId="colour_seed",
                   label="Colour pallete",
                   min=1,
                   max=100,
                   value=9),
				   
		selectInput(inputId="Colour_by", 
                  label="Colour by",
                  choices = c("Unit", "level", "code"), selected = "code"),
		
		uiOutput("Unit"),
	
		uiOutput("Level")
		
		),

	
	#column (1,
	#	checkboxGroupInput(inputId = "Spit", label = "Spit", choices = 'No choices here yet')
	#),
	
	column (1,	
		uiOutput("Code")
	),
		
    column(8,
		plotlyOutput(outputId="myplot", width = "1400px", height = "600px"),
		#textOutput(outputId="mytext"),
		#textOutput(outputId="mytext2")
	)    
    
  )
)


# Define server logic ----
server <- function(input, output) {

	my_pal <- reactive ({
		
		set.seed(input$colour_seed)
		n <- 25
		qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
		col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))
		
		return(sample(col_vector, n))

	})

	#options(shiny.maxRequestSize=30*1024^2)
	
	#shinyFileChoose(input,'file', roots=getVolumes()())
	
	

		observeEvent (input$file, {
		
			#filepaths <- ( parseFilePaths(roots=getVolumes()(), input$file))
			#db <- as.vector(as.character(filepaths$datapath))
			#output$mytext <- renderPrint({db})
		  inFile <- input$file
			db <- inFile$datapath
		  
			con <- odbcConnectAccess(db)
			context <- sqlFetch(con, "Context")
			xyz <- sqlFetch(con, "xyz")
				
			context$squid <- paste(context$Unit, "-", trimws(context$ID), sep="")
			xyz$squid <- paste(xyz$Unit, "-", trimws(xyz$ID), sep="")
			
			
			unit_list <- str_sort(unique(context$Unit), numeric=TRUE)
			level_list <- str_sort(unique(context$level), numeric=TRUE)
			#spit_list <- str_sort(unique(context$SPIT), numeric=TRUE)
			code_list <- str_sort(unique(context$code), numeric=TRUE)
			
			output$Unit <- renderUI({checkboxGroupInput(inputId = "Unit", label = "Unit", choices = unit_list, selected = unit_list)})
			output$Level <- renderUI({checkboxGroupInput(inputId = "Level", label = "Level", choices = level_list, selected = level_list)})
			output$Code <- renderUI({checkboxGroupInput(inputId = "Code", label = "Code", choices = code_list, selected=c('Lithic'))})
		
					
			to_plot <- reactive({

				all_points <- merge(context, xyz[,c("Suffix", "Prism", "X", "Y", "Z", "squid")], by="squid")
		
				all_points$to_colour_by <- all_points[, colnames(all_points)==input$Colour_by]
				all_points$to_colour_by <- as.factor(all_points$to_colour_by)
				all_points$to_colour_by <- factor(all_points$to_colour_by, levels=str_sort(unique(all_points$to_colour_by), numeric=TRUE))
		
				#colourCount = length(unique(all_points$to_colour_by))
				#getPalette = colorRampPalette(pal_d3("category20")(20))
				#all_points$colour <- my_pal[all_points$to_colour_by]
		
				subset_points <- all_points %>% filter (Unit %in% input$Unit, 
						level %in% input$Level,
						#SPIT %in% input$Spit,
						code %in% input$Code) 

				return(subset_points)
		
			})
			
			output$myplot <- renderPlotly({ 
		
				plot_ly(to_plot(), x=~X, y=~Y, z=~Z, color=~to_colour_by, colors=my_pal(), 
				marker = list(size = input$Point_size, opacity=input$Opacity), type="scatter3d", mode="markers",
				hoverinfo='text', text=~paste('</br> Unit:', Unit, '</br> ID:', ID, '</br> Code:', code, '</br> Level:', level)) %>% 
				layout(scene = list(aspectmode = "manual", aspectratio = list(x=1, y=1, z=0.3)))
             
			})
			
	  
  #output$mytable <- renderTable({to_plot()})

})
}

# Run the app ----
shinyApp(ui = ui, server = server)
