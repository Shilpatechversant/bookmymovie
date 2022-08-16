<cfinclude  template = "header.cfm"  runOnce = "true"> 
<cfparam name="status" default="val">
    <cfif status EQ hash('1','sha')>
        <div class="alert alert-success alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Message Send Successfully!!
        </div> 
    </cfif>
     <cfif status EQ hash('2','sha')>
        <div class="alert alert-danger alert-dismissible">
            <a href="##" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Message Send Failed!!
        </div> 
    </cfif>
    <div class="contact-form-wrapper">
        <div class="container">
            <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                    <form id='cform' class="form row" method='post'  action="../../cfc/contact.cfc?method=contactUs">
                        <p class="form__title">Drop us a line</p>
                        <div class="col-sm-12">
                            <input type='text' placeholder='Your name' name='name' class="form__name">
                        </div>
                        <div class="col-sm-12">
                            <input type='email' placeholder='Your email' name='email' class="form__mail">
                        </div>
                        <div class="col-sm-12">
                            <input type='text' placeholder='Subject' name='subject' class="form__name">
                        </div>
                        <div class="col-sm-12">
                            <textarea placeholder="Your message" name="message" class="form__message"></textarea>
                        </div>
                        <button type="submit" class='btn btn-md btn--danger'>send message</button>
                    </form>
                </div>
            </div>
        </div>   
    </div>

    <div class="container text-white">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                
            </div>
        </div>	
    </div>
	</section>
<cfinclude  template = "footer.cfm"  runOnce = "true">  