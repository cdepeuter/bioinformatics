
goldStandardBreastCancer  <-  c('BRCA1', 'BRCA2', 'ATM', 'BARD1', 'BRIP1', 'CASP8', 'CDH1', 'CHEK2', 'CTLA4', 'CYP19A1','FGFR2', 'H19', 'LSP1', 'MAP3K1',
                                'MRE11', 'NBN', 'PALB2', 'PTEN', 'RAD51', 'RAD51C', 'STK11', 'TERT', 'TOX3', 'TP53', 'XRCC2', 'XRCC3')
#goldStandardLungCancer <- c('ATK1', 'ALK', 'BRAF', 'DDR2', 'EGFR', 'ERBB2', 'KRAS', 'MAP2K1', 'NRAS', 'PIK3CA', 'PTEN', 'RET', 'RIT1', 'ROS1')
goldStandardProstateCancer <- c('AR', 'BRCA1', 'BRCA2', 'CD82', 'CDH1', 'CHEK2', 'EHBP1', 'ELAC2', 'EP300', 'EPHB2', 'EZH2', 'FGFR2', 'FGFR4', 'GNMT',
                                'HNF1B', 'HOXB13', 'HPCX', 'IGF2', 'ITGA6', 'KLF6', 'LRP2', 'MAD1L1', 'MED12', 'MSMB', 'MSR1', 'MXI1', 'NBN', 'PCAP', 
                                'PCNT', 'PLXNB1', 'PTEN', 'RNASEL', 'SRD5A2', 'STAT3', 'TGFBR1', 'WRN', 'WT1', 'ZFHX3')


# 
# breastQuery <- queryMany(goldStandardBreastCancer, scopes="symbol", fields=c("uniprot", "ensembl.gene", "reporter"), species="human")
# prostateQuery <- queryMany(goldStandardProstateCancer, scopes="symbol", fields=c("uniprot", "ensembl.gene", "reporter"), species="human")'
# 
# 
# 
# why do these queries cme back with some info #### when done in batches but not one at a time
# 
# thisGene <- featureData[1, "Gene ID"]
# geneSearch <- getGene(thisGene)

goldstandardprostateaffymapping = AnnotationDbi::select(hgu133a.db,keys=rownames(affy_exp),"SYMBOL")
goldstandardprostateaffynames = goldstandardprostateaffymapping$PROBEID[which(goldstandardprostateaffymapping$SYMBOL %in% goldStandardProstateCancer)]

goldstandardmappercluster = (lapply(goldstandardprostateaffynames,getVertexForGene))
names(goldstandardmappercluster) = goldstandardprostateaffynames
goldstandardmappercluster = unlist(goldstandardmappercluster)

goldstandardhcluster = hclusters.clusts[which(names(hclusters.clusts) %in% goldstandardprostateaffynames)]

goldstandardkcluster = kclust$cluster[which(names(kclust$cluster) %in% goldstandardprostateaffynames)]
