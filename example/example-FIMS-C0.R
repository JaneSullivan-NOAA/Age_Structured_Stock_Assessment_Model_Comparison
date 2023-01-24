
# Operating model for FIMS first test case 0 where logR_sd = 0. All other OM
# settings are the same as case 0 in Li et al. 2021
# https://spo.nmfs.noaa.gov/sites/default/files/pdf-content/fish-bull/11923li.pdf

# User will need to pick a "Set up" option below depending on their workflow...

# Set up OPTION 1: If user wants to use the ASSAMC package in their own project --------------------
# install.packages("remotes")
# install.packages("devtools")
remotes::install_github(repo="Bai-Li-NOAA/Age_Structured_Stock_Assessment_Model_Comparison")
library(ASSAMC)
maindir <- getwd() # or wherever you want your project rooted

# Set up OPTION 2: If user is developing within the ASSAMC package ------------------------------

# setwd() at project root if not there, e.g.,
# setwd("C:/Users/bai.li/Documents/Age_Structured_Stock_Assessment_Model_Comparison/")
devtools::load_all()
maindir <- paste0(getwd(), "/example")

# generate C0 base case input ----
input <- save_initial_input(base_case = TRUE, case_name = "FIMS-C0")

# make changes from C0 to FIMS-C0
input$maindir <- maindir # location for new FIMS-C0 directory
input$om_sim_num <- 1 # total number of iterations per case
input$keep_sim_num <- 1 # number of kept iterations per case
input$figure_number <- 1 # number of individual iteration to plot
input$logR_sd <- 0 # deterministic case for FIMS testing

# Run om ----
run_om(input_list = input)

# load(file = paste0(maindir, '/FIMS-C0/output/OM/OM1.RData'))
