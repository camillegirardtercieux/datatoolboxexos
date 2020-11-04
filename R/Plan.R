
#' Write a basic plan
#'
#' @return return a drake plan
#' @export
#' @import  from drake drake_plan
#'
write_plan_simple <- function() {
  drake::drake_plan(
    eco_list = datatoolboxexos::data_ecoregion(),
    sp_eco = datatoolboxexos::data_mammals_ecoregions(),
    sp_list = datatoolboxexos::data_mammals(),
    pantheria = datatoolboxexos::data_pantheria(),
    ursus_list = datatoolboxexos::select_ursus(sp_list)
  )
}
