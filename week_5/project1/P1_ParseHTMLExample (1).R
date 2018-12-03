## Project 1
## An example for parsing the html file
##
## http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1005817

library(RCurl)
library(XML)
input = "http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1005817"

html <- getURL(input, followlocation=TRUE)
 
# parse html
doc = htmlParse(html, asText=TRUE)
Title = xpathSApply(doc, "//*[@id='artTitle']", xmlValue)
Authors = xpathSApply(doc, "//*[@id='floatAuthorList']", xmlValue)
## remove some special characters in the Authors to get clean text
Authors = gsub("\n", " ", Authors)
## Split the Authors by "   ,   " to get every author (See R regular expression for more information)
Authors = strsplit(Authors,'\\s*,\\s*')

PubDate = xpathSApply(doc, "//*[@id='artPubDate']", xmlValue)
## Get clean date
PubDate = gsub('Published:\\s*', '', PubDate)

Abstract = xpathSApply(doc, "//*[@class='abstract toc-section']/*[@title='Abstract']/../p", xmlValue)
##


## Running Results
# >
# > Title
# [1] "The Zinc-Finger Protein SOP1 Is Required for a Subset of the Nuclear Exosome Functions in Arabidopsis"
# > Authors
# [[1]]
 # [1] "Kian Hématy"           "Yannick Bellec"        "Ram Podicheti"         "Nathalie Bouteiller"   "Pauline Anne"          "Céline Morineau"       "Richard P. Haslam"     "Frederic Beaudoin"    
 # [9] "Johnathan A. Napier"   "Keithanne Mockaitis  "

# > PubDate
# [1] "February 1, 2016"
# > Abstract
# [1] "Correct gene expression requires tight RNA quality control both at transcriptional and post-transcriptional levels. Using a splicing-defective allele of PASTICCINO2 (PAS2), a gene essential for plant development, we isolated suppressor mutations modifying pas2-1 mRNA profiles and restoring wild-type growth. Three suppressor of pas2 (sop) mutations modified the degradation of mis-spliced pas2-1 mRNA species, allowing the synthesis of a functional protein. Cloning of the suppressor mutations identified the core subunit of the exosome SOP2/RRP4, the exosome nucleoplasmic cofactor SOP3/HEN2 and a novel zinc-finger protein SOP1 that colocalizes with HEN2 in nucleoplasmic foci. The three SOP proteins counteract post-transcriptional (trans)gene silencing (PTGS), which suggests that they all act in RNA quality control. In addition, sop1 mutants accumulate some, but not all of the misprocessed mRNAs and other types of RNAs that are observed in exosome mutants. Taken together, our data show that SOP1 is a new component of nuclear RNA surveillance that is required for the degradation of a specific subset of nuclear exosome targets."
# > 