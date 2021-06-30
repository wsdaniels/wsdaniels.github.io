find.best.model <- function(data.matrix,
                            response, 
                            num.cores.to.use,
                            run.in.parallel){
  
  X <- scale(data.matrix)
  y <- response$anomaly_co
  
  lseq <- function(from, to, length.out) {
    exp(seq(log(from), log(to), length.out = length.out))
  }
  
  gamma.vals <- lseq(1.001, 18, length.out = 140)[1:88]
  ebic.vals <-  round(1000*(1-lseq(1, 0.001, length.out = 16)[1:11]))/1000
  
  form.mat <- matrix(NA, nrow = length(gamma.vals), ncol = length(ebic.vals))
  crit.mat <- matrix(NA, nrow = length(gamma.vals), ncol = length(ebic.vals))
  
  for (a in 1:length(ebic.vals)){
    
    start.time <- Sys.time()
    print(paste0("Started ebic gamma ", a, " / ", length(ebic.vals), " at ", start.time))
    
    if (run.in.parallel){
      cl <- makeCluster(num.cores.to.use)
      registerDoParallel(cl)
      output <- foreach(b = 1:length(gamma.vals)) %dopar% {
        
        ramp.fit <- RAMP::RAMP(X = X, y = y,
                               penalty = "MCP",
                               tune = "EBIC",
                               n.lambda = 500,
                               ebic.gamma = ebic.vals[a],
                               gamma = gamma.vals[b])   
        
        # CREATE LM FORMULA FROM RAMP OUTPUT
        #------------------------------------------------------------------
        main.terms <- ramp.fit$mainInd
        main.terms <- names(data.matrix)[main.terms]
        
        interactions <- ramp.fit$interInd
        if (!is.null(interactions)){
          for (i in 1:length(interactions)){
            
            this.term <- interactions[i]
            these.subterms <- as.integer(strsplit(this.term, "X")[[1]][2:3])
            these.subterms <- names(data.matrix)[these.subterms]
            
            if (these.subterms[1] != these.subterms[2]){
              this.term <- paste(these.subterms, collapse = ":")
            } else {
              this.term <- paste0("I(", these.subterms[1], "^2)")
            }
            
            interactions[i] <- this.term
          }
        }
        
        if (!is.null(interactions)){
          model.string <- paste( paste(main.terms, collapse = " + "),
                                 paste(interactions, collapse = " + "),
                                 sep = " + ")
        } else {
          model.string <- paste(main.terms, collapse = " + ")
        }
        
        model.string <- paste0("co ~ ", model.string)
        
        list(formula = model.string,
             crit = ramp.fit$cri.list[ramp.fit$cri.loc])
      }
      
      stopCluster(cl)
      
    } else {
      output <- vector(mode = "list", length = length(gamma.vals))
      
      for (b in 1:length(gamma.vals)){
        
        ramp.fit <- RAMP::RAMP(X = X, y = y,
                               penalty = "MCP",
                               tune = "EBIC",
                               n.lambda = 500,
                               ebic.gamma = ebic.vals[a],
                               gamma = gamma.vals[b])   
        
        # CREATE LM FORMULA FROM RAMP OUTPUT
        #------------------------------------------------------------------
        main.terms <- ramp.fit$mainInd
        main.terms <- names(data.matrix)[main.terms]
        
        interactions <- ramp.fit$interInd
        if (!is.null(interactions)){
          for (i in 1:length(interactions)){
            
            this.term <- interactions[i]
            these.subterms <- as.integer(strsplit(this.term, "X")[[1]][2:3])
            these.subterms <- names(data.matrix)[these.subterms]
            
            if (these.subterms[1] != these.subterms[2]){
              this.term <- paste(these.subterms, collapse = ":")
            } else {
              this.term <- paste0("I(", these.subterms[1], "^2)")
            }
            
            interactions[i] <- this.term
          }
        }
        
        if (!is.null(interactions)){
          model.string <- paste( paste(main.terms, collapse = " + "),
                                 paste(interactions, collapse = " + "),
                                 sep = " + ")
        } else {
          model.string <- paste(main.terms, collapse = " + ")
        }
        
        model.string <- paste0("co ~ ", model.string)
        
        output[[b]] <- list(formula = model.string,
                            crit = ramp.fit$cri.list[ramp.fit$cri.loc])
      }
    }
    
    for (b in 1:length(output)){
      form.mat[b,a] <- output[[b]]$formula
      crit.mat[b,a] <- output[[b]]$crit
    }
    
    rm(output)
    gc()
    
    time.diff <- Sys.time() - start.time
    print(paste0("previous ebic.val took this long: ", time.diff))
    
  }
  
  
  min.ind.vec <- apply(crit.mat, 2, which.min)
  
  best.form.list <- vector(mode = "list", length = length(ebic.vals))
  
  lm.data.matrix <- as.data.frame(cbind(y, X))
  names(lm.data.matrix)[1] <- "co"
  
  
  for (i in 1:length(ebic.vals)){
    this.best.form <- formula(form.mat[min.ind.vec[i], i])
    best.form.list[[i]] <- lm(this.best.form, data = lm.data.matrix)
  }
  
  
  new.form <- vector(length = length(ebic.vals))
  new.form[1] <- T
  
  for (i in 2:length(ebic.vals)){
    this.formula <- formula(best.form.list[[i]])
    previous.formula <- formula(best.form.list[[i-1]])
    new.form[i] <- this.formula != previous.formula
  }
  
  unique.forms <- best.form.list[new.form]
  
  to.return <- list(unique.forms = unique.forms,
                    form.mat = form.mat,
                    crit.mat = crit.mat)
  
  return(to.return)
  
}