## History of the development steps !

usethis::use_pipe() #to get the pipe
devtools::document() #Build documentation

#Drake
usethis::use_r(name="Plan.R")
file.create("_drake.R")
dir.create("output")
dir.create("output/plots")
dir.create("output/text")

usethis::use_build_ignore(".drake")
usethis::use_git_ignore(".drake") #sometimes too big to go on Git
usethis::use_build_ignore("_drake.R")
usethis::use_build_ignore("make.R")
usethis::use_build_ignore("output/")

