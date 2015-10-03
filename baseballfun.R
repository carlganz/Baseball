library(Lahman)
library(dplyr)
library("magrittr")
pitching<-tbl_df(Pitching)

master<-tbl_df(Master)

teams<-tbl_df(Teams)

master<-select(master,playerID,throws)

pitching<-filter(pitching,yearID>1945)

teams<-filter(teams,yearID>1945)

pitching<-merge(pitching,master,by="playerID")

pitchingby<-group_by(pitching,yearID,teamID)

summarise(pitchingby,sum(IPouts),sum(SO))

leftyip<-pitchingby %>% filter(throws=="L") %>% summarise(leftyips=sum(IPouts))

teams<-merge(teams,leftyip,by=c("yearID","teamID"))
                              