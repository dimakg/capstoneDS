makeNgramms<-function(data, n = 1, sparsity = 0){
        data<-VCorpus(VectorSource(data),readerControl = list(language="en"))
        ##transformation
        data <- tm_map(data,iconv,from = "UTF-8", to = "ASCII", sub = 'byte');
        data <- tm_map(data,removeNumbers)
        data<- tm_map(data,gsub,pattern = "<[a-zA-Z]*>", replacement = " ")
        data<- tm_map(data,gsub,pattern = "-+", replacement = " ")
        data<- tm_map(data,removePunctuation)
        data <- tm_map(data,stripWhitespace)
        data <- tm_map(data,tolower)
        data <- tm_map(data,stemDocument)
        data <- tm_map(data,gsub, pattern = "n t ", replacement = "n't ")
        data <- tm_map(data,removeWords, stopwords("english"))
        data <- tm_map(data, PlainTextDocument)
        
        biToken <- function(x) NGramTokenizer(x, Weka_control(min = n, max = n))
        bigrams <- TermDocumentMatrix(data, control = list(tokenize = biToken, removeSparseTerms = 0.4))     
        if(sparsity > 0){
                bigrams <- removeSparseTerms(bigrams,sparse = sparsity)
        }
        return(bigrams)
        
}