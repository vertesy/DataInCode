# Configuration for the Package
DESCRIPTION <- list(
  package.name = "",
  version = "",
  title = ,
  description = ,

  depends = "",
  imports = "",
  suggests = "",

  author.given = "Abel",
  author.family = "Vertesy",
  author.email = "av@imba.oeaw.ac.at",
  github.user = "vertesy",
  license = "GPL-3 + file LICENSE"
)



# Setup ------------------------
package.name <-   "DataInCode"
package.version <- "2.0.2"
setwd("~/GitHub/Packages/")

RepositoryDir <- paste0("~/GitHub/Packages/", package.name, "/")
fname <-  paste0(package.name, ".R")
Package_FnP <-    paste0(RepositoryDir, "R/", fname)

BackupDir <- "~/GitHub/Packages/DataInCode/Development/"
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
    , "Version" = package.version
    , "Packaged" =  Sys.time()
    # , "Repository" =  "CRAN"
    , "Imports" = "Stringendo, utils"
    # , "Suggests" = ""
    , "BugReports"= "https://github.com/vertesy/DataInCode/issues"
)
