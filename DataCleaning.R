library(rJava)
library(xlsx)
library(tidyr)
library(dplyr)
library(plyr)
library(stringr)

#Functions and constants

zip_msa_original<-read.table("ZipMSA_WashingtonState.csv",header = TRUE,sep=",",colClasses='character',stringsAsFactors=FALSE)
employ_original<-read.xlsx("2017 OES Databook File.xlsx", 
                           sheetName="Raw Data",colClasses='character',stringsAsFactors=FALSE)

zip_msa_data<-data.frame("ZIP.code"=zip_msa_original$zcta5,"ZIP.name"=zip_msa_original$zipname,"COUNTY"=zip_msa_original$cntyname2,
                     "CBSA.code"=zip_msa_original$cbsa,"CBSA.name"=zip_msa_original$cbsaname,
                     "MSA.code"=zip_msa_original$metrodiv,"MSA.name"=zip_msa_original$mdivname,
                     stringsAsFactors=FALSE)

employ_data<-data.frame("MSA.code"=employ_original$Area,"MSA.name"=employ_original$Area.name,"SOC.code"=employ_original$SOC.code,
                         "SOC.title"=employ_original$SOC.title,"EST.employment"=employ_original$Est..empl.,
                         "ANNUAL.wage"=employ_original$Annual.wage,
                         stringsAsFactors=FALSE)

zip_msa_data$ZCTA5<-gsub(" ", "",zip_msa_data$ZCTA5)
zip_msa_data$CBSA<-gsub(" ", "",zip_msa_data$CBSA)
zip_msa_data$MSA<-gsub(" ", "",zip_msa_data$MSA)
zip_msa_data$CBSA<-gsub("(^|[^0-9])0+", "\\1",zip_msa_data$CBSA, perl = TRUE)
zip_msa_data$MSA<-gsub("(^|[^0-9])0+", "\\1",zip_msa_data$MSA, perl = TRUE)

for(i in 1:nrow(zip_msa_data)){
  if(zip_msa_data[i,"CBSA"]==""){
    
    zip_msa_data[i,"CBSA"] <- NA
    
  }
  if(zip_msa_data[i,"MSA"]==""){
    zip_msa_data[i,"MSA"]<- zip_msa_data[i,"CBSA"]
  }
}
write.csv(zip_msa_data, file = "ZIP_MSA_WA.csv",row.names=FALSE)

employ_data$MSA.code<-gsub(" ", "",employ_data$MSA.code)
employ_data$SOC.code<-gsub(" ", "",employ_data$SOC.code)
employ_data$MSA.code<-gsub("(^|[^0-9])0+", "\\1",employ_data$MSA.code, perl = TRUE)
employ_data$SOC.code<-gsub("(^|[^0-9])0+", "\\1",employ_data$SOC.code, perl = TRUE)
employ_data<-employ_data[!is.na(employ_data$MSA.code),]
employ_data<-employ_data[!is.na(employ_data$SOC.code),]

write.csv(employ_data, file = "EMPLOYMENT_WA.csv",row.names=FALSE)
