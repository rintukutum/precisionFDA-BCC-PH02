rm(list=ls())
sc1.phenotype <- read.table(
  './data/sc1_Phase2_GE_Phenotype.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
sc1.FeatureMatrix <- read.table(
  './data/sc1_Phase2_GE_FeatureMatrix.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
ph02.sc1.data <- list(
  phenotype = sc1.phenotype,
  feature = sc1.FeatureMatrix
)
save(ph02.sc1.data,
     file = './data/ph02.sc1.data.RData'
)

rm(list=ls())
sc2.phenotype <- read.table(
  './data/sc2_Phase2_CN_Phenotype.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
sc2.FeatureMatrix <- read.table(
  './data/sc2_Phase2_CN_FeatureMatrix.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
ph02.sc2.data <- list(
  phenotype = sc2.phenotype,
  feature = sc2.FeatureMatrix
)
save(ph02.sc2.data,
     file= './data/ph02.sc2.data.RData')
rm(list=ls())
sc3.phenotype <- read.table(
  './data/sc3_Phase2_CN_GE_Phenotype.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
sc3.FeatureMatrix <- read.table(
  './data/sc3_Phase2_CN_GE_FeatureMatrix.tsv',
  header = TRUE,
  sep = '\t',
  stringsAsFactors = FALSE
)
ph02.sc3.data <- list(
  phenotype = sc3.phenotype,
  feature = sc3.FeatureMatrix
)
save(ph02.sc3.data, file= './data/ph02.sc3.data.RData')