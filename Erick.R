###############################################################################-
## Fusionado de la ENVIPE
###############################################################################-

# Paquetes  ----

pacman::p_load(tidyverse, sjlabelled, magrittr)

# Importación----

# Para trabajar más rápido lo que hice fue descarga la base en formato .RData

load("datos/BD_ENVIPE_2022.RData")

# En total son los siguientes objetos

ls()

# Fusionado ----

TPer_Vic<- TPer_Vic1 %>% # fusiona las dos partes del módulo de victimizacióna
  left_join(TPer_Vic2)

envipe2022<-TVivienda %>% 
  dplyr::left_join(THogar, by="ID_VIV") %>% 
  select(-ends_with(".y")) %>% # bota las que termina en .y
  rename_at(vars(ends_with( ".x" )) , ~ str_remove_all(., ".x") )  %>%  # quita el .x 
  dplyr::inner_join(TSDem, by="ID_HOG") %>%  # me quedo con viviendas con hogares
  select(-ends_with(".y")) %>% # bota las que termina en .y
  rename_at(vars(ends_with( ".x" )) , ~ str_remove_all(., ".x") ) %>%   # quita el .x 
  dplyr::left_join(TPer_Vic, by= "ID_PER") %>% 
  select(-ends_with(".y")) %>% # bota las que termina en .y
  rename_at(vars(ends_with( ".x" )) , ~ str_remove_all(., ".x") )   # quita el .x 
  
  
rm(THogar, TMod_Vic, TPer_Vic, TPer_Vic1, TPer_Vic2, TSDem, TVivienda)  