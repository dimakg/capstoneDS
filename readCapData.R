readCapData<-function(path){
        
        ##reading JSON file
        data <- stream_in(file(path));
        
        ##removing nested data frames
        data<-removeNested(data)
        
        return(data);      
}