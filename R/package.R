#' @importFrom utils capture.output browseURL
#' @importFrom sparklyr spark_dependency register_extension invoke_static invoke spark_connection spark_dataframe sdf_register spark_context
#' @importFrom h2o h2o.getFrame h2o.getId h2o.init
NULL

# define required spark packages
spark_dependencies <- function(spark_version, scala_version, ...) {
  sw_version <- getOption("rsparkling.sparklingwater.version", default = NULL)
  sw_location <- getOption("rsparkling.sparklingwater.location", default = NULL)
  
  if(is.null(sw_version) && is.null(sw_location)){
    stop("
    ---------------------------------------------------------------------------------------------------------------------------------------------
    Sparkling Water version is missing and a custom path to a Sparkling Water jar is not set. 
    Please choose a correct version using options, for example: options(rsparkling.sparklingwater.version = '1.6.7')
    or provide a path to a custom Sparkling Water jar, for example: options(rsparkling.sparklingwater.location = 'path/to/sw.jar'
    ---------------------------------------------------------------------------------------------------------------------------------------------")
  }
  
  if((!is.null(sw_location) && (!is.null(sw_version)) || !is.null(sw_location))){
    spark_dependency(
      jars = c(sw_location)
    )
  }else{
    if(as.package_version(spark_version)$major != as.package_version(sw_version)$major){
      stop(cat(paste0("Major version of Sparkling Water does not correspond to major Spark version.
                      \nMajor Sparkling Water Version = ",as.package_version(sw_version)$major,
                      "\nMajor Spark Version = ",as.package_version(spark_version)$major)))
    }
    if(as.package_version(spark_version)$minor != as.package_version(sw_version)$minor){
      stop(cat(paste0("Minor version of Sparkling Water does not correspond to minor Spark version.
                      \nMinor Sparkling Water Version = ",as.package_version(sw_version)$minor,
                      "\nMinor Spark Version = ",as.package_version(spark_version)$minor)))
    }
    
    spark_dependency(packages = c(
      sprintf("ai.h2o:sparkling-water-core_%s:%s", scala_version, sw_version),
      sprintf("ai.h2o:sparkling-water-ml_%s:%s", scala_version, sw_version),
      sprintf("ai.h2o:sparkling-water-repl_%s:%s", scala_version, sw_version)
    ))
  }
}


.onLoad <- function(libname, pkgname) {
  register_extension(pkgname)
}

