# Notes:
#   This file is used for installing the required R packages that this repo
#   will be using. We can use it to install both CRAN and GitHub packages.

CRAN_PKGS <- c(
    "rjags",
    "devtools",
    "tidyverse",
    "modules",
    "splitstackshape",
    "usmap",
    "Ternary",
    "here",
    "optparse",
    "googledrive",
    "RCurl",
    "Hmisc",
    "pracma",
    "KernSmooth"
)

GH_PKGS <- c("tidyverse/googlesheets4")


# This is a quick function to perform package installs for both the
# CRAN package as well as the GitHub packages via devtools

install_pkgs <- function(pkg_vec, cran = TRUE) {
    if (cran) {
        for (pkg in pkg_vec) {
            install.packages(
                pkg,
                repos = "https://cran.r-project.org",
                Ncpus = 3
            )
        }
    } else {
        for (pkg in pkg_vec) {
            devtools::install_github(pkg)
        }
    }
}


install <- function() {
    install_pkgs(CRAN_PKGS)
    install_pkgs(GH_PKGS, cran = FALSE)
}

install()
