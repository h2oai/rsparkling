library(testthat)
library(dplyr)
library(sparklyr)
library(h2o)
library(rsparkling)

if(identical(Sys.getenv("NOT_CRAN"), "true")) { # testthat::skip_on_cran
  if(Sys.getenv("SPARKLINGWATER_VERSION", "none") == "none"){
    warning("SPARKLING WATER VERSION NOT SET\n")
    cat("Skipping Tests\n")
  } else {
    sw_version <- Sys.getenv("SPARKLINGWATER_VERSION")
    sw_major_version = as.package_version(sw_version)$major
    sw_minor_version = as.package_version(sw_version)$minor
    spark_major_minor <- sprintf("%s.%s", sw_major_version, sw_minor_version)
    
    # Set Sparkling Water version for tests
    options(rsparkling.sparklingwater.version = sw_version)
    # Set Spark version for tests
    options(rsparkling.spark.version = sprintf("%s.0", spark_major_minor))
    
    cat(sprintf("Starting tests with Sparkling Water version: %s & Spark version: %s \n", sw_version, getOption("rsparkling.spark.version")))
    test_check("rsparkling")
  }
} else {
  cat("Skipping Tests\n")
}
