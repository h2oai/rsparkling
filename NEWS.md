**If you are viewing this file on CRAN, please check latest news on GitHub [here](https://github.com/h2oai/rsparkling/blob/master/NEWS.md).**

rsparkling 0.2.2 (2017-09-18)
-----------------
* Add support for Spark 2.2.* and Sparkling Water 2.2.*
* Added example of using Sparkling Water w/ YARN [here](https://github.com/h2oai/rsparkling/blob/master/inst/examples/using-sparkling-water-in-YARN.Rmd)
* Notes:
	* Added latest `rsparkling` integration information [here](https://github.com/h2oai/rsparkling#install-h2o)
	* Updates to `rsparkling`[README](https://github.com/h2oai/rsparkling/blob/master/README.md)

rsparkling 0.2.1 (2017-06-30)
-----------------
* Patch fix: 
	* Add duke dependency(`no.priv.garshol.duke:duke:1.2`) to `spark_dependency()` in `package.R`, which will 	  help loading the latest H2O (>= 3.10.5.2).
* Notes:
	* Update to [nycflights13.R example](https://github.com/h2oai/rsparkling/blob/master/inst/examples/nycflights13.R)
	* Added latest `rsparkling` integration information [here](https://github.com/h2oai/rsparkling#install-h2o)
	* Updates to `rsparkling`[README](https://github.com/h2oai/rsparkling/blob/master/README.md)
	
rsparkling 0.2.0 (2017-03-15)
-----------------
* New Features: 
	1. `options(rsparkling.sparklingwater.location)`
		* This feature allows a user to point to a specific Sparkling Water jar before doing a library call 		  to rsparkling. Basic usage is as follows: 
			
			``` r
			options(rsparkling.sparklingwater.location = "path/to/sparkling_water.jar")
			library(rsparkling) 
			#`spark_connect` will use the local Sparkling Water jar from the above `options()` call. 
			sc <- spark_connect(master = "local", version = "2.0.0") 
			```	
	2. `h2o_release_table()`
		* This new function will display an integration table in your R console as a data.frame. Example 		  output is below: 
		
			``` r
			> library(rsparkling)
			> h2o_release_table()
			   Spark_Version Sparkling_Water_Version H2O_Version H2O_Release_Name
			1            2.1                   2.1.0    3.10.3.2     rel-tverberg
			2            2.0                   2.0.5    3.10.3.2     rel-tverberg
			3            2.0                   2.0.4    3.10.3.2     rel-tverberg
			4            2.0                   2.0.3    3.10.1.2     rel-turnbull
			5            2.0                   2.0.2   3.10.0.10       rel-turing
			6            2.0                   2.0.1   3.10.0.10       rel-turing
			7            2.0                   2.0.0    3.10.0.7       rel-turing
			8            1.6                   1.6.8    3.10.0.7       rel-turing
			9            1.6                   1.6.7    3.10.0.6       rel-turing
			10           1.6                   1.6.6    3.10.0.4       rel-turing
			11           1.6                   1.6.5     3.8.2.6      rel-turchin
			12           1.6                   1.6.4     3.8.2.4      rel-turchin
			13           1.6                   1.6.3     3.8.2.3      rel-turchin
			14           1.6                   1.6.2     3.8.1.3        rel-turan
			15           1.6                   1.6.1     3.8.1.3        rel-turan
			   H2O_Release_Patch_Number
			1                         2
			2                         2
			3                         2
			4                         2
			5                        10
			6                        10
			7                         7
			8                         7
			9                         6
			10                        4
			11                        6
			12                        4
			13                        3
			14                        3
			15                        3
			```
* Notes:
	1. Support for Sparkling Water 2.1.0 has been added to `rsparkling`.
	2. `rsparkling` will automatically decipher a Sparkling Water version based on Spark's major version 		if the user does not provide a specific version of Sparkling Water and a path to a Sparkling Water 		jar. The logic goes as follows: 
	   
	   * If Spark 2.1.* is detected, then `rsparkling` will fetch the latest Sparkling Water for Spark 2.1.*
	   * If Spark 2.0.* is detected, then `rsparkling` will fetch the latest Sparkling Water for Spark 2.0.*
	   * If Spark 1.6.* is detected, then `rsparkling` will fetch the latest Sparkling Water for Spark 1.6.*
			* If the wrong version of H2O is detected for one of the previous versions of Sparkling Water, 			  then the error message will provide a solution to install the correct version. 
	3. Install instructions for `rsparkling` have been refactored and are much more complete at this point 	   (refer to [`README.md`](https://github.com/h2oai/rsparkling/blob/master/README.md)).
	4. Instructions about dealing with firewalls/lack of internet have been added for [`Spark`](https://github.com/h2oai/rsparkling/blob/master/README.md#note-the-previous-command-requires-access-to-the-internet) and [`Sparkling Water`](https://github.com/h2oai/rsparkling/blob/master/README.md#note-the-previous-command-requires-access-to-the-internet-1).  
	5. A [wiki](https://github.com/h2oai/rsparkling/wiki/RSparkling-on-Windows) dealing with common problems on Windows OS has been added to the rsparkling repo on Github.


rsparkling 0.1.1 (2017-02-23)
-----------------
* Patch fix: Set `startH2O` to FALSE in `h2o.init()` command to ensure R only starts H2O if no other H2O instance is detected. This is mainly useful if a user is in a cluster environment(Hadoop,EMR,etc.).

rsparkling 0.1.0 (2017-01-24)
-----------------
* Initial release. 
