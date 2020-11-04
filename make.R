##################################################

### Data and Code for the Datatoolbox exercise ###

##################################################

# ----- clean workspace
rm(list = ls())

# ----- install/update packages
devtools::install_deps()

# ----- install compendium package
#devtools::install(build = FALSE)
devtools::load_all()

# ----- Knit exos
rmarkdown::render(here::here("exercices","exo_dplyr.Rmd"))
rmarkdown::render(here::here("exercices","exo_ggplot.Rmd"))

# ----- Drake
#Execute plan
drake::r_make()
#Visualise
drake::r_vis_drake_graph(targets_only=T)
drake::r_vis_drake_graph()
