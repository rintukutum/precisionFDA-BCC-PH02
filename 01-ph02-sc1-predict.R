rm(list=ls())
load('./data/ph02.sc1.data.RData')
load('../pFDA-BCC-PH01/data/MODEL-DATA-PH01/sc1.mod.data.RData')
ph02.tt.x <- ph02.sc1.data$feature[,colnames(sc1.mod.data$tr.x)]
rownames(ph02.tt.x) <- ph02.sc1.data$phenotype$PATIENTID
library(e1071)
load('../pFDA-BCC-PH01/model/ph01.sc1.SVM.mods.RData')
ph01.sc1.best.model <- ph01.sc1.SVM.mods$CV2$model$radial
# TRAINING
# CV 2: 
# ACC = 0.9000000
# SPEC = 1.0000000
# SEN = 0.250
pred.val <- predict(ph01.sc1.best.model,
        ph02.tt.x)
pred.sc1.out <- data.frame(
  'PATIENTID' = names(pred.val),
  'SURVIVAL_STATUS' = as.character(pred.val),
  stringsAsFactors = FALSE
)

write.table(
  pred.sc1.out,
  './submission/subchallenge_1.tsv',
  sep = '\t',
  row.names = FALSE,
  quote = FALSE
)
