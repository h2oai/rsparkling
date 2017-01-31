#' An easy installation of the H2O R pacakage
#' 
#' @param release_name Object of type character that specifies the release name of the H2O pacakge
#' @param release_number Object of type character that specifies the release number of the H2O pacakge
#' @examples
#' \donttest{
#' #Install the latest release of H2O on 1/30/16 (relv-tverberg-1)
#' install_h2o(release_name = "rel-tverberg", release_number = "1")
#' }
#' @export

install_h2o <- function(release_name = "rel-tverberg", release_number = "1"){
  if(!is.character(release_name)){
    stop(paste0("`release_name` should be of type character but got ", class(release_name)))
  }
  if(!is.character(release_number)){
    stop(paste0("`release_number` should be of type character but got ", class(release_number)))
  }
  
  # The following two commands remove any previously installed H2O packages for R.
  if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
  if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
  
  # Next, we download packages that H2O depends on.
  if (! ("methods" %in% rownames(installed.packages()))) { install.packages("methods") }
  if (! ("statmod" %in% rownames(installed.packages()))) { install.packages("statmod") }
  if (! ("stats" %in% rownames(installed.packages()))) { install.packages("stats") }
  if (! ("graphics" %in% rownames(installed.packages()))) { install.packages("graphics") }
  if (! ("RCurl" %in% rownames(installed.packages()))) { install.packages("RCurl") }
  if (! ("jsonlite" %in% rownames(installed.packages()))) { install.packages("jsonlite") }
  if (! ("tools" %in% rownames(installed.packages()))) { install.packages("tools") }
  if (! ("utils" %in% rownames(installed.packages()))) { install.packages("utils") }
  
  # Now we download, install and initialize the H2O package for R.
  install.packages("h2o", type="source", repos=(c(sprintf("http://h2o-release.s3.amazonaws.com/h2o/%s/%s/R", release_name,release_number))))
}

#' Provide integration information for rsparkling
#'
#' @return Returns a data frame containing rsparkling integration information
#' @export
h2o_release_table <- function(){
  
  #Spark 2.0
  release_spark_2 <- data.frame(Spark_Version = c("2.0"), 
                              Sparkling_Water_Version = c("2.0.0","2.0.1","2.0.2","2.0.3"),
                              H2O_Version = c("3.10.0.7","3.10.0.10","3.10.0.10","3.10.1.2"),
                              H2O_Version_Name = c("rel-turing","rel-turing","rel-turing","rel-turnbull"),
                              H2O_Version_Number = c("7","10","10","2"))
  #Spark 1.6
  release_spark_1_6 <- data.frame(Spark_Version = c("1.6"), 
                                Sparkling_Water_Version = c("1.6.1","1.6.2","1.6.3","1.6.4","1.6.5","1.6.6","1.6.7","1.6.8"),
                                H2O_Version = c("3.8.1.3","3.8.1.3","3.8.2.3","3.8.2.4","3.8.2.6","3.10.0.4","3.10.0.6","3.10.0.7"),
                                H2O_Version_Name = c("rel-turan","rel-turan","rel-turchin","rel-turchin","rel-turchin","rel-turing","rel-turing","rel-turing"),
                                H2O_Version_Number = c("3","3","3","4","6","4","6","7"))
  return(rbind(release_spark_2,release_spark_1_6))
}