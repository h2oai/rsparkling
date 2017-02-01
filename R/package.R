#' @importFrom utils capture.output browseURL
#' @importFrom sparklyr spark_dependency register_extension invoke_static invoke spark_connection spark_dataframe sdf_register spark_context
#' @importFrom h2o h2o.getFrame h2o.getId h2o.init
#' @importFrom utils read.table
NULL

# Define required spark packages
spark_dependencies <- function(spark_version, scala_version, ...) {
  
  #Check if sw_version/sw_location is provided
  sw_version <- getOption("rsparkling.sparklingwater.version", default = NULL)
  sw_location <- getOption("rsparkling.sparklingwater.location", default = NULL)
  
  #If sw_version & sw_location are not provided, then check the Spark installation
  #If its Spark 2.0.*, then we fetch the latest Sparkling Water for Spark 2.0.*
  #If its Spark 1.6.*, then we fetch the latest Sparkling Water for Spark 1.6.*
  #If none of the above, then throw an exception
  #Also provide adequate version of H2O for latest Sparkling Water
  if(is.null(sw_version) && is.null(sw_location)){
    if(as.package_version(spark_version)$major == "2"){
      #Get latest Sparkling Water release for Spark 2.0.*
      latest = read.table("http://s3.amazonaws.com/h2o-release/sparkling-water/rel-2.0/latest")
      sw_version = sprintf("2.0.%s",latest)
      message(sprintf("Spark version %s detected. Will call latest Sparkling Water version %s",spark_version,sw_version))
      message('\nEnsure H2O version 3.10.1.2 is installed. To install simply call install_h2o(release_name = "rel-turnbull",release_number = "2")')
    }else if(as.package_version(spark_version)$major == "1" && as.package_version(spark_version)$minor == "6" ){ #Assuming Spark 1.6
      #Get latest Sparkling Water release for Spark 1.6.*
      latest = read.table("http://s3.amazonaws.com/h2o-release/sparkling-water/rel-1.6/latest")
      sw_version = sprintf("1.6.%s",latest) 
      message(sprintf("Spark version %s detected. Will call latest Sparkling Water version %s",spark_version,sw_version))
      message('\nEnsure H2O version 3.10.0.7 is installed. To install simply call install_h2o(release_name = "rel-turing",release_number = "7")')
    }else{
      stop("Spark installation 1.6.* or 2.0.* are not detected. Please install Spark 2.0.* or 1.6.*")
    }
  }
  
  #Is a path to a Sparkling Water jar provided?
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

