#' @importFrom utils capture.output browseURL
#' @importFrom sparklyr spark_dependency register_extension invoke_static invoke spark_connection spark_dataframe sdf_register spark_context
#' @importFrom h2o h2o.getFrame h2o.getId h2o.init
#' @importFrom utils read.table
#' @importFrom utils packageVersion
NULL

# Define required spark packages
spark_dependencies <- function(spark_version, scala_version, ...) {
  
  #Check if sw_version/sw_location is provided
  sw_version <- getOption("rsparkling.sparklingwater.version", default = NULL)
  sw_location <- getOption("rsparkling.sparklingwater.location", default = NULL)
  
  #If sw_version & sw_location are not provided, then check the Spark installation
  #If its Spark 2.1.*, then we fetch the latest Sparkling Water for Spark 2.1.*
  #If its Spark 2.0.*, then we fetch the latest Sparkling Water for Spark 2.0.*
  #If its Spark 1.6.*, then we fetch the latest Sparkling Water for Spark 1.6.*
  #If none of the above, then throw an exception
  #Also provide adequate version of H2O for latest Sparkling Water
  if (is.null(sw_version) && is.null(sw_location)) {
    if (as.package_version(spark_version)$major == "2" && as.package_version(spark_version)$minor == "1") {
      #Get latest Sparkling Water release for Spark 2.1.*
      latest <- read.table("http://s3.amazonaws.com/h2o-release/sparkling-water/rel-2.1/latest")
      sw_version <- sprintf("2.1.%s",latest)
      message(sprintf("Spark version %s detected. Will call latest Sparkling Water version %s",spark_version,sw_version))
      if (packageVersion("h2o") != "3.10.3.2") {
        message(paste0('\nDetected H2O version ', packageVersion("h2o"),'. Please install H2O version 3.10.3.2, which is compliant with the latest Sparkling Water version for Spark 2.1.* -> Sparkling Water version ', sw_version,'\n
To update your h2o R package, copy/paste the following commands and then restart your R session:
                       
  detach("package:rsparkling", unload = TRUE)
  if ("package:h2o" %in% search()) { detach("package:h2o", unload = TRUE) }
  if (isNamespaceLoaded("h2o")){ unloadNamespace("h2o") }
  remove.packages("h2o")
  install.packages("h2o", type = "source", repos = "http://h2o-release.s3.amazonaws.com/h2o/rel-tverberg/2/R")\n'))
      }
    }else if (as.package_version(spark_version)$major == "2") {
      #Get latest Sparkling Water release for Spark 2.0.*
      latest <- read.table("http://s3.amazonaws.com/h2o-release/sparkling-water/rel-2.0/latest")
      sw_version <- sprintf("2.0.%s",latest)
      message(sprintf("Spark version %s detected. Will call latest Sparkling Water version %s",spark_version,sw_version))
      if (packageVersion("h2o") != "3.10.3.2") {
        message(paste0('\nDetected H2O version ', packageVersion("h2o"),'. Please install H2O version 3.10.3.2, which is compliant with the latest Sparkling Water version for Spark 2.0.* ->  Sparkling Water version ', sw_version,'\n
To update your h2o R package, copy/paste the following commands and then restart your R session:

  detach("package:rsparkling", unload = TRUE)
  if ("package:h2o" %in% search()) { detach("package:h2o", unload = TRUE) }
  if (isNamespaceLoaded("h2o")){ unloadNamespace("h2o") }
  remove.packages("h2o")
  install.packages("h2o", type = "source", repos = "http://h2o-release.s3.amazonaws.com/h2o/rel-tverberg/2/R")\n'))
      }
    } else if (as.package_version(spark_version)$major == "1" && as.package_version(spark_version)$minor == "6" ) { #Assuming Spark 1.6
      #Get latest Sparkling Water release for Spark 1.6.*
      latest <- read.table("http://s3.amazonaws.com/h2o-release/sparkling-water/rel-1.6/latest")
      sw_version <- sprintf("1.6.%s",latest) 
      message(sprintf("Spark version %s detected. Will call latest Sparkling Water version %s",spark_version,sw_version))
      if (packageVersion("h2o") != "3.10.0.7"){
        message(paste0('\nDetected H2O version ', packageVersion("h2o"),'. Please install H2O version 3.10.0.7, which is compliant with the latest Sparkling Water version for Spark 1.6.* ->  Sparkling Water version ', sw_version,'\n
To update your h2o R package, copy/paste the following commands and then restart your R session:

  detach("package:rsparkling", unload = TRUE)
  if ("package:h2o" %in% search()) { detach("package:h2o", unload = TRUE) }
  if (isNamespaceLoaded("h2o")){ unloadNamespace("h2o") }
  remove.packages("h2o")
  install.packages("h2o", type = "source", repos = "http://h2o-release.s3.amazonaws.com/h2o/rel-turing/7/R")\n'))
      }
    } else {
      stop("Spark installation 1.6.*, 2.0.*, or 2.1.* are not detected. Please install Spark 1.6.*, 2.0.*, or 2.1.*")
    }
  }
  
  #Is a path to a Sparkling Water jar provided?
  if ((!is.null(sw_location) && (!is.null(sw_version)) || !is.null(sw_location))) {
    spark_dependency(
      jars = c(sw_location)
    )
  } else {
    if (as.package_version(spark_version)$major != as.package_version(sw_version)$major) {
      stop(cat(paste0("Major version of Sparkling Water does not correspond to major Spark version.
                      \nMajor Sparkling Water Version = ",as.package_version(sw_version)$major,
                      "\nMajor Spark Version = ",as.package_version(spark_version)$major)))
    }
    if (as.package_version(spark_version)$minor != as.package_version(sw_version)$minor) {
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

