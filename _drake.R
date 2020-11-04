devtools::load_all()

config <- drake::drake_config(
  plan=datatoolboxexos::write_plan_simple(),
  envir=getNamespace("datatoolboxexos")
)
