com<-t(data.frame(read.csv("table_even9800.txt",sep="\t",row.names=1))[,-46])
str(com)
com[1:10,1:10]
trt<-read.delim("FastMap.txt",row.names=1)
trt$species
trt$surfaceORcave
trt$spXhab<-factor(paste(trt$species,trt$surfaceORcave,sep="-"))
trt$spXhab
com.trt<-matrix(nrow=6,ncol=ncol(com))
for (i in 1:ncol(com)){
  com.trt[,i]<-tapply(com[,i],trt$spXhab,mean)
}
rownames(com.trt)<-levels(trt$spXhab)
colnames(com.trt)<-colnames(com)
com.trt[,1:10]
rownames(com.trt)

OTU.cav<-colnames(com)[com.trt[1,]!=0 | com.trt[3,]!=0 | com.trt[5,]!=0] # 8523
OTU.cav.foo<-colnames(com)[com.trt[1,]!=0 & com.trt[5,]!=0 | com.trt[3,]!=0 & com.trt[5,]!=0] # 2293
OTU.cav.foo.ove<-colnames(com)[com.trt[1,]!=0 & com.trt[3,]!=0 & com.trt[5,]!=0] # 910

OTU.cav.ear<-colnames(com)[com.trt[1,]!=0 & com.trt[5,]==0 | com.trt[3,]!=0 & com.trt[5,]==0] # 1993

OTU.cav.soi<-colnames(com)[com.trt[1,]==0 & com.trt[3,]==0 & com.trt[5,]!=0] # 4237
OTU.cav.eAC<-colnames(com)[com.trt[1,]!=0 & com.trt[3,]==0 & com.trt[5,]==0] # 778
OTU.cav.eAR<-colnames(com)[com.trt[1,]==0 & com.trt[3,]!=0 & com.trt[5,]==0] # 873

table(com.trt[1,]!=0 & com.trt[3,]!=0 & com.trt[5,]==0) # 342
table(com.trt[1,]!=0 & com.trt[3,]==0 & com.trt[5,]!=0) # 994
table(com.trt[1,]==0 & com.trt[3,]!=0 & com.trt[5,]!=0) # 389


OTU.sur<-colnames(com)[com.trt[2,]!=0 | com.trt[4,]!=0 | com.trt[6,]!=0] # 8040
OTU.sur.foo<-colnames(com)[com.trt[2,]!=0 & com.trt[6,]!=0 | com.trt[4,]!=0 & com.trt[6,]!=0] # 2381
OTU.sur.foo.ove<-colnames(com)[com.trt[2,]!=0 & com.trt[4,]!=0 & com.trt[6,]!=0] # 821

OTU.sur.ear<-colnames(com)[com.trt[2,]!=0 & com.trt[6,]==0 | com.trt[4,]!=0 & com.trt[6,]==0] # 1099

OTU.sur.soi<-colnames(com)[com.trt[2,]==0 & com.trt[4,]==0 & com.trt[6,]!=0] # 4560
OTU.sur.eAC<-colnames(com)[com.trt[2,]!=0 & com.trt[4,]==0 & com.trt[6,]==0] # 227
OTU.sur.eAR<-colnames(com)[com.trt[2,]==0 & com.trt[4,]!=0 & com.trt[6,]==0] # 744

table(com.trt[2,]!=0 & com.trt[4,]!=0 & com.trt[6,]==0) # 78
table(com.trt[2,]!=0 & com.trt[4,]==0 & com.trt[6,]!=0) # 685
table(com.trt[2,]==0 & com.trt[4,]!=0 & com.trt[6,]!=0) # 875