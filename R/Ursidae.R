
#' Selection of Ursidae only
#'
#' @param sp_list
#'
#' @return ursus_list the list of all Ursidae species
#' @export
select_ursus <- function (sp_list) {
    ursus_list <- sp_list%>%
    dplyr::filter(family == "Ursidae") %>%
    # Suppression of a synonym
    dplyr::filter(sci_name != "Ursus malayanus") %>%
    dplyr::select(species_id, sci_name, common)
}

#' Joint in order to have ecoregions info
#'
#' @param ursus_list
#' @param sp_eco
#' @param eco_list
#'
#' @return joints_ursus, a tibble containing infos on Ursus and ecoregions
joints_ursus_eco <- function(ursus_list, sp_eco, eco_list) {
    ursus_eco <- ursus_list %>% dplyr::left_join(sp_eco)%>%
    dplyr::left_join(eco_list, by = "ecoregion_id")
}

#' Number of realms where each Ursidae species is found
#'
#' @param ursus_eco
#'
#' @return ursus_realm a tibble counting the number of realms containing Ursidae species
get_realm_nb <- function(ursus_eco){
  ursus_realm <- ursus_eco %>% dplyr::group_by(sci_name) %>%
    dplyr::summarise(n_realms  = dplyr::n_distinct(realm))
}

#' Number of biomes where each Ursidae species is found
#'
#' @param ursus_eco
#'
#' @return ursus_biomes a tibble counting the number of biomes containing Ursidae species
get_biome_nb <- function(ursus_eco){
  ursus_biomes <- ursus_eco %>% dplyr::group_by(sci_name) %>%
    dplyr::summarise(n_biomes = dplyr::n_distinct(biome))
}


#' Number of ecoregions where each Ursidae species is found
#'
#' @param ursus_eco
#'
#' @return ursus_ecoregions a tibble counting the number of ecoregions containing Ursidae species
get_ecoregions_nb <- function(ursus_eco){
  ursus_ecoregions <- ursus_eco %>% dplyr::group_by(sci_name) %>%
    dplyr::summarise(n_ecoregions = dplyr::n_distinct(ecoregion))
}

#' Combination of all info
#'
#' @param ursus_realm
#' @param ursus_biomes
#' @param ursus_ecoregions
#' @param ursus_list
#'
#' @return ursus_all_infos a tibble containing all info on Ursidae species
combine_all_ursus <- function(ursus_realm, ursus_biomes, ursus_ecoregions, ursus_list) {
  ursus_all_infos <- ursus_realm %>%
    dplyr::left_join(ursus_biomes, by = "sci_name") %>%
    dplyr::left_join(ursus_ecoregions, by = "sci_name") %>%
    dplyr::left_join(ursus_list, by = "sci_name") %>%
    dplyr::select(sci_name, common, n_realms, n_biomes, n_ecoregions) %>%
    dplyr::arrange(desc(n_ecoregions))
}
