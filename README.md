
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r311 <img align="right" height="150" src="man/figures/logo.png">

<!-- badges: start -->

[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](https://ropengov.org/)
[![R-CMD-check](https://github.com/rOpenGov/r311/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rOpenGov/r311/actions/workflows/R-CMD-check.yaml)
[![CRAN](https://www.r-pkg.org/badges/version/r311)](https://cran.r-project.org/package=r311)
[![Codecov test
coverage](https://codecov.io/gh/rOpenGov/r311/branch/main/graph/badge.svg)](https://app.codecov.io/gh/rOpenGov/r311?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/rOpenGov/r311/badge)](https://www.codefactor.io/repository/github/rOpenGov/r311)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

`{r311}` is an R interface to the international standard
[open311](https://www.open311.org/). Open311 APIs are used for civic
issue management and public service communication. The standard allows
administrations to better manage citizen requests, citizens to more
easily submit requests, and (hence this package) researchers and data
scientists to access data regarding public service communication.
`{r311}` supports the seamless management and supplementation of
available endpoints, the selection of appropriate APIs to access, and
the retrieval of civic service and request data. Custom queries and
extensions (e.g. from CitySDK) are implicitly supported. `{r311}` is
designed to require a minimal amount of dependencies, but allow for easy
integration into common R frameworks such as the tidyverse, `sf` or
`xml2`.

## Installation

You can install `{r311}` from CRAN with:

``` r
install.packages("r311")
```

Or you can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("rOpenGov/r311")
```

## Example

The following example loads `{r311}`, sets up a jurisdiction and
retrieves a small amount of data on service tickets in Cologne, Germany.

``` r
library(r311)

o311_api("Cologne")
o311_requests()
#> Simple feature collection with 100 features and 11 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 6.821324 ymin: 50.86269 xmax: 7.091088 ymax: 51.05102
#> Geodetic CRS:  WGS 84
#> # A tibble: 100 × 12
#>    service_request_id title              description address_string service_name
#>    <chr>              <chr>              <chr>       <chr>          <chr>       
#>  1 30964-2024         #30964-2024 Leuch… "Die Stras… 51061 Köln - … Leuchtmitte…
#>  2 30965-2024         #30965-2024 Straß… "Das Schil… 51103 Köln - … Straßenbaus…
#>  3 30966-2024         #30966-2024 Defek… "Auf dem R… 51103 Köln - … Defekte Obe…
#>  4 30967-2024         #30967-2024 Wilde… "Der Müll … 50859 Köln - … Wilder Müll 
#>  5 30968-2024         #30968-2024 Schro… "Ein fahru… 51069 Köln - … Schrottfahr…
#>  6 30969-2024         #30969-2024 Schro… "Sehr geeh… 50733 Köln - … Schrott-Kfz 
#>  7 30970-2024         #30970-2024 Wilde…  <NA>       51105 Köln - … Wilder Müll 
#>  8 30971-2024         #30971-2024 Schro… "Schrottra… 50935 Köln - … Schrottfahr…
#>  9 30972-2024         #30972-2024 Graff… "grafitti … 50733 Köln - … Graffiti    
#> 10 30973-2024         #30973-2024 Wilde… "Kühlschra… 50672 Köln - … Wilder Müll 
#> # ℹ 90 more rows
#> # ℹ 7 more variables: requested_datetime <chr>, updated_datetime <chr>,
#> #   status <chr>, media_url <chr>, status_note <chr>, service_code <chr>,
#> #   geometry <POINT [°]>
```

## API upkeep

`{r311}` is powered by a JSON of available APIs (see
[here](https://github.com/rOpenGov/r311/blob/main/inst/endpoints.json)).
This list does not claim to be comprehensive nor up-to-date at all times
but is updated from time to time. If an API is found to be unavailable
for an extended period of time, it will be marked as “questioning”.
Questionable APIs will be removed on the next release.

If you know about a stable open311 API that should be added to the list,
please consider opening an issue. Otherwise, you can also just use the
`o311_add_endpoint()` function to add the API locally.
