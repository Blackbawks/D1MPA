setwd('data/')

X <- read.csv('adpecounts.csv')
names(X)[3] <- 'ccamlr.region'
X <- X[X$ccamlr.region=='48.1',]

write.csv(X,'adpecounts_481.csv',row.names=F)


X <- read.csv('chpecounts.csv')
names(X)[3] <- 'ccamlr.region'
X <- X[X$ccamlr.region=='48.1',]

write.csv(X,'chpecounts_481.csv',row.names=F)


X <- read.csv('empecounts.csv')
names(X)[3] <- 'ccamlr.region'
X <- X[X$ccamlr.region=='48.1',]

write.csv(X,'empecounts_481.csv',row.names=F)


X <- read.csv('gepecounts.csv')
names(X)[3] <- 'ccamlr.region'
X <- X[X$ccamlr.region=='48.1',]

write.csv(X,'gepecounts_481.csv',row.names=F)
