######################################################################################################
# Create_the_DataInCode_Package.v0.1.R
# 31 10 2021
######################################################################################################
# source("/Users/abel.vertesy/GitHub/Packages/DataInCode/Development/Create_the_DataInCode_Package.v0.1.R")
rm(list = ls(all.names = TRUE));
try(dev.off(), silent = TRUE)
# install.packages("devtools")
# Functions ------------------------
try (source('~/GitHub/Packages/CodeAndRoll/CodeAndRoll.R'),silent= FALSE)

# irequire("devtools")
# install_version("devtools", version = "2.0.2", repos = "http://cran.at.r-project.org")
irequire("devtools")
irequire("roxygen2")
irequire("stringr")

kollapse <-function(..., print = TRUE) {
if (print == TRUE) {
    print(paste0(c(...), collapse = ""))
  }
  paste0(c(...), collapse = "")
}

# Setup ------------------------
PackageName = 	"DataInCode"
setwd("~/GitHub/Packages/")

RepositoryDir = kollapse("~/GitHub/Packages/", PackageName, "/")
fname = 	kollapse(PackageName, ".R")
Package_FnP = 	kollapse(RepositoryDir, "R/", fname)

BackupDir = "~/GitHub/Packages/DataInCode/Development/"
dir.create(BackupDir)

# devtools::use_package("vioplot")
DESCRIPTION <- list("Title" = "DataInCode to store data structures in your R code"
    , "Author" = person(given = "Abel", family = "Vertesy", email = "abel.vertesy@imba.oeaw.ac.at", role =  c("aut", "cre") )
    , "Authors@R" = 'person(given = "Abel", family = "Vertesy", email = "a.vertesy@imba.oeaw.ac.at", role =  c("aut", "cre") )'
    , "Description" = "DataInCode is a set of R functions that allows you to
    store (smaller) data objects in your R code - make your script fully
    reproducible yet easily sharable. Think of it as an extended version of
    dput(), where you can parse data objects into the code that generates them.
    DataInCode also contains a set of clipboard interaction functions."
    , "License" = "GPL-3 + file LICENSE"
    , "Version" = "0.1.5"
    , "Packaged" =  Sys.time()
    , "Repository" =  "CRAN"
    , "Imports" = "StringParser, utils"
    # , "Suggests" = ""
    , "BugReports"= "https://github.com/vertesy/DataInCode/issues"
)


setwd(RepositoryDir)
if ( !dir.exists(RepositoryDir) ) { create(path = RepositoryDir, description = DESCRIPTION, rstudio = TRUE)
} else {
    getwd()
    try(file.remove(c("DESCRIPTION","NAMESPACE", "DataInCode.Rproj")))
    create_package(path = RepositoryDir, fields = DESCRIPTION, open = F)
}


# go and write fun's ------------------------------------------------------------------------
# file.edit(Package_FnP)

# Create Roxygen Skeletons ------------------------
# RoxygenReady(Package_FnP)

# replace output files ------------------------------------------------
BackupOldFile = 	kollapse(BackupDir, "Development", ".bac", print = FALSE)
AnnotatedFile = 	kollapse(BackupDir, "Development", ".annot.R", print = FALSE)
file.copy(from = Package_FnP, to = BackupOldFile, overwrite = TRUE)
# file.copy(from = AnnotatedFile, to = Package_FnP, overwrite = TRUE)

# Manual editing of descriptors ------------------------------------------------
# file.edit(Package_FnP)

# Compile a package ------------------------------------------------
setwd(RepositoryDir)
getwd()
document()


# Install your package ------------------------------------------------
# # setwd(RepositoryDir)
install(RepositoryDir)
# require("DataInCode")
# # remove.packages("DataInCode")
# # Test your package ------------------------------------------------
# help("wplot")
# cat("\014")
# devtools::run_examples()


# Test if you can install from github ------------------------------------------------
# devtools::install_github(repo = "vertesy/DataInCode")

# require("DataInCode")

# Clean up if not needed anymore ------------------------------------------------
# View(installed.packages())
# remove.packages("DataInCode")

check(RepositoryDir, cran = TRUE)
# as.package(RepositoryDir)
#
#
# # source("https://install-github.me/r-lib/desc")
# # library(desc)
# # desc$set("DataInCode", "foo")
# # desc$get(DataInCode)
#
#
# system("cd ~/GitHub/DataInCode/; ls -a; open .Rbuildignore")
#
