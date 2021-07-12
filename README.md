
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![R-CMD-check](https://github.com/hrbrmstr/clearbit/workflows/R-CMD-check/badge.svg)](https://github.com/hrbrmstr/clearbit/actions?query=workflow%3AR-CMD-check)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/clearbit.svg?branch=master)](https://travis-ci.org/hrbrmstr/clearbit)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# clearbit

Tools to Query Clearbit

## Description

Clearbit provides an interface to perform queries on organizations and
people.

## What’s Inside The Tin

The following functions are implemented:

-   `clearbit_api_key`: Get or set CLEARBIT\_API\_KEY value
-   `domain_to_org`: The Company Name to Domain API lets you convert the
    exact name of a company to a website domain, and a logo.
-   `name_to_domain`: The Company Name to Domain API lets you convert
    the exact name of a company to a website domain, and a logo.

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/clearbit.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/clearbit")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(clearbit)

# current version
packageVersion("clearbit")
## [1] '0.1.0'
```

## clearbit Metrics

| Lang | \# Files | (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
|:-----|---------:|----:|----:|-----:|------------:|-----:|---------:|-----:|
| R    |        3 | 0.3 |  82 | 0.37 |          35 | 0.34 |       36 | 0.27 |
| YAML |        1 | 0.1 |  22 | 0.10 |           2 | 0.02 |        2 | 0.02 |
| Rmd  |        1 | 0.1 |   8 | 0.04 |          15 | 0.14 |       28 | 0.21 |
| SUM  |        5 | 0.5 | 112 | 0.50 |          52 | 0.50 |       66 | 0.50 |

clock Package Metrics for clearbit

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
