library(tm)
library(SnowballC)
library(wordcloud)

llod<- read.csv(file = "/home/andrea/LSB/Compendio_datos_total.csv", stringsAsFactors = F)

jeopCorpus <- Corpus(VectorSource(llod$V1.3))

jeopCorpus <- tm_map(jeopCorpus, PlainTextDocument)

jeopCorpus <- tm_map(jeopCorpus, removePunctuation)
jeopCorpus <- tm_map(jeopCorpus, removeWords, stopwords('english'))

jeopCorpus <- tm_map(jeopCorpus, stemDocument)

wordcloud(jeopCorpus, max.words = 200, random.order = FALSE)

jeopCorpus <- tm_map(jeopCorpus, removeWords, c('the', 'this', stopwords('english')))