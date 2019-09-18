ysample_figure <- function(x=128, y=10000,big_list,small_list,comp='sum',print=FALSE,header="Histogram") {

  

  








#sub sampling without replacment
GSDTS <- <- function(x=128, y=10000,big_list,small_list,comp='sum',print=FALSE,header="Histogram") {
  samplesy<-list()
  
  found_same<-FALSE
  
  for ( i in 1:y){
    tmp_sample <- sort(sample(big_list, x, replace=FALSE)) #sample and sort
    
    for (element in samplesy){
      if(identical(element,tmp_sample)){ #we do not want that... so try again
        found_same=TRUE
        break
      }
    }
    if(found_same){
      found_same<-FALSE
      next
    }
    #checked all already created elements and none was the same...
    samplesy[[i]] <- tmp_sample
    i <- i+1
  }
  
  #add ks p-value
  ks_res <- ks.test(big_list,small_list,alternative = "two.sided")$p.value
  if(ks_res == 0){
     p_plot <- "p<2.2e-16"
  }else{
     p_plot <- sprintf("p=%3.2f ", ks_res)
  }
  
  if(comp=='sum'){
    xmin <- min(sapply(samplesy,sum),sum(small_list))
    xmax <- max(sapply(samplesy,sum),sum(small_list))
    hist(sapply(samplesy, sum), xlim=c(xmin,xmax),main=header,xlab="Pscore sum",ylab="Frequency",col="gray")
    legend('topright', title='KS test', legend=p_plot, bty='n', cex=0.7)
    abline(v=sum(small_list),col="red")
    hist_data <- sapply(samplesy, sum)
    s_data <- sum(small_list)
    
  }else if(comp=='median'){
    xmin <- min(sapply(samplesy,median),median(small_list))
    xmax <- max(sapply(samplesy,median),median(small_list))
    hist(sapply(samplesy, median), xlim=c(xmin,xmax),main=header,xlab="median Pscore",ylab="Frequency",col="gray")
    legend('topright', title='KS test', legend=p_plot, bty='n', cex=0.7)
    abline(v=median(small_list),col="red")
    hist_data <- sapply(samplesy, median)
    s_data <- median(small_list)
    
  }else if(comp=='mean'){    
    xmin <- min(sapply(samplesy,mean),mean(small_list))
    xmax <- max(sapply(samplesy,mean),mean(small_list))
    hist(sapply(samplesy, mean), xlim=c(xmin,xmax),main=header,xlab="mean Pscore",ylab="Frequency",col="gray")
    legend('topright', title='KS test', legend=p_plot, bty='n', cex=0.7)
    abline(v=mean(small_list),col="red")
    hist_data <- sapply(samplesy, mean)
    s_data <- mean(small_list)
    
  }else{
    print("Choose either sum median or mean for comp value")
  }
  if(print){
    return(new("subsampling",
          hist=hist_data,
          sample=s_data))
  }
}
