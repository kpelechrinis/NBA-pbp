library(rjson)
library(stringr)

n.games = 40 # Here you can set the number of games you want to download. This will download the first 40 games of the season

for (i in 1:n.games){
	pbpURL = paste0("http://data.nba.com/data/v2015/json/mobile_teams/nba/2017/scores/pbp/002170",str_pad(as.character(i),4,pad="0"),"_full_pbp.json")
	pbpData <- fromJSON(file = pbpURL, method="C")
	pbpDataf <- data.frame(matrix(unlist(pbpData$g$pd[[1]]$pla), ncol=16, byrow = TRUE))
	colnames(pbpDataf) <- c("evt","cl","de","locX","locY","opt1","opt2","mtype","etype","opid","tid","pid","hs","vs","epid","oftid")
	write.csv(pbpDataf,file=paste0(i,".csv"))
} 
