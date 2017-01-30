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

install_h2o = function(release_name = "rel-tverberg", release_number = "1"){
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
