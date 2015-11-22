removeNested<-function(nested_data){
        ##remove nested data.frames
        data <- flatten(nested_data,recursive = TRUE);
        
        ##replace all white spaces created by flatten function
        names(data) <- vapply(X = names(data),gsub,pattern = "[[:space:]]",
                             replacement = ".", FUN.VALUE = "vector");
        
        ##remove nested lists
        for(i in 1 : length(names(data))){
                if(is.list(data[,i])){
                       data[,i] <- vapply(data[,i],paste,collapse = "|",FUN.VALUE = "vector");
                }
                ind<-which(data[,i]=="");
                data[ind,i]<-NA;
        }
        
        return(data);
}