#' Provide integration information for rsparkling
#'
#' @return Returns a data frame containing rsparkling integration information
#' @export
h2o_release_table <- function(){
  
  #Spark 2.1
  release_spark_2_1 <- data.frame(Spark_Version = c("2.1"), 
                                Sparkling_Water_Version = rev(c("2.1.0","2.1.1","2.1.2","2.1.3","2.1.4","2.1.5","2.1.6","2.1.7","2.1.8","2.1.9")),
                                H2O_Version = rev(c("3.10.3.2","3.10.4.2","3.10.4.2","3.10.4.3","3.10.4.5","3.10.4.6","3.10.4.7","3.10.4.7","3.10.4.8","3.10.5.1")),
                                H2O_Release_Name = rev(c("rel-tverberg","rel-ueno", "rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-vajda")),
                                H2O_Release_Patch_Number = rev(c("2","2","2","3","5","6","7","7","8","1")))
  #Spark 2.0
  release_spark_2 <- data.frame(Spark_Version = c("2.0"), 
                              Sparkling_Water_Version = rev(c("2.0.0","2.0.1","2.0.2","2.0.3", "2.0.4","2.0.5","2.0.6","2.0.7","2.0.8","2.0.9","2.0.10")),
                              H2O_Version = rev(c("3.10.0.7","3.10.0.10","3.10.0.10","3.10.1.2", "3.10.3.2","3.10.3.2","3.10.4.2","3.10.4.3","3.10.4.5","3.10.4.8","3.10.5.1")),
                              H2O_Release_Name = rev(c("rel-turing","rel-turing","rel-turing","rel-turnbull","rel-tverberg","rel-tverberg","rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-vajda")),
                              H2O_Release_Patch_Number = rev(c("7","10","10","2","2","2","2","3","5","8","1")))
  #Spark 1.6
  release_spark_1_6 <- data.frame(Spark_Version = c("1.6"), 
                                Sparkling_Water_Version = rev(c("1.6.1","1.6.2","1.6.3","1.6.4","1.6.5","1.6.6","1.6.7","1.6.8","1.6.9","1.6.10","1.6.11")),
                                H2O_Version = rev(c("3.8.1.3","3.8.1.3","3.8.2.3","3.8.2.4","3.8.2.6","3.10.0.4","3.10.0.6","3.10.0.7","3.10.4.3","3.10.4.5","3.10.4.8")),
                                H2O_Release_Name = rev(c("rel-turan","rel-turan","rel-turchin","rel-turchin","rel-turchin","rel-turing","rel-turing","rel-turing","rel-ueno","rel-ueno","rel-ueno")),
                                H2O_Release_Patch_Number = rev(c("3","3","3","4","6","4","6","7","3","5","8")))
  return(rbind(release_spark_2_1,release_spark_2,release_spark_1_6))
}