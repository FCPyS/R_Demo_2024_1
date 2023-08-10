# Paquetes para el curso


install.packages("remotes")
install.packages("devtools")


options(timeout = 600)
remotes::install_github("PPgp/wpp2022")
library()

# requires the development version of rstan, sorry!
remotes::install_github("mpascariu/MortalityLaws")
install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
remotes::install_github("timriffe/DemoTools")

# Paquetes                        ----------------------------------------------
if (!require("pacman")) install.packages("pacman")#instala pacman si se requiere

pacman::p_load(tidyverse, readxl, magrittr, # paquetes de uso
               wppExplorer, wpp2019, wpp2022,
               WDI, geodata, 
               inegiR, apyramid,
               fmsb, DemoTools, LexisPlotR)


remotes::install_github("diegovalle/mxmaps")
library(mxmaps)

