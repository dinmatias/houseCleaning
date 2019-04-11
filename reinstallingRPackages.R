##### RUN THIS USING THE OLD R (i.e., prior to installing the new R)

# define a filename where to write the info
# of packages installed in the present R version
pathTemp <- "D:/oldPackages.table"

# get the info of installed packages
oldPackages <- data.frame(installed.packages(),
                            stringsAsFactors = FALSE)

# write the file
write.table(oldPackages, pathTemp, sep = "\t",
            col.names = TRUE, row.names = FALSE)


#### RUN THIS AFTER INSTALLING THE OLD R
#### NOTE: THIS MIGHT TAKE SOME TIME ESPECIALLY
####        IF THERE ARE LIKE 400 PACKAGES INSTALLED

# the table file saved from the above lines
pathTemp <- "D:/oldPackages.table"

# check the packages that comes with the base R
baseIstalled <- data.frame(installed.packages(), stringsAsFactors = FALSE)

# load the old package list
oldPackages <- read.table("D:/oldPackages.table", sep = "\t", header = TRUE,
                          stringsAsFactors = FALSE)

# just remove the old ones
installList <- oldPackages$Package[!(oldPackages$Package %in% baseIstalled$Package)]

# install the packages previously installed and not in the base
# NOTE: packages installed directly from GIT (not availabile from CRAN
# or MRAN will not be insalled and needs to be installed using git installer
# from devtools)
lapply(installList, function(x){
  
  install.packages(x)
  
  message(paste(x, "installed"))
  
  return(NULL)
  
  })

