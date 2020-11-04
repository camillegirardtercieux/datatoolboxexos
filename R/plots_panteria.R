#' Compute the number of individuals per family
#'
#' @param pantheria
#'
#' @return a tibble with the number of individuals per family
data_plot_families <- function(pantheria) {
  pantheria_plot_families <- pantheria %>%
  dplyr::group_by(Family) %>%
  dplyr::mutate(n = dplyr::n()) %>%
  dplyr::filter(n>100) %>%
  dplyr::ungroup()
}

#' Barplot of the number of individuals per family
#'
#' @param pantheria_plot_families
#'
#' @return a barplot of the number of individuals per family
plot_families <- function(pantheria_plot_families) {
ggplot2::ggplot(pantheria_plot_families) +
    ggplot2::aes(x=forcats::fct_reorder(Family, n) , y=n) +
    ggplot2::geom_col() +
    ggplot2::labs(title = "Barplot of the number of individuals per family") +
    ggplot2::xlab("Family") + ggplot2::ylab("Number of individuals") +
    ggplot2::coord_flip()
}

#' Prepare data to plot litter size versus longevity
#'
#' @param pantheria
#'
#' @return a tibble
data_plot_littersize_longevity <- function (pantheria) {
  pantheria_plot_littersize_longevity <- pantheria %>%
    dplyr::filter(!is.na(Max_longevity_m), !is.na(Litter_size))%>%
    dplyr::group_by(Family)%>%
    dplyr::mutate(n=dplyr::n())%>%
    dplyr::ungroup()%>%
    dplyr::filter(n>10)
}

#' Scatter plot of litter size versus longevity
#'
#' @param pantheria_plot_littersize_longevity
#'
#' @return a scatter plot of litter size versus longevity
plot_littersize_longevity <- function (data_plot_littersize_longevity) {
  ggplot2::ggplot(pantheria_plot_littersize_longevity) +
    ggplot2::aes(x=Max_longevity_m, y=Litter_size, col=Family) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method="lm") +
    ggplot2::xlab("Maximum longevity")+
    ggplot2::ylab("Litter size")+
    ggplot2::facet_wrap(~ Family, nrow = 3)+
    ggplot2::ggtitle("Scatterplot of littersize versus longevity")
}
