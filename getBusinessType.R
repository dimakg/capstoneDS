getBusinessType <- function(data, type){
#         res <- numeric();
#         for(i in 1: length(data$categories)){                
#                 count <- pmatch(type,data$categories[i]);
#                 if(!is.na(count) & count>0){
#                         res <- c(res,i);                        
#                 }
#         }
        
        index <- grepl(x = data, pattern = type)       
        return(index);
}