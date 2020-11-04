
#' Get pantheria data
#'
#' @return tibble with info on panthers
#' @export
#'
data_pantheria <- function() {

  readr::read_delim(here::here("data", "pantheria-traits", "PanTHERIA_1-0_WR05_Aug2008.txt"), delim = "\t")

}

#' Tidy the pantheria dataset
#'
#' @param pantheria
#'
#' @return tidy pantheria tibble
#' @export
#'
tidy_pantheria <- function(pantheria) {

  pantheria %>%
    dplyr::mutate(MSW05_Order = as.factor(MSW05_Order), MSW05_Family = as.factor (MSW05_Family))%>%
    dplyr::rename(Order = MSW05_Order, Family = MSW05_Family, adult_body_mass_g = `5-1_AdultBodyMass_g`, Disperal_age_d = `7-1_DispersalAge_d`, Gestation_length_d = `9-1_GestationLen_d`, Homerange_indiv_km2 = `22-2_HomeRange_Indiv_km2`, Litters_peryear = `16-1_LittersPerYear`, Max_longevity_m = `17-1_MaxLongevity_m`, Litter_size = `15-1_LitterSize`)%>%
    dplyr::select(Family, Order, Max_longevity_m, Homerange_indiv_km2, Litter_size )%>%
    dplyr::na_if(-999)
}
