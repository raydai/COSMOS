#' filter_pkn_expressed_genes
#'
#' filters the non-expressed genes from the prior knowledge network
#'
#' @param expressed_genes_entrez  EntrezID of expressed genes
#' @param meta_pkn  COSMOS prior knowledge network

filter_pkn_expressed_genes <- function(expressed_genes_entrez,meta_pkn){
    
    print(paste("COSMOS: removing unexpressed nodes from PKN..."))    
    
    expressed_genes_entrez <- gsub("X","", expressed_genes_entrez)
    
    is_expressed <- function(x)
    {
        if(!grepl("Metab",x))
        {
            if(gsub("X","",x)  %in% expressed_genes_entrez)
            {
                return(x)
            } else
            {
                if(grepl("XGene[0-9]+__[0-9_]+$",x))
                {
                    genes <- gsub("XGene[0-9]+__","",x)
                    genes <- strsplit(genes,"_")[[1]]
                    if(sum(genes %in% expressed_genes_entrez) != length(genes))
                    {
                        return(NA)
                    } else
                    {
                        return(x)
                    }
                } else
                {
                    if(grepl("XGene[0-9]+__[0-9_]+reverse",x))
                    {
                        genes <- gsub("XGene[0-9]+__","",x)
                        genes <- gsub("_reverse","",genes)
                        genes <- strsplit(genes,"_")[[1]]
                        if(sum(genes %in% expressed_genes_entrez) != length(genes))
                        {
                            return(NA)
                        } else
                        {
                            return(x)
                        }
                    } else
                    {
                        return(NA)
                    }
                }
            }
        } else
        {
            return(x)
        }
    }
    
    # is_expressed("XGene3004__124975_91227")
    
    meta_pkn$source <- sapply(meta_pkn$source,is_expressed)
    n_removed = sum(!complete.cases(meta_pkn))
    meta_pkn <- meta_pkn[complete.cases(meta_pkn),]
    meta_pkn$target <- sapply(meta_pkn$target,is_expressed)
    meta_pkn <- meta_pkn[complete.cases(meta_pkn),]
    n_removed = n_removed + sum(!complete.cases(meta_pkn))
    print(paste("COSMOS:", n_removed, "interactions removed"))
    return(meta_pkn)
}
