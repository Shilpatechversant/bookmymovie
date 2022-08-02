
  <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
        <section class="container">
            <div class="order-container">
                <div class="order">                  
                    <p class="order__title">Error Found !</p>
                </div>
                      <cfif message EQ hash('10','sha')>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                      Something went Wrong!!
                    </div> 

            </div>
        </section>
        
        <div class="clearfix"></div>
    </div>
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
            
                </div>

            </section>
        </div>
  
   <cfinclude  template = "movie_footer.cfm"  runOnce = "true">        

	