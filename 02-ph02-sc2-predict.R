rm(list=ls())
load('./data/ph02.sc2.data.RData')
load('../pFDA-BCC-PH01/data/MODEL-DATA-PH01/sc2.mod.data.RData')
ph02.tt.x <- ph02.sc2.data$feature[,colnames(sc2.mod.data$tr.x)]
rownames(ph02.tt.x) <- ph02.sc2.data$phenotype$PATIENTID
library(e1071)
load('../pFDA-BCC-PH01/model/ph01.sc2.SVM.mods.RData')
ph01.sc2.best.model <- ph01.sc2.SVM.mods$CV3$model$radial
# TRAINING
# CV 3: 
# ACC = 0.7857143
# SPEC = 0.9047619
# SEN = 0.4285714
pred.val <- predict(
  ph01.sc2.best.model,
  ph02.tt.x)
pred.sc2.out <- data.frame(
  'PATIENTID' = names(pred.val),
  'SURVIVAL_STATUS' = as.character(pred.val),
  stringsAsFactors = FALSE
)
write.table(
  pred.sc2.out,
  './submission/subchallenge_2.tsv',
  sep = '\t',
  row.names = FALSE,
  quote = FALSE
)
