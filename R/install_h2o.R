#' Provide integration information for rsparkling
#'
#' @return Returns a data frame containing rsparkling integration information
#' @export
h2o_release_table <- function(){
  
  #SW 1.6 release info
  sparkling_water_1.6 <- paste0("1.6.", as.character(seq(1, 13, 1)))
  h2o_version_1.6 <- c("3.8.1.3","3.8.1.3","3.8.2.3","3.8.2.4","3.8.2.6","3.10.0.4","3.10.0.6","3.10.0.7","3.10.4.3",
                       "3.10.4.5","3.10.4.8","3.10.5.2","3.14.0.2")
  h2o_release_name_1.6 <- c("rel-turan","rel-turan","rel-turchin","rel-turchin","rel-turchin","rel-turing","rel-turing",
                            "rel-turing","rel-ueno","rel-ueno","rel-ueno","rel-vajda", "rel-weierstrass")
  h2o_patch_1.6 <- sub('.*\\.', '', h2o_version_1.6)
  
  #---------------------------------------------------------------------------------------------------------------------
  #SW 2.0 release info
  sparkling_water_2.0 <- paste0("2.0.", as.character(seq(0, 24, 1)))
  h2o_version_2.0 <- c("3.10.0.7","3.10.0.10","3.10.0.10","3.10.1.2", "3.10.3.2","3.10.3.2","3.10.4.2","3.10.4.3","3.10.4.5",
                       "3.10.4.8", "3.10.5.1","3.10.5.2", "3.10.5.4","3.10.5.4","3.10.5.4","3.14.0.2","3.14.0.6", "3.14.0.7", 
                       "3.16.0.1","3.16.0.2","3.16.0.2","3.16.0.2","3.16.0.4", "3.18.0.1", "3.18.0.2")
  h2o_release_name_2.0 <- c("rel-turing","rel-turing","rel-turing","rel-turnbull","rel-tverberg","rel-tverberg","rel-ueno","rel-ueno",
                            "rel-ueno","rel-ueno","rel-vajda","rel-vajda","rel-vajda","rel-vajda","rel-vajda", "rel-weierstrass",
                            "rel-weierstrass","rel-weierstrass","rel-wheeler","rel-wheeler","rel-wheeler","rel-wheeler",
                            "rel-wheeler", "rel-wolpert", "rel-wolpert")
  h2o_patch_2.0 <- sub('.*\\.', '', h2o_version_2.0)
  
  #---------------------------------------------------------------------------------------------------------------------
  #SW 2.1 release info
  sparkling_water_2.1 <- paste0("2.1.", as.character(seq(0, 23, 1)))
  h2o_version_2.1 <- c("3.10.3.2","3.10.4.2","3.10.4.2","3.10.4.3","3.10.4.5","3.10.4.6","3.10.4.7","3.10.4.7","3.10.4.8",
                       "3.10.5.1", "3.10.5.2", "3.10.5.3", "3.10.5.4", "3.10.5.4", "3.14.0.2","3.14.0.6", "3.14.0.7", 
                       "3.16.0.1","3.16.0.2","3.16.0.2","3.16.0.2","3.16.0.4", "3.18.0.1", "3.18.0.2")
  h2o_release_name_2.1 <- c("rel-tverberg","rel-ueno", "rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-ueno","rel-ueno",
                            "rel-ueno","rel-vajda","rel-vajda","rel-vajda","rel-vajda","rel-vajda","rel-weierstrass"
                            ,"rel-weierstrass","rel-weierstrass","rel-wheeler","rel-wheeler","rel-wheeler","rel-wheeler",
                            "rel-wheeler", "rel-wolpert", "rel-wolpert")
  h2o_patch_2.1 <- sub('.*\\.', '', h2o_version_2.1)
  
  #---------------------------------------------------------------------------------------------------------------------
  #SW 2.2 release info
  sparkling_water_2.2 <- paste0("2.2.", as.character(seq(0, 9, 1)))
  h2o_version_2.2 <- c("3.14.0.2", "3.14.0.6", "3.14.0.7", "3.16.0.1","3.16.0.2","3.16.0.2","3.16.0.2","3.16.0.4", 
                       "3.18.0.1", "3.18.0.2")
  h2o_release_name.2.2 <- c("rel-weierstrass","rel-weierstrass","rel-weierstrass","rel-wheeler","rel-wheeler",
                            "rel-wheeler","rel-wheeler","rel-wheeler", "rel-wolpert", "rel-wolpert")
  h2o_patch_2.2 <- sub('.*\\.', '', h2o_version_2.2)
  
  #---------------------------------------------------------------------------------------------------------------------
  #Spark 2.2 release table
  release_spark_2_2 <- data.frame(Spark_Version = c("2.2"), 
                                  Sparkling_Water_Version = rev(sparkling_water_2.2),
                                  H2O_Version = rev(h2o_version_2.2),
                                  H2O_Release_Name = rev(h2o_release_name.2.2),
                                  H2O_Release_Patch_Number = rev(h2o_patch_2.2))
  
  #---------------------------------------------------------------------------------------------------------------------
  #Spark 2.1 release table
  release_spark_2_1 <- data.frame(Spark_Version = c("2.1"), 
                                Sparkling_Water_Version = rev(sparkling_water_2.1),
                                H2O_Version = rev(h2o_version_2.1),
                                H2O_Release_Name = rev(h2o_release_name_2.1),
                                H2O_Release_Patch_Number = rev(h2o_patch_2.1))
  #---------------------------------------------------------------------------------------------------------------------
  #Spark 2.0 release table
  release_spark_2 <- data.frame(Spark_Version = c("2.0"), 
                              Sparkling_Water_Version = rev(sparkling_water_2.0),
                              H2O_Version = rev(h2o_version_2.0),
                              H2O_Release_Name = rev(h2o_release_name_2.0),
                              H2O_Release_Patch_Number = rev(h2o_patch_2.0))
  #---------------------------------------------------------------------------------------------------------------------
  #Spark 1.6 release table
  release_spark_1_6 <- data.frame(Spark_Version = c("1.6"), 
                                Sparkling_Water_Version = rev(sparkling_water_1.6),
                                H2O_Version = rev(h2o_version_1.6),
                                H2O_Release_Name = rev(h2o_release_name_1.6),
                                H2O_Release_Patch_Number = rev(h2o_patch_1.6))
  #---------------------------------------------------------------------------------------------------------------------
  
  #Bind all tables together
  return(rbind(release_spark_2_2,release_spark_2_1,release_spark_2,release_spark_1_6))
}