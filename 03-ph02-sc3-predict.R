rm(list=ls())
load('./data/ph02.sc3.data.RData')
load('../pFDA-BCC-PH01/data/MODEL-DATA-PH01/sc3.mod.data.RData')
ph02.tt.x <- ph02.sc3.data$feature[,colnames(sc3.mod.data$tr.x)]
rownames(ph02.tt.x) <- ph02.sc3.data$phenotype$PATIENTID
library(e1071)
load('../pFDA-BCC-PH01/model/ph01.sc3.SVM.mods.RData')

ph01.sc3.best.model <- ph01.sc3.SVM.mods$CV1$model$radial
# TRAINING
# CV 1: 
# ACC = 0.9259259
# SPEC = 1.0000000
# SEN = 0.6666667
pred.val <- predict(
  ph01.sc3.best.model,
  ph02.tt.x)
pred.sc3.out <- data.frame(
  'PATIENTID' = names(pred.val),
  'SURVIVAL_STATUS' = as.character(pred.val),
  stringsAsFactors = FALSE
)
write.table(
  pred.sc3.out,
  './submission/subchallenge_3.tsv',
  sep = '\t',
  row.names = FALSE,
  quote = FALSE
)
