httr::user_agent(
  sprintf(
    "clearbit R package v%s: (<%s>)",
    utils::packageVersion("clearbit"),
    utils::packageDescription("clearbit")$URL
  )
) -> .CLEARBIT_UA

#' Get or set CLEARBIT_API_KEY value
#'
#' @param force Force setting a new Rapid7 Open Data API key for the current environment?
#' @return atomic character vector containing the Clearbit API key
#' @export
clearbit_api_key <- function(force = FALSE) {

  env <- Sys.getenv('CLEARBIT_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var CLEARBIT_API_KEY to your Clearbit API key",
         call. = FALSE)
  }

  message("Couldn't find env var CLEARBIT_API_KEY See ?clearbit_api_key for more details.")
  message("Please enter your Clearbit API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Clearbit API key entry failed", call. = FALSE)
  }

  message("Updating CLEARBIT_API_KEY env var...")
  Sys.setenv(CLEARBIT_API_KEY = pat)

  pat

}

#' The Company Name to Domain API lets you convert the exact name of a company
#' to a website domain, and a logo.
#'
#' Clearbit matches based on exact company name, and returns the company with the most
#' website traffic. It’s worth noting, that since a company name is not a unique
#' identifier, you should be prepared for some inherent inaccuracy in the results.
#'
#' @param name name of the company to look for
#' @param api_key Clearbit API key. See [clearbit_api_key()]
#' @return data frame containing `domain`, `logo`, and `name` if found. `NULL` if not
#' @export
name_to_domain <- function(name, api_key = clearbit_api_key()) {

  httr::GET(
    url = "https://company.clearbit.com/v1/domains/find",
    httr::authenticate(
      user = api_key,
      password = ""
    ),
    query = list(
      name = name[1]
    ),
    .CLEARBIT_UA
  ) -> res

  status <- httr::status_code(res)

  if (status == 200) {

    out <- httr::content(res, as = "text", encoding = "UTF-8")
    out <- jsonlite::fromJSON(out)
    as.data.frame(out)

  } else if (status == 404) {

    warning("Company not found.")
    NULL

  } else if (status == 422) {

    warning("Company name is invalid.")
    NULL

  }

}


#' The Company Name to Domain API lets you convert the exact name of a company
#' to a website domain, and a logo.
#'
#' The Company API allows you to look up a company by their domain. Alongside
#' the domain you may also provide any additional attributes you have about the
#' company, such as their company name or twitter handle. Including more detail
#' will help us be more accurate when searching.
#'
#' @param domain name of the company to look for
#' @param api_key Clearbit API key. See [clearbit_api_key()]
#' @return data frame if found. `NULL` if not
#' @export
domain_to_org <- function(domain, api_key = clearbit_api_key()) {

  httr::GET(
    url = "https://company.clearbit.com/v2/companies/find",
    httr::authenticate(
      user = api_key,
      password = ""
    ),
    query = list(
      domain = domain[1]
    ),
    .CLEARBIT_UA
  ) -> res

  status <- httr::status_code(res)

  if (status == 200) {

    out <- httr::content(res, as = "text", encoding = "UTF-8")
    out <- jsonlite::fromJSON(out)
    out

  } else if (status == 202) {

    out <- httr::content(res, as = "text", encoding = "UTF-8")
    out <- jsonlite::fromJSON(out)
    out

  } else if (status == 404) {

    warning("Company not found.")
    NULL

  } else if (status == 422) {

    warning("Domain name is invalid.")
    NULL

  }

}