knitr::knit("vignettes/r311.Rmd.orig", output = "vignettes/r311.Rmd")

# the figure directory is stored in the top directory, so it needs to be moved
unlink("vignettes/figure", recursive = TRUE)
for (file in dir("figure", full.names = TRUE)) {
  file.rename(file, file.path("man/figures", basename(file)))
}
unlink("figure", recursive = TRUE)

# remove figure captions
vignette <- readLines("vignettes/r311.Rmd")
figures <- stringr::str_match(vignette, "!\\[.+\\]\\(figure.+\\)")
figure_lines <- which(!is.na(figures))
vignette[figure_lines] <- gsub("\\[.+\\]", "\\[\\]", vignette[figure_lines])
vignette[figure_lines] <- gsub("\\(figure(.+)\\)", "(../man/figures/\\1)", vignette[figure_lines])
writeLines(vignette, "vignettes/r311.Rmd")
