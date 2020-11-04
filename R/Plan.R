
#' Write a basic plan
#'
#' @return return a drake plan
write_plan_simple <- function() {
  drake::drake_plan(
    eco_list = datatoolboxexos::data_ecoregion(),
    sp_eco = datatoolboxexos::data_mammals_ecoregions(),
    sp_list = datatoolboxexos::data_mammals(),
    ursus_list = datatoolboxexos::select_ursus(sp_list),
    ursus_join = datatoolboxexos::joints_ursus_eco(ursus_list, sp_eco, eco_list),
    ursus_eco = datatoolboxexos::get_ecoregions_nb(ursus_join),
    pantheria = datatoolboxexos::data_pantheria(),
    pantheria_tidy = datatoolboxexos::tidy_pantheria(pantheria)
  )
}
