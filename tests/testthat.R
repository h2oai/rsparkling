library(testthat)
library(dplyr)
library(sparklyr)
library(h2o)
library(rsparkling)


options(rsparkling.sparklingwater.version = Sys.getenv("SPARKLINGWATER_VERSION","2.0.5"))

sw_version <- getOption("rsparkling.sparklingwater.version", default = NULL)
if(as.package_version(sw_version)$major == "2" && as.package_version(sw_version)$minor == "2"){
  options(rsparkling.spark.version =  "2.2.0") #Use latest Spark 2.1.*
}else if(as.package_version(sw_version)$major == "2" && as.package_version(sw_version)$minor == "1"){
  options(rsparkling.spark.version =  "2.1.0") #Use latest Spark 2.1.*
}else if(as.package_version(sw_version)$major == "2"){
  options(rsparkling.spark.version =  "2.0.2") #Use latest Spark 2.0.*
}else{
  options(rsparkling.spark.version =  "1.6.2") #Use latest Spark 1.6.*
}

if(identical(Sys.getenv("NOT_CRAN"), "true")) { # testthat::skip_on_cran
  cat(sprintf("Starting tests with Sparkling Water version: %s & Spark version: %s \n",Sys.getenv("SPARKLINGWATER_VERSION"),getOption("rsparkling.spark.version")))
  test_check("rsparkling")
}else{
  cat("Skipping Tests\n")
}
