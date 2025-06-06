% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/services.R
\name{o311_services}
\alias{o311_services}
\alias{o311_service}
\title{Get service list}
\usage{
o311_services(...)

o311_service(service_code, ...)
}
\arguments{
\item{...}{Further endpoint-specific parameters as documented in the
respective endpoint reference.}

\item{service_code}{Identifier of a single service definition. Service
codes can usually be retrieved from \code{o311_services}.}
}
\value{
A dataframe or list containing information about each service.
}
\description{
Get a list of available services. Services are unique to the endpoint / city
and thus require an attached jurisdiction using
\code{\link{o311_api}}.
}
\examples{
# set up a jurisdiction
o311_api("san francisco")
\donttest{
if (o311_ok()) {
  # get a list of all services
  services <- o311_services()

  # inspect a service code
  o311_service(services$service_code[1])
}
}
}
