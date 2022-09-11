###############################################.
## Header ---- 
###############################################.
tagList( #needed for shinyjs
  useShinyjs(),  # Include shinyjs
  introjsUI(),   # Required to enable introjs scripts
  navbarPage(id = "intabset", #needed for landing page
             title = div(tags$a(img(src="scotpho_reduced.png", height=40), href= "http://www.scotpho.org.uk/"),
                         style = "position: relative; top: -5px;"), # Navigation bar
             windowTitle = "ScotPHO profiles", #title for browser tab
             theme = shinytheme("cerulean"), #Theme of the app (blue navbar)
             collapsible = TRUE, #tab panels collapse into menu in small screens
             header = tags$head(includeCSS("www/styles.css"), # CSS styles
                                HTML("<html lang='en'>"),
                                tags$link(rel="shortcut icon", href="favicon_scotpho.ico"), #Icon for browser tab
                                #Including Google analytics
                                includeScript("google-analytics.js"),
                                HTML("<base target='_blank'>"),
                                cookie_box),
             ###############################################.
             ## Landing page ----
             ###############################################.
             tabPanel(
               title = " Home", icon = icon("home"),
               mainPanel(width = 11, style="margin-left:4%; margin-right:4%",
                         introBox(  
                           fluidRow(column(7,(h3("Welcome to the ScotPHO profiles", style="margin-top:0px;"))),
                                    (column(4,actionButton("btn_landing",label="Help: Take tour of the tool",icon=icon('question-circle'),class="down")))),
                           data.step = 1,
                           data.intro =(p(h4("Welcome to the ScotPHO Profiles Tool"),
                                          h5("This interactive tool provides access to a range of public
                              health related indicators at different geographies including NHS boards, council areas and health and
                              social care partnerships."),
                              br(),
                              h5("There are different ways to navigate around the tool."),
                              h5("Different visualisations can be opened using the menu bar (the blue strip) at the top of the screen."),
                              img(src='introjs_tabset_panel.PNG',width=300),
                              br(),
                              h5("The 'Home' option in the menu bar will return to the profiles tool homepage."),
                              style = "color:0E3E5D; font-size:20px")),
                           data.position = "left"),
                         fluidRow(
                           #Summary box
                           column(6, class="landing-page-column",br(), #spacing
                                  introBox(
                                    lp_main_box(image_name= "landing_button_heatmap_2", 
                                                button_name = 'jump_to_summary', title_box = "Profile summary",
                                                description = 'A high level view of an area across a set of indicators'),
                                    data.step = 2,
                                    data.intro = h5("The profile summary allows you to look at multiple indicators within an area at the same time"),
                                    data.position = "bottom-right-aligned")),       
                           #Table box 
                           column(6, class="landing-page-column",
                                  br(), #spacing
                                  introBox( # tour of the tool
                                    lp_main_box(image_name= "landing_button_data_table", 
                                                button_name = 'jump_to_table', title_box = "Data",
                                                description = 'View and download the data behind the tool'),
                                    data.step = 6,
                                    data.intro = h5("The 'Data' window can be used to filter and download profiles data")))),
                         #2nd row of boxes
                         fluidRow(
                           br(), #spacing
                           column(8, style = "padding-left: 0px; padding-right: 0px;", 
                                  introBox( #tour of the rank and trend tabs
                                    data.step = 3,
                                    data.intro = h5("The trend and rank charts allow detailed exploration of one indicator at a time."),
                                    #Trend plot box
                                    column(6, class="landing-page-column",
                                           lp_main_box(image_name= "landing_button_time_trend", 
                                                       button_name = 'jump_to_trend', title_box = "Trend",
                                                       description = 'Look at how an indicator changes over time')),
                                    #Rank/map plot box
                                    column(6, class="landing-page-column",
                                           lp_main_box(image_name= "landing_button_maprank", 
                                                       button_name = 'jump_to_rank', title_box = "Rank",
                                                       description = 'Compare geographical variation for an indicator'))
                                  )),#introBox 3 close
                           #Inequalities box
                           column(4, class="landing-page-column",
                                  introBox(
                                    data.step = 7,
                                    data.intro = h5("The inequalities module allows exploration of deprivation effects for a selection of indicators from the main profiles tool."),
                                    lp_main_box(image_name= "landing_button_health_inequality", 
                                                button_name = 'jump_to_ineq', title_box = "Health inequalities",
                                                description = 'Explore how an indicator varies with deprivation'))
                           ) #introBox 7 close
                         ), # fluid row close
                         # end of landing page second row
                         # third row of landing page 
                         fluidRow(
                           introBox(data.step=8, # tour around the tool
                                    data.intro =h5("There are also options to find out information such as detailed descriptions of the profile indicators, indicator update schedules and links to evidence for action briefings"),
                                    #About box
                                    column(4, class="landing-page-column",
                                           lp_about_box(image_name= "landing_button_about_2", button_name = 'jump_to_about',
                                                        title_box = "About", description = 'About ScotPHO Profiles'),
                                           #Evidence box
                                           div(class="landing-page-box-about", 
                                               div("Evidence for action",title="Links to briefing documents containing practical actions for improvement", class = "landing-page-box-title" ),
                                               div(class = "landing-page-about-icon", div(img(src="landing_button_other_profile.png",class="centerabout"))),
                                               actionButton('jump_to_efa', 'Links to ScotPHO evidence for action briefings', 
                                                            onclick ="window.open('https://www.scotpho.org.uk/comparative-health/profiles/resources/evidence-for-action/', '_blank')",
                                                            class="landing-page-button", 
                                                            icon = icon("arrow-circle-right", "icon-lp")))),
                                    column(4, class="landing-page-column", 
                                           #Indicator updates
                                           lp_about_box(image_name= "landing_button_calendar", button_name = 'btn_indicator_updates', 
                                                        title_box = "Indicator updates", 
                                                        description = 'Find out which indicators have been updated in the last 60 days'),
                                           #Resources box
                                           lp_about_box(image_name= "landing_button_resources", button_name = 'jump_to_resources', 
                                                        title_box = "Resources", 
                                                        description = 'Find technical information about the ScotPHO profile definitions and methodology')),
                                    column(4, class="landing-page-column",
                                           #Definitions
                                           lp_about_box(image_name= "landing_button_technical_resources",
                                                        button_name = 'jump_to_definitions', title_box = "Definitions", 
                                                        description = 'Find out about indicator definitions and data sources'),
                                           #Other profiles
                                           lp_about_box(image_name= "landing_button_related_links", button_name = 'jump_to_others', 
                                                        title_box = "Other profiles", description = 'Links to alternative profiling tools'))
                           ) #Close IntroBox
                         )#Fluidrow bracket
               ) #main Panel bracket
             ),# tab panel bracket
             ###############################################.
             ## Summary ----
             ###############################################.
), #Bracket  navbarPage

             div(style = "margin-bottom: 30px;"), # this adds breathing space between content and footer
             ###############################################.             
             ##############Footer----    
             ###############################################.
             #Copyright warning
             tags$footer(column(6, "© Scottish Public Health Observatory v2.0 2018"), 
                         column(2, tags$a(href="mailto:phs.scotpho@phs.scot", tags$b("Contact us!"), 
                                          class="externallink", style = "color: white; text-decoration: none")), 
                         column(3, tags$a(href="https://www.scotpho.org.uk/about-us/scotpho-website-policies-and-statements/privacy-and-cookies", tags$b("Privacy & cookies"), 
                                          class="externallink", style = "color: white; text-decoration: none")), 
                         column(1, actionLink("twitter_share", label = "Share", icon = icon("twitter"),
                                              style= "color:white;", onclick = sprintf("window.open('%s')", 
                                                                                       "https://twitter.com/intent/tweet?text=Check%out%ScotPHO's%profile%tool&url=https://scotland.shinyapps.io/ScotPHO_profiles_tool/"))), 
                         style = "
   position:fixed;
   text-align:center;
   left: 0;
   bottom:0;
   width:100%;
   z-index:1000;  
   height:30px; /* Height of the footer */
   color: white;
   padding: 10px;
   font-weight: bold;
   background-color: #1995dc"
             ) 
   ################################################.
  ) #bracket tagList
  ###END