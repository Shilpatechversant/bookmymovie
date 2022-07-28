
       <cfinclude  template = "movie_header.cfm"  runOnce = "true">  
          <!-- Main content -->
        <div class="clearfix"></div>
        <!-- Search bar -->        
        <section class="container">
            <div class="col-sm-12">
                <div class="clearfix"></div>
                
                       <!-- Main content -->
                <form class="user" 
                       method="post" 
                       name="loginForm" 
                       action="../../cfc/login.cfc?method=insertData"
                       onsubmit="return validateClientForm()">
                 <div class="clearfix"></div>
                    <div class="field-wrap">
                        <h2 class="page-heading">Register Here</h2>
                        <label>Email</label>
                        <input type='email' placeholder='Email' autocomplete="off" name='user_email' id="useremail" class="col-sm-12" 
                         onchange="validateClientEmail();" required>
                        <p class="email_alert text-danger"></p>
                        <label>Password</label>
                        <input type='password' autocomplete="off" placeholder='Password' name='user_password' class="col-sm-12">
                          <hr>
                  <button type='submit'  class="btn btn-md btn--warning ">sign in</button>  
                     </div>
                  
                </form>
            </div>
            <div class="clearfix"></div>
       </section>

    <cfinclude  template = "movie_footer.cfm"  runOnce = "true">  


 