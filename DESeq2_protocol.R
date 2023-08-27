install.packages("htmltools")
library(htmltools)
source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")
library(DESeq2)
library(ggplot2)

countData <- read.csv('airway_scaledcounts.csv', header = TRUE, sep = ",")
head(countData)

metaData <- read.csv('airway_metadata.csv', header = TRUE, sep = ",")
metaData

dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~dex, tidy = TRUE)

# count data와 metadata가 모두 필요함
## count data format
View(countData)
## 1열 앙상블 id
  ## 2열 이후 count data

## meta data format
View(metaData)
# id, dex, celltype, geo_id
# id - count data의 열 이름을 지정한다.
# dex; design으로써 처리할 데이터 이용. DESeqDataSetFromMatrix 사용할 때 design 으로써 처리할 열을 지정하여 이용하면 된다.
# celltype
# geo_id --> geo_id

dds
View(dds)
